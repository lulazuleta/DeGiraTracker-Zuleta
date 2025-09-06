USE degiratracker;

/*----------------------CREACION DE VISTAS---------------------------*/


/*Cantidad de tickets por usuario*/
	CREATE OR REPLACE VIEW vw_cantidad_ticket_x_usr AS
        select usuario_asignado as id_usuario_asignado,
        COUNT(*) as cantidad_tickets
        from tickets
		group by usuario_asignado;

/*tiempo promedio de resolucion por usuario*/

CREATE OR REPLACE VIEW vw_tiempo_promedio_trabajado AS
SELECT 
    usuario_asignado AS id_usuario,
    AVG(tiempo_trabajado) AS tiempo_promedio_trabajado
FROM tickets
GROUP BY usuario_asignado
ORDER BY id_usuario ASC;

/*creacion de vista de logs para los cambios de ticket vw_log_cambios*/

CREATE OR REPLACE VIEW vw_log_cambios as 

select cxt.id_cambio_x_ticket, cxt.id_ticket, tk.titulo_ticket, ti.nombre_tipo_incidencia as Nombre_Incidencia, pro.nombre_proyecto as Proyecto, 
	tdc.nombre_cambio, usu.usuario as Cambiado_por, cxt.dato_cambio_origen as Dato_origen, cxt.dato_cambio_destino as Dato_Destino,  cxt.fecha_cambio  
from tickets tk
	inner join cambios_x_ticket cxt
		on tk.id_ticket = cxt.id_ticket
	inner join tipos_de_cambio tdc
		on cxt.id_tipo_cambio = tdc.id_tipo_cambio
	inner join tipos_incidencias ti
		on tk.id_tipo_incidencia = ti.id_tipo_incidencia
	inner join usuarios usu
		on cxt.id_usuario_cambio = usu.id_usuario
	inner join proyectos pro
		on tk.id_proyecto = pro.id_proyecto; 
        
/*Cumplimiento de sla por ticket:(Comparacion entre tiempo de resolucion y sla configurado) vw_sla_x_ticket */ 


CREATE VIEW  vw_sla_x_ticket as
select tk.id_ticket, ti.nombre_tipo_incidencia, pri.nombre_prioridad, est.nombre_estado, 
pro.nombre_proyecto, usu.usuario, tk.estimacion_tiempo, tk.tiempo_trabajado, rs.id_regla_sla, 
rs.tiempo_resolucion, (if(tk.tiempo_trabajado <= rs.tiempo_resolucion, 'TRUE',  'FALSE')) AS cumplido
	from tickets  tk
inner join reglas_sla rs
	on tk.id_regla_sla = rs.id_regla_sla
inner join tipos_incidencias ti 
	on tk.id_tipo_incidencia = ti.id_tipo_incidencia
inner join prioridades pri
	on tk.id_prioridad = pri.id_prioridad
inner join estados est  
	on tk.id_estado = est.id_estado
inner join proyectos pro 
	on tk.id_proyecto = pro.id_proyecto
inner join usuarios usu 
	on tk.usuario_asignado = usu.id_usuario
order by id_ticket ASC;



/*estado actual del backlog de cada proyecto.*/

-- tickets por estado, por proyecto, sla vencido 

use degiratracker;

CREATE OR REPLACE VIEW vw_dashboard_total_tickets as

select tk.id_proyecto, pro.nombre_proyecto, usu.usuario,
(CASE 
	when tk.id_estado = 1 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as Abierto,
(CASE 
	when tk.id_estado = 2 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as Asignado,
(CASE 
	when tk.id_estado = 3
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as En_progreso,
(CASE 
	when tk.id_estado = 4 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as En_espera,
(CASE 
	when tk.id_estado = 5 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as En_validacion,
(CASE 
	when tk.id_estado = 6 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as Derivado,
(CASE 
	when tk.id_estado = 7 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as Cerrado,
(CASE 
	when tk.id_estado = 8 
		then concat(tk.id_ticket, ' - ',tk.titulo_ticket )
			ELSE NULL 
            END) as Reabierto,
rs.tiempo_resolucion as tiempo_segun_sla,
(	if (rs.tiempo_resolucion - tk.tiempo_trabajado >= 0, 'TRUE', 'FALSE')) cumple_sla,

(	if (rs.tiempo_resolucion - tk.tiempo_trabajado < 0, tk.tiempo_trabajado - rs.tiempo_resolucion, NULL)) diferencia_con_sla
from tickets tk 
	inner join usuarios usu 
		on tk.usuario_asignado = usu.id_usuario
	inner join reglas_sla rs
		on tk.id_regla_sla = rs.id_regla_sla
    inner join proyectos pro
		on tk.id_proyecto = pro.id_proyecto
    ; 



/*----------------------CREACION DE FUNCIONES---------------------------*/


-- Calcular tiempo restante de cada ticket.

DELIMITER $$

CREATE FUNCTION fn_tiempo_restante_ticket (idticket int)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE tiempo_restante INT;
    
    SET tiempo_restante = (select rs.tiempo_resolucion from degiratracker.reglas_sla rs 
							inner join degiratracker.tickets t 
                            on rs.id_regla_sla = t.id_regla_sla and t.id_ticket = idticket)- (select tiempo_trabajado 
																								from degiratracker.tickets 
                                                                                                where id_ticket = idticket);
    
    RETURN tiempo_restante;
    
END $$ 

DELIMITER ;

-- Tiempo promedio de resolucion de tickets por proyecto. (Esta funcion solo tiene en cuenta los tickets en estados "En validacion", "Cerrado" y "Cancelado"

DELIMITER $$

CREATE FUNCTION fn_tiempo_promedio_resolucion (idproyecto int)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
	DECLARE tiempo_promedio_resolucion decimal (3,2);

    
    SET tiempo_promedio_resolucion = (select SUM(tiempo_trabajado) as suma 
										from degiratracker.tickets 
                                        where id_proyecto = idproyecto) / (select count(*) from tickets where id_proyecto = idproyecto);
    
    RETURN tiempo_promedio_resolucion;
    
END $$ 

DELIMITER ;



/*----------------------CREACION DE STORE PROCEDURES---------------------------*/

/*Se genera un SP para cerrar tickets, el mismo valida que el ticket se encuentre actualmente en estado "En validación" ya que no debería pasar a cerrado estando en otros estados*/

DELIMITER $$
create procedure sp_cierre_ticket(IN numero_ticket int)

BEGIN 

	DECLARE estado_ticket int;

    
SELECT id_estado INTO estado_ticket
FROM tickets
WHERE id_ticket = numero_ticket;

	IF estado_ticket = 5 
    THEN 
		UPDATE  tickets SET id_estado = 7 WHERE id_ticket = numero_ticket;
        
	SELECT 'El estado del ticket fue actualizado correctamente.' AS mensaje_respuesta;
	ELSE 
        SELECT 'El estado actual del ticket no permite pasarlo a cerrado' AS mensaje_respuesta;
	END IF;
END $$
    
DELIMITER ;


/*Creación de SP para pasar a estado Cancelado cualquier ticket excepto los cerrados.*/
DELIMITER $$
create procedure sp_cancela_ticket(IN numero_ticket int)

BEGIN 

	DECLARE estado_ticket int;

    
SELECT id_estado INTO estado_ticket
FROM tickets
WHERE id_ticket = numero_ticket;

	IF estado_ticket != 7 
    THEN 
		UPDATE  tickets SET id_estado = 9 WHERE id_ticket = numero_ticket;
        
	SELECT 'El estado del ticket se pasó a Cancelado.' AS mensaje_respuesta;
	ELSE 
        SELECT 'No se pudo cancelar el ticket ya que el estado anterior era "Cerrado".' AS mensaje_respuesta;
	END IF;
END $$
    
DELIMITER ;

/*Se crea un sp que devuelva los tickets que tienen el sla vencido de un proyecto en particular (El id proyecto se pasa como parametro)*/

DELIMITER $$
CREATE PROCEDURE sp_tickets_vencidos(IN proyecto INT)
BEGIN

    DECLARE cant INT;


    SELECT COUNT(*) INTO cant
    FROM tickets t
    INNER JOIN reglas_sla rs 
        ON t.id_regla_sla = rs.id_regla_sla
    WHERE t.id_proyecto = proyecto
      AND t.tiempo_trabajado > rs.tiempo_resolucion;


    IF cant > 0 THEN
        SELECT t.*
        FROM tickets t
        INNER JOIN reglas_sla rs 
            ON t.id_regla_sla = rs.id_regla_sla
        WHERE t.id_proyecto = proyecto
          AND t.tiempo_trabajado > rs.tiempo_resolucion;
    ELSE
        SELECT 'No hay ningún ticket vencido' AS respuesta;
    END IF;
END $$
DELIMITER ;


/*----------------------CREACION DE TRIGGERS---------------------------*/

/*Actualizar fecha ultima modificacion*/


DELIMITER $$
CREATE TRIGGER trg_update_fecha_comentarios

BEFORE INSERT ON comentarios
FOR EACH ROW 
BEGIN 
		SET NEW.fecha_edicion = NOW();
        
	END$$
DELIMITER ;


/*-----------------------------------------*/


DELIMITER $$
CREATE TRIGGER trg_update_fecha_permisos

BEFORE INSERT ON permisos
FOR EACH ROW 
BEGIN 
		SET NEW.ultima_modificacion = NOW();
        
	END $$
DELIMITER ;


/*-----------------------------------------*/

DELIMITER $$
CREATE TRIGGER trg_update_fecha_usuarios

BEFORE INSERT ON usuarios
FOR EACH ROW 
BEGIN 
		SET NEW.ultima_modificacion = NOW();
        
	END $$
DELIMITER ;


/*Triggers para evitar eliminar datos sensibles y que por definicion deben prevalecer*/


DELIMITER $$
	CREATE TRIGGER trg_evitar_delete_proyectos
    
BEFORE DELETE ON proyectos
FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000'
    SET message_text = 'No se pueden borrar registros de esta tabla';
    
END $$
	DELIMITER ;




DELIMITER $$
	CREATE TRIGGER trg_evitar_delete_tickets
    
BEFORE DELETE ON tickets
FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000'
    SET message_text = 'No se pueden borrar registros de esta tabla';
    
END $$
	DELIMITER ;


DELIMITER $$
	CREATE TRIGGER trg_evitar_delete_usuarios
    
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000'
    SET message_text = 'No se pueden borrar registros de esta tabla';
    
END $$
	DELIMITER ;



DELIMITER $$
	CREATE TRIGGER trg_evitar_delete_roles
    
BEFORE DELETE ON roles
FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000'
    SET message_text = 'No se pueden borrar registros de esta tabla';
    
END $$
	DELIMITER ;

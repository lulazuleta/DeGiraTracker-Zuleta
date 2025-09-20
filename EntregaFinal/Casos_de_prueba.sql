USE Degiratracker;

/*CP Vistas */

select * from vw_cantidad_ticket_x_usr;

select * from vw_tiempo_promedio_trabajado;

select * from vw_log_cambios where nombre_incidencia = 'Soporte'; -- corregir el espacio

select * from vw_sla_x_ticket;
select * from vw_sla_x_ticket where nombre_prioridad = 'Baja';

select * from vw_dashboard_total_tickets ;

/*CP Store Procedures*/

call sp_cancela_ticket (9); -- Ticket en estado "Asignado"

call sp_cierre_ticket (1);

call sp_tickets_vencidos(2);


/*CP Triggers*/

delete  from usuarios where id_usuario = 1; -- Se intenta eliminar un registro de la tabla usuarios


select * from usuarios where id_usuario = 15; -- Se ve que el campo ultima_modificacion está vacio

update usuarios set contrasenia = 'Tito' where id_usuario = 15;

select * from usuarios where id_usuario = 15; -- Verificamos que despues del update se seteo la fecha de modificacion automaticamente.
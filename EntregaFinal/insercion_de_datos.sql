USE DEGIRATRACKER; 

-- Insercion Prioridades.

insert into degiratracker.prioridades values (1, 'Baja');
insert into degiratracker.prioridades values (2, 'Media');
insert into degiratracker.prioridades values (3, 'Alta');
insert into degiratracker.prioridades values (4, 'Critica');


-- Insercion de tipos_incidencias 
INSERT INTO DEGIRATRACKER.TIPOS_INCIDENCIAS VALUES (1,'Consulta','Consultas al equipo asignado');
INSERT INTO DEGIRATRACKER.TIPOS_INCIDENCIAS VALUES (2,'Soporte','Soporte por no poder utilizar la herramienta correctamente');
INSERT INTO DEGIRATRACKER.TIPOS_INCIDENCIAS VALUES (3,'Datos','Soporte sobre base de datos, ejecución de querys, consultas, etc');
INSERT INTO DEGIRATRACKER.TIPOS_INCIDENCIAS VALUES (4,'Solicitud','Solicitud de tareas programadas');
INSERT INTO DEGIRATRACKER.TIPOS_INCIDENCIAS VALUES (5,'Cambio','Solicitud de cambio en un producto');
INSERT INTO DEGIRATRACKER.TIPOS_INCIDENCIAS VALUES (6,'Analisis','Analisis sobre un problema presentado');



-- Populación tabla usuarios

INSERT INTO USUARIOS VALUES (1, ' jgomez', ' pass123', 1, '2024-01-10', '2025-01-05');
INSERT INTO USUARIOS VALUES (2, ' mrodriguez', ' pass123', 1, ' 2024-02-12', ' 2025-01-20');
INSERT INTO USUARIOS VALUES (3, ' lfernandez', ' pass123', 1, ' 2024-03-01', ' 2025-01-25');
INSERT INTO USUARIOS VALUES (4, ' cperalta', ' pass123', 1, ' 2024-03-15', ' 2025-01-30');
INSERT INTO USUARIOS VALUES (5, ' abustos', ' pass123', 1, ' 2024-04-05', ' 2025-01-28');
INSERT INTO USUARIOS VALUES (6, ' pmartinez', ' pass123', 1, ' 2024-04-22', ' 2025-01-27');
INSERT INTO USUARIOS VALUES (7, ' drodriguez', ' pass123', 1, ' 2024-05-14', ' 2025-01-29');
INSERT INTO USUARIOS VALUES (8, ' smolina', ' pass123', 1, ' 2024-05-30', ' 2025-01-31');
INSERT INTO USUARIOS VALUES (9, ' rquintero', ' pass123', 1, '2024-06-10', ' 2025-01-30');
INSERT INTO USUARIOS VALUES (10, ' egarcia', ' pass123', 1, ' 2024-07-01', ' 2025-01-26');
INSERT INTO USUARIOS VALUES (11, ' vcastro', ' pass123', 1, ' 2024-07-15', ' 2025-01-28');
INSERT INTO USUARIOS VALUES (12, ' mlopez', ' pass123', 1, ' 2024-08-01', ' 2025-01-29');
INSERT INTO USUARIOS VALUES (13, ' jmartin', ' pass123', 0, ' 2024-08-18', ' 2024-12-01');
INSERT INTO USUARIOS VALUES (14, ' gsuarez', ' pass123', 0, ' 2024-09-05', ' 2024-12-05');
INSERT INTO USUARIOS VALUES (15, 'Lulu', 'Lulu1234', 1, '2025-08-20', NULL);




-- Populación tabla detalle_personas

INSERT INTO DETALLE_PERSONAS VALUES (1,1, ' Juan', 'Gomez', 'jgomez@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (2,2, ' Maria', 'Rodriguez', 'mrodriguez@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (3,3, ' Luis', 'Fernandez', 'lfernandez@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (4,4, ' Carla', 'Peralta', 'cperalta@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (5,5, ' Ana', 'Bustos', 'abustos@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (6,6, ' Pedro', 'Martinez', 'pmartinez@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (7,7, ' Diego', 'Rodriguez', 'drodriguez@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (8,8, ' Sofia', 'Molina', 'smolina@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (9,9, ' Ricardo', 'Quintero', 'rquintero@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (10,10, 'Esteban', 'Garcia', 'egarcia@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (11,11, 'Valeria', 'Castro', 'vcastro@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (12,12, 'Marcos', ' Lopez', 'mlopez@mail.com');
INSERT INTO DETALLE_PERSONAS VALUES (13,15, 'Lucia', 'Zuleta', 'Lulu@bbdd.com');



-- Populación de tabla proyectos

INSERT INTO PROYECTOS VALUES (1, ' Plataforma E-commerce', ' Cliente A', ' 2024-01-15', 1);
INSERT INTO PROYECTOS VALUES (2, ' CRM Ventas', ' Cliente B', ' 2024-03-01', 1);
INSERT INTO PROYECTOS VALUES (3, ' App Movil Soporte', ' Cliente C', ' 2024-04-10', 1);
INSERT INTO PROYECTOS VALUES (4, ' Datawarehouse BI', ' Cliente D', ' 2024-05-20', 1);
INSERT INTO PROYECTOS VALUES (5, ' Portal Interno RH', ' Cliente E', ' 2024-07-01', 1);
INSERT INTO PROYECTOS VALUES (6, ' Sistema Facturación', ' Cliente F', ' 2024-09-15', 0);





-- Populacion tabla roles

insert into roles values (1, 'Admin', ' Acceso total al sistema', 1);
insert into roles values (2, 'Project Manager', ' Gestión de proyectos y reportes', 1);
insert into roles values (3, 'Developer', ' Desarrollo y resolución de tickets', 1);
insert into roles values (4, 'QA Tester', ' Validación y testing de tickets', 1);
insert into roles values (5, 'Cliente', ' Acceso limitado a sus tickets lectura y comentarios', 1);
insert into roles values (6, 'Soporte', 'Resolución de tickets, derivación de tickets', 1);
insert into roles values (7, 'PO', 'Gestion de tickets, resolución de tickets, derivación, acceso a reportes, seguimiento', 1);



-- PERMISOS

 INSERT INTO PERMISOS VALUES (1, ' Ver Tickets', ' /tickets/view', 1, ' 2024-01-01', 1, ' 2025-01-01');
 INSERT INTO PERMISOS VALUES (2, ' Crear Ticket', ' /tickets/create', 1, ' 2024-01-01', 1, ' 2025-01-01');
 INSERT INTO PERMISOS VALUES (3, ' Editar Ticket', ' /tickets/edit', 1, ' 2024-01-01', 1, ' 2025-01-01');
 INSERT INTO PERMISOS VALUES (4, ' Eliminar Ticket', ' /tickets/delete', 1, ' 2024-01-01', 1, ' 2025-01-01');
 INSERT INTO PERMISOS VALUES (5, ' Ver Reportes', ' /reports/view', 1, ' 2024-01-01', 2, ' 2025-01-01');
 INSERT INTO PERMISOS VALUES (6, ' Configuración SLA', ' /config/sla', 1, ' 2024-01-01', 1, ' 2025-01-01');
 
 
 
 
 -- USUARIOS POR ROLES
 
  INSERT INTO USUARIOS_X_ROLES VALUES (1, 6);
 INSERT INTO USUARIOS_X_ROLES VALUES (2, 7);
 INSERT INTO USUARIOS_X_ROLES VALUES (3, 6);
 INSERT INTO USUARIOS_X_ROLES VALUES (4, 3);
 INSERT INTO USUARIOS_X_ROLES VALUES (5, 4);
 INSERT INTO USUARIOS_X_ROLES VALUES (6, 3);
 INSERT INTO USUARIOS_X_ROLES VALUES (7, 2);
 INSERT INTO USUARIOS_X_ROLES VALUES (8, 5);
 INSERT INTO USUARIOS_X_ROLES VALUES (9, 6);
 INSERT INTO USUARIOS_X_ROLES VALUES (10, 4);
 INSERT INTO USUARIOS_X_ROLES VALUES (11, 2);
 INSERT INTO USUARIOS_X_ROLES VALUES (12, 3);
 INSERT INTO USUARIOS_X_ROLES VALUES (15, 1);



-- ROLES POR PERMISOS

INSERT INTO ROLES_X_PERMISOS VALUES (1, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (1, 2);
INSERT INTO ROLES_X_PERMISOS VALUES (1, 3);
INSERT INTO ROLES_X_PERMISOS VALUES (1, 4);
INSERT INTO ROLES_X_PERMISOS VALUES (1, 5);
INSERT INTO ROLES_X_PERMISOS VALUES (1, 6);
INSERT INTO ROLES_X_PERMISOS VALUES (2, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (2, 5);
INSERT INTO ROLES_X_PERMISOS VALUES (3, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (3, 2);
INSERT INTO ROLES_X_PERMISOS VALUES (3, 3);
INSERT INTO ROLES_X_PERMISOS VALUES (4, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (4, 3);
INSERT INTO ROLES_X_PERMISOS VALUES (5, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (5, 2);
INSERT INTO ROLES_X_PERMISOS VALUES (6, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (6, 2);
INSERT INTO ROLES_X_PERMISOS VALUES (6, 3);
INSERT INTO ROLES_X_PERMISOS VALUES (7, 1);
INSERT INTO ROLES_X_PERMISOS VALUES (7, 2);
INSERT INTO ROLES_X_PERMISOS VALUES (7, 4);
INSERT INTO ROLES_X_PERMISOS VALUES (7, 5);
INSERT INTO ROLES_X_PERMISOS VALUES (7, 6);



-- Insert estados
INSERT INTO Estados (id_estado, nombre_estado, detalle_estado) VALUES
(1, 'Abierto', 'El ticket fue creado y está pendiente de asignación'),
(2, 'Asignado', 'El ticket fue asignado a una persona para que lo trabaje'),
(3, 'En Progreso', 'El ticket está siendo trabajado'),
(4, 'En Espera', 'El ticket está a la espera de información adicional'),
(5, 'En Validacion', 'El ticket debe ser validado por el usuario'),
(6, 'Derivado', 'Derivado a otro equipo'),
(7, 'Cerrado', 'El ticket fue cerrado definitivamente'),
(8, 'Reabierto', 'El ticket fue reabierto luego de haber sido resuelto'),
(9, 'Cancelado', 'La solicitud fue cancelada');



-- Insert tipos_de_cambio

INSERT INTO tipos_de_cambio (id_tipo_cambio, nombre_cambio, descripcion_cambio) VALUES
(1, 'Cambio de Estado', 'El ticket cambió de un estado a otro'),
(2, 'Cambio de Prioridad', 'El ticket cambió de nivel de prioridad'),
(3, 'Cambio de Usuario Asignado', 'El ticket cambió de responsable'),
(4, 'Cambio de Descripción', 'La descripción del ticket fue modificada'),
(5, 'Cambio de Título', 'El título del ticket fue modificado'),
(6, 'Cambio de Proyecto', 'El ticket fue movido a otro proyecto');


-- Insert reglas_sla

INSERT INTO reglas_sla (id_regla_sla, id_proyecto, id_prioridad, id_tipo_incidencia, tiempo_resolucion, activo) VALUES
(1, 1, 1, 1, 4.00, 1),
(2, 1, 1, 2, 7.00, 1),
(3, 1, 1, 3, 1.00, 1),
(4, 1, 2, 1, 6.00, 1),
(5, 1, 2, 2, 6.50, 1),
(6, 1, 2, 3, 2.00, 1),
(7, 1, 3, 1, 4.00, 1),
(8, 1, 3, 2, 16.00, 1),
(9, 1, 3, 3, 12.00, 1),
(10, 2, 1, 1, 1.00, 1),
(11, 2, 1, 2, 5.00, 1),
(12, 2, 1, 3, 4.40, 1),
(13, 2, 2, 1, 13.00, 1),
(14, 2, 2, 2, 6.00, 1),
(15, 2, 2, 3, 4.00, 1),
(16, 2, 3, 1, 2.00, 1),
(17, 2, 3, 2, 3.00, 1),
(18, 2, 3, 3, 8.00, 1),
(19, 3, 1, 1, 9.00, 1),
(20, 3, 1, 2, 5.20, 1),
(21, 3, 1, 3, 6.50, 1),
(22, 3, 2, 1, 11.00, 1),
(23, 3, 2, 2, 12.00, 1),
(24, 3, 2, 3, 3.00, 1),
(25, 3, 3, 1, 2.00, 1),
(26, 3, 3, 2, 1.50, 1),
(27, 3, 3, 3, 2.50, 1),
(28, 4, 1, 1, 10.00, 1),
(29, 4, 1, 2, 15.00, 1),
(30, 4, 1, 3, 16.00, 1),
(31, 4, 2, 1, 12.00, 1),
(32, 4, 2, 2, 32.00, 1),
(33, 4, 2, 3, 18.00, 1),
(34, 4, 3, 1, 15.00, 1),
(35, 4, 3, 2, 25.00, 1),
(36, 4, 3, 3, 22.00, 1),
(37, 5, 1, 1, 16.00, 1),
(38, 5, 1, 2, 40.00, 1),
(39, 5, 1, 3, 20.00, 1),
(40, 5, 2, 1, 18.00, 1),
(41, 5, 2, 2, 16.00, 1),
(42, 5, 2, 3, 4.00, 1),
(43, 5, 3, 1, 4.00, 1),
(44, 5, 3, 2, 8.00, 1),
(45, 5, 3, 3, 8.00, 1),
(46, 1, 1, 1, 7.00, 0),
(47, 3, 2, 2, 17.00, 0),
(48, 5, 3, 3, 20.00, 0);



-- insert tickets: 

INSERT INTO TICKETS VALUES(1, ' Error login', ' Usuario no puede loguearse',1,2,1,1,3,2, '2025-01-15' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(2, ' Nueva funcionalidad', ' Agregar botón de exportación',2,3,2,2,4,1, '2025-01-16' ,8.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(3, ' Incidencia pagos', ' Error en integración con PayPal',1,1,1,1,6,2, '2025-01-17' ,10.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(4, ' Bug visual', ' Problema con CSS en dashboard',1,3,2,3,7,3, '2025-01-17' ,3.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(5, ' Soporte cliente', ' Solicitan capacitación',3,2,3,5,8,11, '2025-01-18' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(6, ' Error reporte', ' Reporte no carga correctamente',1,2,1,4,9,2, '2025-01-18' ,4.00,1.00,2, NULL);
INSERT INTO TICKETS VALUES(7, ' Mejora UI', ' Cambiar colores en login',2,3,2,3,10,4, '2025-01-19' ,7.00,2.00,4, NULL);
INSERT INTO TICKETS VALUES(8, ' Error API', ' Endpoint devuelve 500',1,1,1,1,11,2, '2025-01-20' ,12.00,5.00,3, NULL);
INSERT INTO TICKETS VALUES(9, ' Ticket relacionado', ' Revisar bug en PayPal',1,1,2,1,6,3, '2025-01-20' ,10.00,3.00,3,3);
INSERT INTO TICKETS VALUES(10, ' Nueva integración', ' Agregar Google Maps',2,2,3,2,12,1, '2025-01-21' ,15.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(11, ' Capacitación interna', ' Formación en CRM',3,2,3,5,8,11, '2025-01-21' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(12, ' Error mobile', ' App se cierra en Android 12',1,1,1,3,6,2, '2025-01-22' ,9.00,3.00,4, NULL);
INSERT INTO TICKETS VALUES(13, ' Bug permisos', ' Usuarios sin rol ven datos',1,2,1,1,7,2, '2025-01-22' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(14, ' Mejora performance', ' Optimizar consulta SQL',2,3,2,4,9,4, '2025-01-23' ,10.00,4.00,2, NULL);
INSERT INTO TICKETS VALUES(15, ' Error deploy', ' Falla en despliegue a producción',1,1,1,2,10,2, '2025-01-24' ,12.00,5.00,3, NULL);
INSERT INTO TICKETS VALUES(16, ' Documentación', ' Actualizar manual de usuario',3,2,3,5,8,11, '2025-01-24' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(17, ' Error login cliente', ' Cliente no accede al portal',1,2,1,5,12,2, '2025-01-25' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(18, ' Nueva métrica', ' Agregar KPI de ventas',2,3,2,4,9,1, '2025-01-26' ,8.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(19, ' Incidencia pagos', ' Error con MercadoPago',1,1,1,1,6,2, '2025-01-26' ,10.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(20, ' Bug visual dashboard', ' Tablas descuadradas',1,3,2,3,7,3, '2025-01-27' ,3.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(21, ' Capacitación externa', ' Entrenamiento cliente A',3,2,3,5,8,11, '2025-01-27' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(22, ' Error datos', ' Exportación CSV genera vacío',1,2,1,2,10,2, '2025-01-28' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(23, ' Mejora buscador', ' Implementar búsqueda avanzada',2,3,2,1,7,4, '2025-01-28' ,12.00,3.00,2, NULL);
INSERT INTO TICKETS VALUES(24, ' Error email', ' Notificaciones no llegan',1,1,1,4,9,2, '2025-01-29' ,9.00,3.00,3, NULL);
INSERT INTO TICKETS VALUES(25, ' Ticket duplicado', ' Revisar exportación CSV',1,2,2,2,10,3, '2025-01-29' ,5.00,1.00,1,22);
INSERT INTO TICKETS VALUES(26, ' Nueva función', ' Exportar a PDF',2,2,3,2,12,1, ' 025-01-30' ,15.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(27, ' Error mobile iOS', ' Falla en iPhone 13',1,1,1,3,6,2, '2025-01-30' ,8.00,3.00,4, NULL);
INSERT INTO TICKETS VALUES(28, ' Bug roles', ' Usuarios ven datos ajenos',1,2,1,1,7,2, '2025-01-31' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(29, ' Mejora reportes', ' Gráficos dinámicos',2,3,2,4,9,4, '2025-01-31' ,10.00,2.00,2, NULL);
INSERT INTO TICKETS VALUES(30, ' Error deploy QA', ' Fallo en staging',1,1,1,2,10,2, '2025-02-01' ,12.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(31, ' Bug CSS', ' Estilos rotos en Firefox',1,3,2,3,7,3, '2025-02-02' ,4.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(32, ' Error permisos', ' Usuario ve datos restringidos',1,1,1,1,6,2, '2025-02-02' ,6.00,3.00,3, NULL);
INSERT INTO TICKETS VALUES(33, ' Mejora login', ' Agregar autenticación 2FA',2,3,2,2,12,4, '2025-02-03' ,12.00,2.00,2, NULL);
INSERT INTO TICKETS VALUES(34, ' Error exportación', ' Archivos Excel dañados',1,2,1,4,9,2, '2025-02-03' ,7.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(35, ' Ticket relacionado export', ' Ver Excel',1,2,2,4,9,3, '2025-02-03' ,7.00,1.00,1,34);
INSERT INTO TICKETS VALUES(36, ' Capacitación soporte', ' Formación equipo B',3,2,3,5,8,11, '2025-02-04' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(37, ' Bug API auth', ' Error 401',1,1,1,1,7,2, '2025-02-04' ,9.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(38, ' Nueva métrica', ' Agregar KPI satisfacción',2,3,2,2,10,1, '2025-02-05' ,10.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(39, ' Error mobile tablet', ' Fallo en iPad',1,1,1,3,6,2, '2025-02-05' ,9.00,3.00,4, NULL);
INSERT INTO TICKETS VALUES(40, ' Bug dashboard', ' Gráficos no cargan',1,2,1,4,9,2, '2025-02-06' ,6.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(41, ' Nueva integración', ' LinkedIn API',2,2,3,2,12,1, '2025-02-06' ,14.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(42, ' Error base de datos', ' Deadlock detectado',1,1,1,1,6,2, ' 025-02-07' ,12.00,5.00,3, NULL);
INSERT INTO TICKETS VALUES(43, ' Mejora UX', ' Wizard de registro',2,3,2,3,7,4, '2025-02-07' ,8.00,1.00,2, NULL);
INSERT INTO TICKETS VALUES(44, ' Bug email', ' Correos duplicados',1,2,1,2,10,2, '2025-02-08' ,5.00,1.00,1, NULL);
INSERT INTO TICKETS VALUES(45, ' Ticket duplicado email', ' Revisar duplicados',1,2,2,2,10,3, '2025-02-08' ,5.00,1.00,1,44);
INSERT INTO TICKETS VALUES(46, ' Documentación API', ' Redactar swagger',3,2,3,5,8,11, '2025-02-08' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(47, ' Error pagos stripe', ' Falla integración',1,1,1,1,7,2, '2025-02-09' ,10.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(48, ' Bug estilo mobile', ' Botón cortado',1,3,2,3,6,3, '2025-02-09' ,3.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(49, ' Mejora reportes', ' Filtros avanzados',2,3,2,4,9,4, '2025-02-10' ,12.00,3.00,2, NULL);
INSERT INTO TICKETS VALUES(50, ' Error deploy prod', ' Fallo en live',1,1,1,2,10,2, '2025-02-10' ,14.00,6.00,3, NULL);
INSERT INTO TICKETS VALUES(51, ' Capacitación UX', ' Curso diseño',3,2,3,5,8,11, '2025-02-11' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(52, ' Bug API pagos', ' Error 503',1,1,1,1,6,2, '2025-02-11' ,10.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(53, ' Nueva función', ' Exportar JSON',2,2,3,2,12,1, '2025-02-12' ,15.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(54, ' Error mobile android', ' Crash Samsung',1,1,1,3,7,2, '2025-02-12' ,8.00,3.00,4, NULL);
INSERT INTO TICKETS VALUES(55, ' Bug permisos admin', ' Acceso sin rol',1,2,1,1,6,2, '2025-02-13' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(56, ' Mejora performance DB', ' Optimizar índices',2,3,2,4,9,4, '2025-02-13' ,12.00,2.00,2, NULL);
INSERT INTO TICKETS VALUES(57, ' Error deploy rollback', ' Revertir release',1,1,1,2,10,2, '2025-02-14' ,14.00,5.00,3, NULL);
INSERT INTO TICKETS VALUES(58, ' Documentación cliente', ' Redactar manual',3,2,3,5,8,11, '2025-02-14' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(59, ' Error login múltiple', ' Sesiones duplicadas',1,2,1,5,12,2, '2025-02-15' ,5.00,2.00,1, NULL);
INSERT INTO TICKETS VALUES(60, ' Nueva métrica churn', ' Calcular bajas',2,3,2,4,9,1, '2025-02-16' ,10.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(61, ' Incidencia pagos duplicados', ' Stripe doble',1,1,1,1,6,2, '2025-02-16' ,12.00,5.00,3, NULL);
INSERT INTO TICKETS VALUES(62, ' Bug UI menú', ' Botón cortado',1,3,2,3,7,3, '2025-02-17' ,3.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(63, ' Error notificaciones', ' Push no llega',1,2,1,4,9,2, '2025-02-17' ,8.00,3.00,1, NULL);
INSERT INTO TICKETS VALUES(64, ' Ticket relacionado push', ' Revisar notificaciones',1,2,2,4,9,3, '2025-02-17' ,8.00,1.00,1,63);
INSERT INTO TICKETS VALUES(65, ' Mejora buscador', ' Indexar ElasticSearch',2,3,2,2,12,4, '2025-02-18' ,12.00,2.00,2, NULL);
INSERT INTO TICKETS VALUES(66, ' Error backup', ' Falla restauración',1,1,1,1,7,2, '2025-02-18' ,14.00,6.00,3, NULL);
INSERT INTO TICKETS VALUES(67, ' Bug frontend', ' Botón oculto',1,3,2,3,6,3, '2025-02-19' ,3.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(68, ' Nueva función', ' Exportar XML',2,2,3,2,12,1, '2025-02-19' ,15.00,0.00,2, NULL);
INSERT INTO TICKETS VALUES(69, ' Error API timeout', ' Respuesta lenta',1,1,1,1,6,2, '2025-02-20' ,10.00,4.00,3, NULL);
INSERT INTO TICKETS VALUES(70, ' Bug visual footer', ' Pie cortado',1,3,2,3,7,3, '2025-02-20' ,3.00,1.00,4, NULL);
INSERT INTO TICKETS VALUES(71, ' Mejora dashboard', ' KPIs interactivos',2,3,2,4,9,4, '2025-02-21' ,12.00,2.00,2, NULL);
INSERT INTO TICKETS VALUES(72, ' Error deploy hotfix', ' Fallo patch',1,1,1,2,10,2, '2025-02-21' ,14.00,5.00,3, NULL);
INSERT INTO TICKETS VALUES(73, ' Capacitación externa B', ' Cliente B training',3,2,3,5,8,11, '2025-02-22' ,6.00,0.00,5, NULL);
INSERT INTO TICKETS VALUES(74, ' Error datos duplicados', ' Doble registro en DB',1,1,1,1,6,2, '2025-02-22' ,9.00,3.00,3, NULL);
INSERT INTO TICKETS VALUES(75, ' Error permisos cliente', ' Cliente accede a otro proyecto',1,1,1,5,7,2, '2025-02-23' ,8.00,3.00,3, NULL);


-- Insert comentarios

INSERT INTO Comentarios (id_comentario, comentario, creado_por, id_ticket, fecha_creacion, fecha_edicion) VALUES
(1, 'El usuario reportó el error y se registró el ticket.', 1, 1, '2025-01-02 09:15:00', NULL),
(2, 'Se asignó el ticket al equipo de soporte.', 2, 1, '2025-01-02 10:00:00', NULL),
(3, 'El cliente pidió actualización sobre el estado.', 3, 2, '2025-01-03 11:30:00', NULL),
(4, 'Ticket pasado a validación.', 4, 3, '2025-01-03 14:00:00', NULL),
(5, 'Cliente indicó que el error persiste.', 5, 4, '2025-01-04 09:40:00', NULL),
(6, 'Se agregó información técnica para resolver el problema.', 2, 5, '2025-01-04 13:00:00', NULL),
(7, 'Cambio de prioridad solicitado.', 6, 6, '2025-01-05 09:20:00', NULL),
(8, 'Se solicitó documentación adicional.', 7, 7, '2025-01-05 16:00:00', NULL),
(9, 'Cliente aprobó la solución.', 3, 8, '2025-01-06 10:15:00', NULL),
(10, 'Ticket cerrado por duplicado.', 1, 9, '2025-01-06 12:00:00', NULL),
(11, 'Asignado a nuevo desarrollador.', 2, 10, '2025-01-07 08:50:00', NULL),
(12, 'Cliente pidió reabrir el caso.', 4, 11, '2025-01-07 14:20:00', NULL),
(13, 'Se encontró bug relacionado.', 5, 12, '2025-01-08 09:30:00', NULL),
(14, 'Ticket escalado a segundo nivel.', 6, 13, '2025-01-08 15:00:00', NULL),
(15, 'Cliente no respondió, en espera.', 7, 14, '2025-01-09 11:45:00', NULL),
(16, 'Tiempo estimado ajustado.', 2, 15, '2025-01-10 08:30:00', NULL),
(17, 'Se añadió log del sistema.', 3, 16, '2025-01-10 13:00:00', NULL),
(18, 'Ticket resuelto y validado.', 1, 17, '2025-01-11 10:00:00', NULL),
(19, 'Cliente solicitó mejora adicional.', 5, 18, '2025-01-11 16:10:00', NULL),
(20, 'Se reasignó por vacaciones del responsable.', 4, 19, '2025-01-12 09:00:00', NULL),
(21, 'Comentario de seguimiento técnico.', 6, 20, '2025-01-12 15:45:00', NULL),
(22, 'Ticket marcado como urgente.', 7, 21, '2025-01-13 08:10:00', NULL),
(23, 'Cliente indicó satisfacción parcial.', 3, 22, '2025-01-13 11:25:00', NULL),
(24, 'Se extendió la estimación.', 2, 23, '2025-01-13 17:00:00', NULL),
(25, 'Ticket cerrado correctamente.', 1, 24, '2025-01-14 09:35:00', NULL),
(26, 'Cliente volvió a reportar el problema.', 5, 25, '2025-01-14 14:00:00', NULL),
(27, 'Nuevo log cargado.', 6, 26, '2025-01-15 10:30:00', NULL),
(28, 'Ticket en validación del usuario.', 4, 27, '2025-01-15 13:50:00', NULL),
(29, 'Se marcó como incidencia crítica.', 7, 28, '2025-01-16 08:20:00', NULL),
(30, 'Documentación entregada.', 3, 29, '2025-01-16 15:40:00', NULL),
(31, 'Cliente solicitó confirmación.', 2, 30, '2025-01-17 09:00:00', NULL),
(32, 'Ticket escalado a nivel 3.', 6, 31, '2025-01-17 13:10:00', NULL),
(33, 'Solución en revisión.', 4, 32, '2025-01-18 11:15:00', NULL),
(34, 'Error no reproducible, cerrado.', 1, 33, '2025-01-18 16:25:00', NULL),
(35, 'Cliente solicitó cambio de prioridad.', 5, 34, '2025-01-19 09:40:00', NULL),
(36, 'Tiempo estimado recalculado.', 2, 35, '2025-01-19 13:00:00', NULL),
(37, 'Ticket duplicado.', 3, 36, '2025-01-20 08:30:00', NULL),
(38, 'Incidencia confirmada.', 6, 37, '2025-01-20 12:10:00', NULL),
(39, 'Usuario asignado cambió.', 7, 38, '2025-01-21 09:20:00', NULL),
(40, 'Ticket listo para validación.', 4, 39, '2025-01-21 14:00:00', NULL),
(41, 'Cliente satisfecho con la solución.', 1, 40, '2025-01-22 08:15:00', NULL),
(42, 'Bug relacionado encontrado.', 2, 41, '2025-01-22 12:45:00', NULL),
(43, 'Se cargaron evidencias.', 3, 42, '2025-01-23 09:00:00', NULL),
(44, 'Ticket marcado como urgente.', 6, 43, '2025-01-23 15:30:00', NULL),
(45, 'Cliente pidió cierre.', 5, 44, '2025-01-24 10:00:00', NULL),
(46, 'Ticket reabierto por error.', 7, 45, '2025-01-24 14:20:00', NULL),
(47, 'Cambio de estado manual.', 2, 46, '2025-01-25 09:50:00', NULL),
(48, 'Ticket pendiente de validación.', 4, 47, '2025-01-25 13:00:00', NULL),
(49, 'Cliente aprobó solución.', 3, 48, '2025-01-26 09:15:00', NULL),
(50, 'Reasignación de responsable.', 6, 49, '2025-01-26 14:00:00', NULL),
(51, 'Ticket solucionado.', 1, 50, '2025-01-27 10:00:00', NULL),
(52, 'Cliente no respondió.', 5, 51, '2025-01-27 13:30:00', NULL),
(53, 'Ticket escalado.', 2, 52, '2025-01-28 09:45:00', NULL),
(54, 'Se añadieron logs.', 7, 53, '2025-01-28 12:00:00', NULL),
(55, 'Ticket en progreso.', 3, 54, '2025-01-29 08:10:00', NULL),
(56, 'Validación en curso.', 4, 55, '2025-01-29 14:20:00', NULL),
(57, 'Ticket cerrado.', 1, 56, '2025-01-30 09:25:00', NULL),
(58, 'Cliente aprobó la solución.', 2, 57, '2025-01-30 13:10:00', NULL),
(59, 'Ticket pendiente de más info.', 6, 58, '2025-01-31 08:30:00', NULL),
(60, 'Se agregó información técnica.', 7, 59, '2025-01-31 15:00:00', NULL);


-- insert cambios_x_ticket

INSERT INTO Cambios_x_ticket (id_cambio_x_ticket, id_ticket, id_tipo_cambio, dato_cambio_origen, dato_cambio_destino, id_usuario_cambio, fecha_cambio) VALUES
(1, 1, 1, 'Abierto', 'Asignado', 3, '2024-01-10 09:15:00'),
(2, 1, 1, 'Asignado', 'En Progreso', 3, '2024-01-10 10:30:00'),
(3, 1, 1, 'En Progreso', 'En Validacion', 8, '2024-01-11 14:05:00'),
(4, 1, 1, 'En Validacion', 'Cerrado', 8, '2024-01-12 16:40:00'),

(5, 2, 1, 'Abierto', 'Asignado', 5, '2024-01-09 11:10:00'),
(6, 2, 2, 'Usuario1', 'Usuario4', 5, '2024-01-09 11:20:00'),
(7, 2, 1, 'Asignado', 'En Progreso', 4, '2024-01-09 12:00:00'),
(8, 2, 1, 'En Progreso', 'Resuelto', 4, '2024-01-10 15:00:00'),
(9, 2, 1, 'Resuelto', 'Cerrado', 2, '2024-01-11 09:00:00'),

(10, 3, 1, 'Abierto', 'Asignado', 6, '2024-01-08 08:45:00'),
(11, 3, 1, 'Asignado', 'En Progreso', 6, '2024-01-08 09:10:00'),
(12, 3, 3, 'Media', 'Alta', 6, '2024-01-08 09:20:00'),
(13, 3, 1, 'En Progreso', 'En Espera', 6, '2024-01-08 11:00:00'),
(14, 3, 1, 'En Espera', 'En Progreso', 6, '2024-01-09 10:00:00'),
(15, 3, 1, 'En Progreso', 'Cerrado', 6, '2024-01-10 12:30:00'),

(16, 4, 1, 'Abierto', 'Asignado', 7, '2024-01-07 09:00:00'),
(17, 4, 1, 'Asignado', 'En Progreso', 7, '2024-01-07 10:00:00'),
(18, 4, 1, 'En Progreso', 'Resuelto', 7, '2024-01-08 15:30:00'),
(19, 4, 1, 'Resuelto', 'Cerrado', 7, '2024-01-09 10:15:00'),

(20, 5, 1, 'Abierto', 'Asignado', 2, '2024-01-12 14:00:00'),
(21, 5, 1, 'Asignado', 'En Progreso', 2, '2024-01-12 15:00:00'),
(22, 5, 1, 'En Progreso', 'Reabierto', 2, '2024-01-13 09:00:00'),
(23, 5, 1, 'Reabierto', 'En Progreso', 2, '2024-01-13 11:30:00'),
(24, 5, 1, 'En Progreso', 'Cerrado', 2, '2024-01-14 17:30:00'),

(25, 6, 1, 'Abierto', 'Asignado', 9, '2024-01-05 10:15:00'),
(26, 6, 1, 'Asignado', 'En Progreso', 9, '2024-01-05 11:00:00'),
(27, 6, 1, 'En Progreso', 'En Espera', 9, '2024-01-06 09:30:00'),
(28, 6, 1, 'En Espera', 'Resuelto', 9, '2024-01-07 15:45:00'),
(29, 6, 1, 'Resuelto', 'Cerrado', 9, '2024-01-08 10:00:00'),

(30, 7, 1, 'Abierto', 'Asignado', 10, '2024-01-04 14:00:00'),
(31, 7, 2, 'Usuario7', 'Usuario10', 10, '2024-01-04 14:15:00'),
(32, 7, 1, 'Asignado', 'En Progreso', 10, '2024-01-04 15:00:00'),
(33, 7, 1, 'En Progreso', 'Resuelto', 10, '2024-01-05 17:00:00'),
(34, 7, 1, 'Resuelto', 'Cerrado', 10, '2024-01-06 11:30:00'),

(35, 8, 1, 'Abierto', 'Asignado', 4, '2024-01-06 09:00:00'),
(36, 8, 1, 'Asignado', 'En Progreso', 4, '2024-01-06 09:45:00'),
(37, 8, 3, 'Alta', 'Baja', 4, '2024-01-06 10:15:00'),
(38, 8, 1, 'En Progreso', 'Resuelto', 4, '2024-01-07 15:00:00'),
(39, 8, 1, 'Resuelto', 'Cerrado', 4, '2024-01-08 10:30:00'),

(40, 9, 1, 'Abierto', 'Asignado', 11, '2024-01-05 08:30:00'),
(41, 9, 1, 'Asignado', 'En Progreso', 11, '2024-01-05 09:00:00'),
(42, 9, 1, 'En Progreso', 'En Validacion', 11, '2024-01-06 13:00:00'),
(43, 9, 1, 'En Validacion', 'Cerrado', 11, '2024-01-07 09:00:00'),

(44, 10, 1, 'Abierto', 'Asignado', 12, '2024-01-04 08:30:00'),
(45, 10, 1, 'Asignado', 'En Progreso', 12, '2024-01-04 09:15:00'),
(46, 10, 1, 'En Progreso', 'Resuelto', 12, '2024-01-05 14:30:00'),
(47, 10, 1, 'Resuelto', 'Cerrado', 12, '2024-01-06 16:00:00'),

(48, 73, 1, 'Abierto', 'Asignado', 6, '2024-02-01 08:00:00'),
(49, 73, 1, 'Asignado', 'En Progreso', 6, '2024-02-01 09:30:00'),
(50, 74, 1, 'Abierto', 'Asignado', 8, '2024-02-01 09:15:00'),
(51, 74, 1, 'Asignado', 'En Progreso', 8, '2024-02-01 10:30:00'),
(52, 75, 1, 'Abierto', 'Asignado', 5, '2024-02-02 14:20:00');




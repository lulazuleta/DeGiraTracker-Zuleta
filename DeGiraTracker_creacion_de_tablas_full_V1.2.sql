CREATE DATABASE DeGiraTracker;
USE DeGiraTracker;


/*El orden de creación de las tablas está pensado para que se ejecute el script entero y no genere conflctos de relaciones ♥♥*/
CREATE TABLE proyectos (
id_proyecto int auto_increment not null,
nombre_proyecto varchar(100) not null unique,
cliente varchar(150) not null,
fecha_inicio datetime not null,
activo boolean not null default 1,

primary key (id_proyecto));

CREATE TABLE usuarios ( 
id_usuario int auto_increment not null, -- El dato id_usuario en esta tabla no puede ser modificado bajo ningun concepto, ya que es unico. 
usuario varchar (30) not null unique, 
contrasenia varchar (60) not null,
activo boolean not null DEFAULT 1,
fecha_creacion datetime not null,
ultima_modificacion datetime,

primary key (id_usuario)
);

CREATE TABLE roles (
id_rol int auto_increment not null,
nombre_rol varchar(50) not null unique,
detalle_rol varchar(300),
activo boolean not null default 1,

primary key (id_rol)
);

CREATE TABLE permisos (
id_permiso int auto_increment not null,
nombre_permiso varchar(100)  not null unique,
url varchar(300) not null unique,
activo boolean not null default 1,
fecha_creacion datetime not null,
modificado_por int,
ultima_modificacion datetime,

primary key (id_permiso),
foreign key (modificado_por) references usuarios (id_usuario) ON UPDATE CASCADE -- la sentencia "on update cascade" está de forma provisoria, ya que el id de usuario no deberá modificarse bajo ningun concepto.
);

CREATE TABLE prioridades (
id_prioridad int auto_increment not null,
nombre_prioridad varchar(30) not null unique,

primary key (id_prioridad)
);

CREATE TABLE tipos_incidencias (
id_tipo_incidencia int auto_increment not null,
nombre_tipo_incidencia varchar (30) not null unique,
detalle_tipo_incidencia varchar (300), 

primary key (id_tipo_incidencia)
);

CREATE TABLE estados (
id_estado int auto_increment not null,
nombre_estado varchar(50) not null unique,
detalle_estado varchar(300),

primary key (id_estado)
);

CREATE TABLE tipos_de_cambio (
id_tipo_cambio int auto_increment not null,
nombre_cambio varchar(50) not null unique,
descripcion_cambio varchar(300), 

primary key (id_tipo_cambio)
);

CREATE TABLE detalle_personas (
id_detalle_persona int auto_increment not null,
id_usuario int not null,
nombre varchar (30) not null,
apellido varchar (30) not null,
mail varchar (50) not null unique,

primary key (id_detalle_persona),
foreign key (id_usuario) references usuarios (id_usuario) ON DELETE NO ACTION -- Lo mismo mencionado anteriormente, el id usuario no deberá editarse ni eliminarse bajo ningun concepto, en caso de que un usuario no corresponda que use más la aplicación, se realizará una baja lógica
);

CREATE TABLE usuarios_x_roles (
id_usuario int not null,
id_rol int not null,

primary key(id_usuario, id_rol),
foreign key (id_usuario) references usuarios (id_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION, -- Lo mismo mencionado anteriormente, el id usuario no deberá editarse ni eliminarse bajo ningun concepto, en caso de que un usuario no corresponda que use más la aplicación, se realizará una baja lógica
foreign key (id_rol) references roles (id_rol) ON DELETE NO ACTION ON UPDATE NO ACTION -- Despues voy a pensar la mejor manera de manejar este dato, no estoy segura todavia que sería lo más conveniente
);

CREATE TABLE roles_x_permisos (
id_rol int not null,
id_permiso int not null,

primary key (id_rol, id_permiso),
foreign key (id_rol) references roles (id_rol) ON DELETE NO ACTION ON UPDATE NO ACTION,
foreign key (id_permiso) references permisos (id_permiso) ON DELETE NO ACTION ON UPDATE NO ACTION 
);

CREATE TABLE reglas_sla (
id_regla_sla int auto_increment not null,
id_proyecto int not null,
id_prioridad int not null,
id_tipo_incidencia int not null,
tiempo_resolucion decimal (3,2) not null,
activo boolean default 1 not null,

primary key (id_regla_sla),
foreign key (id_proyecto) references proyectos (id_proyecto) ON DELETE NO ACTION ON UPDATE NO ACTION,
foreign key (id_prioridad) references prioridades (id_prioridad) ON DELETE NO ACTION ON UPDATE NO ACTION,
foreign key (id_tipo_incidencia) references tipos_incidencias (id_tipo_incidencia) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE tickets (
id_ticket int auto_increment not null,
titulo_ticket varchar(100) not null,
descripcion_ticket varchar(800),
id_tipo_incidencia int not null,
id_prioridad int not null,
id_estado int not null,
id_proyecto int not null,
usuario_asignado int not null,
creado_por int not null,
fecha_creacion datetime not null,
estimacion_tiempo decimal (3,2),
tiempo_trabajado decimal (3,2),
id_regla_sla int,
ticket_relacionado int default null,

primary key(id_ticket),
foreign key (id_estado) references estados (id_estado),
foreign key (usuario_asignado) references usuarios (id_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION,
foreign key (creado_por) references usuarios (id_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION,
foreign key (id_regla_sla) references reglas_sla (id_regla_sla) ON DELETE NO ACTION ON UPDATE CASCADE,
foreign key (ticket_relacionado) references tickets (id_ticket) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE comentarios (
id_comentario int auto_increment not null,
comentario varchar(500) not null,
creado_por int not null,
id_ticket int not null,
fecha_creacion datetime not null,
fecha_edicion datetime,

primary key (id_comentario),
foreign key (id_ticket) references tickets (id_ticket),
foreign key (creado_por) references usuarios (id_usuario) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE cambios_x_ticket (
id_cambio_x_ticket int auto_increment not null,
id_ticket int not null,
id_tipo_cambio int not null,
dato_cambio_origen varchar (50) default NULL,
dato_cambio_destino varchar (50) default null,
id_usuario_cambio int not null,
fecha_cambio datetime not null,

primary key (id_cambio_x_ticket),
foreign key (id_ticket) references tickets (id_ticket) ON DELETE NO ACTION ON UPDATE NO ACTION, -- Se agregará un trigger, ya que el id_ticket no debe ser modificado ni eliminado NUNCA
foreign key (id_tipo_cambio) references tipos_de_cambio (id_tipo_cambio) ON DELETE NO ACTION ON UPDATE NO ACTION, -- También se agregará un trigger, ya que los cambios realizados en un ticket quedarán guardados en un historico, por lo que los mismos no deben ser borrados ni modificados
foreign key (id_usuario_cambio) references usuarios (id_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION -- Este campo tampoco deberá modificarse en ningun caso, ya que el id del usuario es unico, para esto en la tabla usuarios existe un campo "activo" para que la gestion de usuarios cuente con un borrado lógico y no físico
);

/*Creación de indices adicionales*/


CREATE INDEX idx_tickets_estado ON tickets(id_estado); 
CREATE INDEX idx_tickets_usuario_asignado ON tickets(usuario_asignado); 
CREATE INDEX idx_tickets_proyecto ON tickets(id_proyecto); 
CREATE INDEX idx_tickets_prioridad ON tickets(id_prioridad); 
CREATE INDEX idx_tickets_tipo_incidencia ON tickets(id_tipo_incidencia); 
CREATE INDEX idx_comentarios_ticket ON comentarios(id_ticket); 
CREATE INDEX idx_cambios_ticket ON cambios_x_ticket(id_ticket);
CREATE INDEX idx_usuarios_roles ON usuarios_x_roles(id_usuario, id_rol); 
CREATE INDEX idx_roles_permisos ON roles_x_permisos(id_rol, id_permiso); 

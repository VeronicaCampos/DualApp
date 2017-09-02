create database sistema_dual;
use sistema_dual;

create table administrador(
id_admin varchar (20) primary key,
nombre_admin varchar (50),
apellido_pat_admin varchar (50),
apellido_mat_admin varchar (50));

create table situacion(
id_situacion int primary key,
situacion varchar (50));

create table seguro(
nss int primary key,
id_situacion int,
foreign key (id_situacion) references situacion (id_situacion));

create table turno(
codigo_turno int primary key,
turno varchar (50));

create table semestre(
codigo_semestre int primary key ,
semestre varchar (50));

create table carrera(
id_carrera varchar (50) primary key,
nombre_carrera varchar (70));

create table materias(
codigo_materia varchar (20) primary key,
nombre_materia varchar (100),
id_carrera varchar (50),
codigo_semestre int,
id_situacion int,
foreign key (id_carrera) references carrera (id_carrera),
foreign key (codigo_semestre) references semestre (codigo_semestre),
foreign key (id_situacion) references situacion (id_situacion));

create table asesores(
matricula_asesor int primary key,
nombre_asesor varchar (50),
apellido_pat_asesor varchar (50),
apellido_mat_asesor varchar (50),
codigo_materia varchar (20),
foreign key (codigo_materia) references materias (codigo_materia));

create table empresa(
id_empresa varchar (100) primary key,
nombre_empresa varchar (100));

create table responsable_empresa(
id_responsable int primary key,
nombre_responsable varchar (50),
apellido_pat_responsable varchar (50),
apellido_mat_responsable varchar (50),
puesto_responsable varchar (100));

create table alumnos (
matricula_alumno int primary key,
nombre_alumno varchar (50),
apellido_pat_alumno varchar (50),
apellido_mat_alumno varchar (50),
codigo_semestre int,
id_empresa varchar (100),
matricula_asesor int,
nss int,
foreign key (codigo_semestre) references semestre (codigo_semestre),
foreign key (id_empresa) references empresa (id_empresa),
foreign key (matricula_asesor) references asesores (matricula_asesor),
foreign key (nss) references seguro (nss));

create table registro(
usuario varchar (50) primary key,
matricula_alumno int,
id_admin varchar (20),
matricula_asesor int, 
contraseña varchar (20),
foreign key (matricula_alumno) references alumnos (matricula_alumno),
foreign key (id_admin) references administrador (id_admin),
foreign key (matricula_asesor) references asesores (matricula_asesor));

create table reporte(
numero_reporte int auto_increment primary key,
de_fecha_reporte date,
a_fecha_reporte date,
matricula_alumno int,
id_empresa varchar (100),
id_responsable int,
matricula_asesor int,
id_admin varchar (20),
foreign key (matricula_alumno) references alumnos (matricula_alumno),
foreign key (id_empresa) references empresa (id_empresa),
foreign key (id_responsable) references responsable_empresa (id_responsable),
foreign key (matricula_asesor) references asesores (matricula_asesor),
foreign key (id_admin) references administrador (id_admin))auto_increment=1;

select alumnos.matricula_alumno, concat(alumnos.apellido_pat_alumno,' ',alumnos.apellido_mat_alumno,' ',alumnos.nombre_alumno) as Nombre_Alumno,
semestre.semestre,carrera.nombre_carrera, materias.nombre_materia, semestre_materia.semestre,concat(asesores.apellido_pat_asesor,' ',asesores.apellido_mat_asesor,' ',asesores.nombre_asesor) as Nombre_Asesor,
situacion.situacion, seguro.nss, seguro.id_situacion, empresa.nombre_empresa
from alumnos
inner join semestre
on alumnos.codigo_semestre= semestre.codigo_semestre
inner join empresa
on empresa.id_empresa= alumnos.id_empresa
inner join asesores
on asesores.matricula_asesor= alumnos.matricula_asesor
inner join materias
on materias.codigo_materia= asesores.codigo_materia
inner join carrera
on carrera.id_carrera= materias.id_carrera
inner join semestre as semestre_materia
on semestre.codigo_semestre= materias.codigo_semestre
inner join situacion
on situacion.id_situacion= materias.id_situacion
inner join seguro
on seguro.nss= situacion.id_situacion;

select concat (asesores.apellido_pat_asesor,' ', asesores.apellido_mat_asesor,' ', asesores.nombre_asesor) as Nombre_Asesor,
materias.nombre_materia, carrera.nombre_carrera, semestre.semestre
from asesores
inner join materias
on asesores.codigo_materia= materias.codigo_materia
inner join carrera
on carrera.id_carrera= materias.id_carrera
inner join semestre
on semestre.codigo_semestre= materias.codigo_semestre
inner join situacion
on situacion.id_situacion= materias.id_situacion;


select materias.nombre_materia, carrera.nombre_carrera, semestre.semestre
from materias
inner join carrera
on materias.id_carrera= carrera.id_carrera
inner join semestre
on semestre.codigo_semestre= materias.codigo_semestre;


select reporte.numero_reporte, concat(alumnos.nombre_alumno,' ', alumnos.apellido_pat_alumno,' ',alumnos.apellido_mat_alumno)as Nombre_Alumno,
reporte.de_fecha_reporte, reporte.a_fecha_reporte, empresa.nombre_empresa, 
concat(responsable_empresa.nombre_responsable,' ',responsable_empresa.apellido_pat_responsable,' ',responsable_empresa.apellido_mat_responsable) as Nombre_Responsable,
responsable_empresa.puesto_responsable, concat(asesores.nombre_asesor,' ',asesores.apellido_pat_asesor,' ',asesores.apellido_mat_asesor) as Nombre_Asesor,
concat(administrador.nombre_admin,' ',administrador.apellido_pat_admin,' ',administrador.apellido_mat_admin)as Nombre_Jefe_Div
from reporte
inner join alumnos
on reporte.matricula_alumno= alumnos.matricula_alumno
inner join semestre as semestre_alumno
on semestre_alumno.codigo_semestre= alumnos.codigo_semestre
inner join empresa
on empresa.id_empresa= alumnos.id_empresa
inner join asesores
on asesores.matricula_asesor= alumnos.matricula_asesor
inner join materias
on materias.codigo_materia= asesores.codigo_materia
inner join carrera as carrera_alumno
on carrera_alumno.id_carrera= materias.id_carrera
inner join semestre
on semestre.codigo_semestre= materias.codigo_semestre
inner join seguro
on seguro.nss= alumnos.nss
inner join empresa as empresa_reporte
on empresa_reporte.id_empresa= reporte.id_empresa
inner join responsable_empresa
on responsable_empresa.id_responsable= reporte.id_responsable
inner join asesores as asesores_reporte
on asesores_reporte.matricula_asesor=reporte.matricula_asesor
inner join materias as materias_reporte
on materias_reporte.codigo_materia=asesores.codigo_materia
inner join carrera
on carrera.id_carrera=materias_reporte.id_carrera
inner join semestre as semestre_reporte
on semestre_reporte.codigo_semestre=materias.codigo_materia
inner join situacion
on situacion.id_situacion=materias.id_situacion
inner join administrador
on administrador.id_admin=reporte.id_admin

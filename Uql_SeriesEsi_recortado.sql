drop DATABASE if exists SeriesEsi;
create DATABASE SeriesEsi;
use SeriesEsi;

create TABLE if not exists Usuarios(
	user varchar(40) PRIMARY KEY,
	mail varchar(200) UNIQUE NOT NULL,
	pass varchar(70),
	ruta_foto_perfil varchar(31),
	ruta_ajustes json,
	feed json							# Habría que ver en qué formato se manipula
 );
create TABLE if not exists Usuarios_no_verificados(
	user varchar(40) PRIMARY KEY,
	mail varchar(200) UNIQUE NOT NULL,
	pass varchar(70),
	verify_token varchar(130)
 );
create TABLE if not exists Pass_token(
	fk_user varchar(31) PRIMARY KEY,
	pass_token varchar(63),
	fecha date,
	hora time
 );
create TABLE if not exists Plataformas(
	nombre varchar(31) PRIMARY KEY,
	path_icono varchar(31)
	# Se podría incluso incluir la "productora" (HBO, disney...) imitando esta entidad sin dar quebraderos de cabeza
 );
create TABLE if not exists Paises(
	nombre varchar(31) PRIMARY KEY,
	path_bandera varchar(31)
 );
create TABLE if not exists Idiomas(
	nombre varchar(31) PRIMARY KEY,
	path_bandera varchar(31)
 );
create TABLE if not exists Personas(
	id_persona int auto_increment PRIMARY KEY,
	nombre varchar(31),
	fk_pais varchar(31)
 );
create TABLE if not exists Series(
	nombre varchar(31) PRIMARY KEY,
	genero varchar(31),
	inspirada_en varchar(63),			# Nombre del libro en que se inspiró (si es una serie y lo hay)
	fk_id_persona int,					# Nombre de su autor (si es una serie inspirada en un libro)
	fk_pais varchar(31)
 );
# Los siguientes son "cosas que el usuario hace con la serie"
create TABLE if not exists Recomienda(
	fk_user varchar(31),
	fk_nombre_serie varchar(31),

	primary key(fk_user,fk_nombre_serie)
 );
create TABLE if not exists Pendiente(
	fk_user varchar(31),
	fk_nombre_serie varchar(31),

	primary key(fk_user,fk_nombre_serie)
 );
create TABLE if not exists Comenta(
	# He puesto las puntuaciones aquí y no en la recomendación, porque ¿recomienda con mala nota?
	fk_user varchar(31),
	fk_nombre_serie varchar(31),
	n int,								# Comentario n-ésimo
	puntuación float,
	comentario varchar(511),			# ¿Jugamos a twitter? ¿Máximo 140 caracteres?

	primary key(fk_user,fk_nombre_serie,n)
 );
create TABLE if not exists Like_a_comentario(
	fk_user_da_like varchar(31),		# El usuario ... ha dado like
	fk_user_comenta varchar(31),		# al comentario que hizo ...
	fk_nombre_serie varchar(31),		# en la serie ...
	fk_n int,							# En caso de haber hecho varios, este comentario fue el nº ...

	primary key(fk_user_da_like,fk_user_comenta,fk_nombre_serie,fk_n)
 );
# Los siguientes son "otras relaciones"
create TABLE if not exists Sigue_a(
	fk_seguidor varchar(31),
	fk_seguido varchar(31),

	primary key(fk_seguidor,fk_seguido)
 );
create TABLE if not exists Aparece(
	fk_id_persona int,
	fk_nombre_serie varchar(31),
	primary key(fk_id_persona,fk_nombre_serie)
 );
create TABLE if not exists Disponible_en(
	fk_nombre_serie varchar(31),
	fk_idioma varchar(31),
	fk_plataforma varchar(31),

	primary key(fk_nombre_serie,fk_idioma,fk_plataforma)
 );
# Y para terminar, se crean las claves foráneas
alter table Personas add foreign key (fk_pais) references Paises(nombre) on delete cascade;

alter table Series add foreign key (fk_id_persona) references Personas(id_persona) on delete cascade;
alter table Series add foreign key (fk_pais) references Paises(nombre) on delete cascade;

alter table Ha_visto_serie add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Ha_visto_serie add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Recomienda add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Recomienda add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Pendiente add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Pendiente add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Puntúa_serie add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Puntúa_serie add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Comenta add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Comenta add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Like_a_comentario add foreign key (fk_user_da_like) references Usuarios(user) on delete cascade;
alter table Like_a_comentario add foreign key (fk_user_comenta,fk_nombre_serie,fk_n) references Comenta(fk_user,fk_nombre_serie,n) on delete cascade;

alter table Sigue_a add foreign key (fk_seguidor) references Usuarios(user) on delete cascade;
alter table Sigue_a add foreign key (fk_seguido) references Usuarios(user) on delete cascade;

alter table Aparece add foreign key (fk_id_persona) references Personas(id_persona) on delete cascade;
alter table Aparece add foreign key (fk_nombre_serie) references Capítulos(fk_nombre_serie) on delete cascade;

alter table Disponible_en add foreign key (fk_nombre_serie) references Capítulos(fk_nombre_serie) on delete cascade;
alter table Disponible_en add foreign key (fk_idioma) references Idiomas(nombre) on delete cascade;
alter table Disponible_en add foreign key (fk_plataforma) references Plataformas(nombre) on delete cascade;
create table if not exists Mensajes(
	pk int primary key,
	fk_admin char(40),
	mensaje char(500) unique not null
);

alter table Mensajes add foreign key (fk_admin) references Usuarios(user) on delete cascade;
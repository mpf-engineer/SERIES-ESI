# En la versión definitiva, descomentar las líneas que hablan de "fk_pais"

#alter table Personas add foreign key (fk_pais) references Paises(nombre) on delete cascade;

#alter table Series add foreign key (fk_id_autor) references Personas(id_persona) on delete cascade;
#alter table Series add foreign key (fk_pais) references Paises(nombre) on delete cascade;

alter table Recomienda add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Recomienda add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Pendiente add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Pendiente add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Comenta add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Comenta add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Puntúa add foreign key (fk_user) references Usuarios(user) on delete cascade;
alter table Puntúa add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Like_a_comentario add foreign key (fk_user_da_like) references Usuarios(user) on delete cascade;
alter table Like_a_comentario add foreign key (fk_user_comenta,fk_nombre_serie,fk_n) references Comenta(fk_user,fk_nombre_serie,n) on delete cascade;

alter table Sigue_a add foreign key (fk_seguidor) references Usuarios(user) on delete cascade;
alter table Sigue_a add foreign key (fk_seguido) references Usuarios(user) on delete cascade;

alter table Aparece_o_dirige add foreign key (fk_id_persona) references Personas(id_persona) on delete cascade;
alter table Aparece_o_dirige add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;

alter table Disponible_en add foreign key (fk_nombre_serie) references Series(nombre) on delete cascade;
alter table Disponible_en add foreign key (fk_idioma) references Idiomas(nombre) on delete cascade;
alter table Disponible_en add foreign key (fk_plataforma) references Plataformas(nombre) on delete cascade;
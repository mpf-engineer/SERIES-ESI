INSERT INTO Series VALUES(
	"Juego de Tronos", 			# El nombre (el resto es todo, de momento, opcional)
	"Acción",					# Género
	"Juego de Tronos",			# Si está inspirada en un libro, y quieres ponerlo, adelante
	1,							# Autor del libro (si lo hay, mira Uql_Directores.sql, que ahí explica qué número hay que poner). 
								# En la versión definitiva, habría que ponerlo a NULL o rellenar antes Uql_Directores.sql
	"Estados Unidos");			# De qué país es la serie
#El director y reparto, se pone en otro script

# Lo que hay que tener es un script con muchas líneas como esta (una por serie), puede estar todo en una misma fila:

INSERT INTO Series VALUES("La Casa de Papel", "Acción", NULL, NULL, "Estados Unidos");
INSERT INTO Series VALUES("Breaking Bad", "Acción", NULL, NULL, "Estados Unidos");
#INSERT INTO Series VALUES("", "", NULL, NULL, ""); # Esta línea es la plantilla

# Yo empezaría por: https://www.fotogramas.es/series-tv-noticias/g32585517/mejores-series-netflix-imdb/
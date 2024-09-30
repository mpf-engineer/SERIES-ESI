## Server

* Utiliza el reverse-proxy Nginx
* Utiliza el protocolo HTTPS para securizar la informacion
* Las peticiones como logeo y registro securizadas por HTTPS para no ver las contraseñas en texto plano
* Redireccion de HTTP a HTTPS por si alguien se olvida de no usar la version segura
* Servidor casero

## Base de datos

* MySQL
* Base de datos cifrada
* Contraseña de los usuarios cifrada con la funcion hash 'sha256'
* Puerto de la base de datos inaccesible desde el exterior de la red (está cerrado)

## Frontend

* CSS
* HTML
* JavaScript (para algunas funciones muy básicas, no se usa mucho)

## Backend

* Python como lenguaje de programacion de Backend
* Utilza el micro-web-framework Flask
* Servidor multihilo (puede responder a varios clientes a la vez)
* Uso de plantillas personalizadas dependiendo del usuario
* Uso de librerias criptograficas para generar tokens
* Uso de sesiones encriptadas para el logeo de usuarios

## Otras cosas

* DDNS (Dynamic DNS) para no tener que recordar una IP (opcion gratis de una DNS convencional, es un subdominio de una web)

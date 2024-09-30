# series-esi

Proyecto de PINF sobre series

# Cosas pendientes

* Base de datos (hecha, aunque se irán añadiendo modificaciones)
* ¿Olvidaste tu contraseña? :heavy_check_mark:
* Logo de la pagina ( 📂 STATIC/IMG ) :heavy_check_mark:
* Apariencia HTML de las distintas paginas de la web ( 📂 TEMPLATES )
* Apariencia CSS para las clases de HTML ( 📂 STATIC/CSS )
* Plantilla para email de bienvenida a la web
* Plantilla para email de olvido de la contraseña
* Avatar de perfil predeterminado (para aquel usuario que no se haya puesto avatar) :heavy_check_mark:
* Avatares que identifiquen también series, plataformas, idiomas (banderas), fotos de directores, etc. :heavy_check_mark:

# Ideas

- Likes a reviews (incorporado a la base de datos)
- QR's para compartir algo
- Contáctanos (email al final del footer)

# Lenguajes utilizados

* Backend
  * Python
    * Framework-web: Flask
  * MySQL
  * nginx: reverse-proxy
  * Gunicorn: middleware
* Frontend
  * HTML
  * CSS

 :computer: --> nginx --> gunicorn:worker --> flask

# Test de seguridad

https://www.ssllabs.com/ssltest/analyze.html?d=series-esi.duckdns.org&hideResults=on

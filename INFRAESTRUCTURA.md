# Documentacion de Infraestructura - CV Profesional

## Informacion del Proyecto

**Proyecto:** CV Profesional Web con Docker y Facebook Comments  
**Autor:** Gael Ramses Escobedo Huerta  
**Email:** gael.escobedohuerta@cesunbc.edu.mx  
**Fecha:** Enero 2025

## Parte 1: Documentacion de Infraestructura

### Analisis Tecnico

Este proyecto ha sido desarrollado utilizando tecnologias web modernas y practicas de containerizacion. La decision de utilizar Docker permite que el CV pueda desplegarse en cualquier ambiente compatible, garantizando consistencia y facilitando el proceso de deployment.

**Tecnologias utilizadas:**

1. HTML5: Estructura semantica del documento. Permite mejor SEO y accesibilidad.
2. CSS3: Estilos con Grid y Flexbox para diseño responsive.
3. JavaScript: Funcionalidad interactiva con IntersectionObserver API.
4. Nginx Alpine: Servidor web ligero para servir archivos estaticos.
5. Docker: Containerizacion de la aplicacion.
6. Docker Compose: Orquestacion de servicios.
7. Facebook SDK: Integracion de comentarios sociales.

### Estructura de Archivos

El proyecto mantiene una estructura simple y clara:

```
Proyecto_CV/
├── index.html          # Contenido principal del CV
├── styles.css          # Estilos y diseño responsive
├── Dockerfile          # Configuracion de la imagen Docker
├── docker-compose.yml  # Orquestacion de servicios
├── nginx.conf          # Configuracion del servidor web
├── deploy.bat          # Script de despliegue para Windows
├── README.md           # Documentacion general
└── INFRAESTRUCTURA.md  # Este documento
```

### Dependencias Externas

El proyecto utiliza dependencias minimas:

- Font Awesome 6.0: Biblioteca de iconos via CDN
- Facebook SDK v18.0: Widget de comentarios via CDN

No se requieren dependencias de Node.js, Python u otros gestores de paquetes, manteniendo el proyecto ligero y simple.

### Configuraciones Especificas

**Dockerfile:**
- Imagen base: nginx:alpine
- Puerto expuesto: 80
- Copia archivos HTML y CSS a /usr/share/nginx/html

**Docker Compose:**
- Mapeo de puerto 8080 (host) a 80 (contenedor)
- Reinicio automatico en caso de fallo
- Nombre del contenedor: cv-gael-r

**Nginx:**
- Configuracion basica para servir archivos estaticos
- Compresion GZIP habilitada
- Headers de seguridad configurados

## Arquitectura

### Diagrama de Estructura

```
Usuario (Navegador)
    |
    v
Nginx (Puerto 80)
    |
    v
Archivos Estaticos (HTML/CSS/JS)
    |
    v
Facebook SDK (Comentarios)
```

### Flujo de Datos

1. El usuario accede a la URL del CV
2. Nginx sirve los archivos HTML y CSS
3. El navegador carga la pagina y ejecuta JavaScript
4. Facebook SDK se carga de forma asincrona
5. Los comentarios se cargan dinamicamente via API de Facebook

### Decisiones de Diseno

Se eligio Nginx Alpine por su reducido tamaño y eficiencia. Docker permite empaquetar toda la aplicacion en un contenedor unico, facilitando el deployment y la portabilidad. La separacion de HTML, CSS y JavaScript mantiene el codigo organizado y mantenible.

No se implemento backend propio, manteniendo la arquitectura como sitio estatico simple. Para funcionalidades dinamicas se recurre a servicios externos como Facebook SDK.

## Parte 2: Integracion Facebook Comments

### Configuracion en Facebook Developers

Para la integracion de comentarios de Facebook, es necesario crear una aplicacion en la plataforma de desarrolladores de Facebook.

**Pasos realizados:**

1. Creacion de aplicacion en developers.facebook.com
2. Tipo de aplicacion: Pagina web
3. Configuracion de dominios permitidos (localhost para desarrollo)
4. Activacion del producto Facebook Comments
5. Obtencion del App ID

**Configuracion de dominios:**

Para desarrollo local, se configuro localhost en App Domains. Para produccion, se debe agregar el dominio real donde se aloje el CV.

### Implementacion Tecnica

**Integracion del SDK:**

El SDK de Facebook se carga de forma asincrona para no bloquear la carga de la pagina:

```html
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" 
        src="https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v18.0&appId=TU_APP_ID">
</script>
```

**Widget de Comentarios:**

El widget se implementa con atributos personalizables:

```html
<div class="fb-comments" 
     data-href="URL_DEL_CV" 
     data-width="100%" 
     data-numposts="5"
     data-colorscheme="light">
</div>
```

**Configuracion data-href:**

Se utilizo una URL unica para identificar el CV. Esto permite que los comentarios se asocien correctamente con el documento especifico, incluso si se accede desde diferentes URLs.

### Pruebas Realizadas

Se probo el funcionamiento en:

- Chrome 120+
- Firefox 121+
- Edge 120+
- Dispositivos moviles Android e iOS

En dispositivos moviles, el widget de comentarios se adapta automaticamente al ancho disponible, manteniendo la usabilidad.

## Evidencias

### Capturas de Infraestructura

Los archivos del proyecto estan disponibles en el repositorio de GitHub:
https://github.com/GatoRX8/CV_Fachero

### Configuracion de Facebook Developers

La configuracion de la aplicacion de Facebook incluye:
- App ID configurado en el codigo
- Dominios permitidos configurados
- Producto Facebook Comments activado

### Funcionamiento

El CV funciona correctamente en http://localhost:8080 cuando se ejecuta con Docker. Los comentarios de Facebook se cargan dinamicamente mediante el SDK.

## Reporte de Feedback

### Problemas Tecnicos Encontrados

Durante el desarrollo, el principal reto fue entender la configuracion de Facebook Developers y los permisos necesarios para el widget de comentarios. Inicialmente no estaba claro cuales eran los dominios correctos que debian configurarse.

Tambien se presentaron problemas con caracteres especiales en el HTML que provocaban errores de renderizado. Se soluciono utilizando caracteres ASCII estandar en lugar de emojis o caracteres especiales.

Para el despliegue con Docker, requeri investigar sobre la configuracion correcta de Nginx para servir archivos estaticos, especialmente la directiva try_files para enrutamiento correcto.

### Aprendizajes

La integracion con APIs externas como Facebook SDK requiere entender los mecanismos de asincronia y carga dinamica de recursos. El SDK se carga de forma paralela sin bloquear el renderizado inicial de la pagina.

Facebook Comments ofrece ventajas como moderacion automatica y autenticacion social, pero tambien implica dependencia de un servicio externo y consideraciones de privacidad de los usuarios.

El proceso de containerizacion con Docker mejoro mi entendimiento de como empaquetar aplicaciones de manera portable. La separacion entre codigo fuente y ambiente de ejecucion simplifica el proceso de deployment.

### Mejoras Identificadas

De mi infraestructura actual, implementaria variables de entorno para configuraciones sensibles como el App ID de Facebook, en lugar de tenerlo hardcodeado en el HTML.

Para optimizar la integracion social, consideraria agregar meta tags Open Graph mas completos para mejorar la visualizacion cuando se comparte el CV en redes sociales.

En cuanto a otras plataformas, podria integrar botones de compartir para LinkedIn y Twitter, y evaluar el uso de Disqus como alternativa a Facebook Comments para usuarios que prefieran no usar Facebook.

## Conclusiones

Este proyecto demuestra la capacidad de desarrollar y desplegar una aplicacion web moderna utilizando tecnologias de containerizacion y servicios externos. La integracion de Facebook Comments agrega funcionalidad social al CV sin necesidad de implementar infraestructura backend propia.

La documentacion completa del proyecto esta disponible en el archivo README.md, incluyendo instrucciones de instalacion, configuracion y uso.

## Referencias

- Documentacion oficial de Docker: https://docs.docker.com
- Guia de Facebook Comments Plugin: https://developers.facebook.com/docs/plugins/comments
- Documentacion de Nginx: https://nginx.org/en/docs

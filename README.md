# CV Profesional - Gael Ramses Escobedo Huerta

## Descripcion del Proyecto

CV web profesional desarrollado como proyecto academico, implementando las mejores practicas de desarrollo web, containerizacion con Docker e integracion con APIs de terceros (Facebook Comments).

## Tecnologias Utilizadas

- HTML5: Estructura semantica del CV
- CSS3: Estilos responsivos con animaciones modernas
- JavaScript: Interactividad y animaciones de scroll
- Font Awesome 6.0: Iconografia profesional
- Docker: Containerizacion de la aplicacion
- Docker Compose: Orquestacion de contenedores
- Nginx Alpine: Servidor web ligero y eficiente
- Facebook SDK: Integracion de comentarios sociales

## Estructura del Proyecto

```
Proyecto_CV/
├── index.html              # Pagina principal del CV
├── styles.css              # Estilos CSS del proyecto
├── Dockerfile              # Configuracion de imagen Docker
├── docker-compose.yml      # Orquestacion de servicios
├── nginx.conf              # Configuracion del servidor web
├── README.md               # Documentacion del proyecto
├── INFRAESTRUCTURA.md      # Documentacion tecnica detallada
└── .gitignore              # Archivos excluidos del control de versiones
```

## Como Ejecutar el Proyecto

### Prerequisitos
- Docker instalado
- Docker Compose instalado
- Puerto 8080 disponible

### Instrucciones de Despliegue

1. Clonar el proyecto
```bash
git clone https://github.com/GatoRX8/CV_Fachero.git
cd CV_Fachero
```

2. Construir la imagen Docker
```bash
docker-compose build
```

3. Iniciar el contenedor
```bash
docker-compose up -d
```

4. Acceder al CV
```
http://localhost:8080
```

### Comandos Utiles

```bash
# Ver logs del contenedor
docker logs cv-gael-r

# Reiniciar el CV
docker-compose restart

# Detener el CV
docker-compose down

# Ver estado del contenedor
docker ps
```

## Caracteristicas del CV

### Secciones Implementadas
1. Header: Informacion personal y contacto
2. Sobre Mi: Descripcion profesional y highlights
3. Experiencia: Historial laboral con fechas
4. Habilidades: Categorias de skills tecnicos
5. Proyectos: Portafolio con programacion lineal
6. Comentarios: Integracion de Facebook Comments
7. Footer: Redes sociales y contacto

### Funcionalidades
- Diseno responsive (movil, tablet, desktop)
- Animaciones de scroll suaves
- Integracion con redes sociales
- Optimizado para SEO
- Carga rapida (Nginx + Alpine)
- Containerizado con Docker

## Documentacion Técnica

Para documentacion detallada sobre infraestructura, arquitectura, configuracion de Facebook Comments y reporte de feedback, consultar el archivo INFRAESTRUCTURA.md

## Autor

**Gael Ramses Escobedo Huerta**
- Email: gael.escobedohuerta@cesunbc.edu.mx
- Facebook: https://www.facebook.com/gael.escobedo.148
- Instagram: https://www.instagram.com/gato_rx8/

## Licencia

Este proyecto es academico y de uso personal.

**Version:** 1.0.0  
**Ultima actualizacion:** Enero 2025

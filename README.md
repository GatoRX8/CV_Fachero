# CV Profesional - Gael Ramses Escobedo Huerta

## 📋 Descripcion del Proyecto

CV web profesional desarrollado como proyecto academico, implementando las mejores practicas de desarrollo web, containerizacion con Docker y integracion con APIs de terceros (Facebook Comments).

## 🛠️ Tecnologias Utilizadas

### Frontend
- **HTML5**: Estructura semantica del CV
- **CSS3**: Estilos responsivos con animaciones modernas
- **JavaScript**: Interactividad y animaciones de scroll
- **Font Awesome 6.0**: Iconografia profesional
- **Google Fonts**: Tipografia Arial para compatibilidad maxima

### DevOps y Deployment
- **Docker**: Containerizacion de la aplicacion
- **Docker Compose**: Orquestacion de contenedores
- **Nginx Alpine**: Servidor web ligero y eficiente
- **Facebook SDK**: Integracion de comentarios sociales

## 📁 Estructura del Proyecto

```
Proyecto_CV/
│
├── index.html              # Pagina principal del CV
├── styles.css              # Estilos CSS del proyecto
├── Dockerfile              # Configuracion de imagen Docker
├── docker-compose.yml      # Orquestacion de servicios
├── README.md               # Documentacion del proyecto
└── .gitignore              # Archivos excluidos del control de versiones
```

## 🏗️ Arquitectura del Proyecto

```
┌─────────────────────────────────────────┐
│         Cliente (Navegador)             │
│                                         │
│  ┌──────────────┐    ┌──────────────┐  │
│  │  HTML/CSS    │    │ JavaScript   │  │
│  │  Estatico    │◄──►│ Interactivo  │  │
│  └──────────────┘    └──────────────┘  │
└────────────┬────────────────────────────┘
             │ HTTP/HTTPS
             ▼
┌─────────────────────────────────────────┐
│         Contenedor Docker                │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     Nginx Alpine (Puerto 80)      │  │
│  │                                   │  │
│  │  - Servir archivos estaticos     │  │
│  │  - Enrutamiento basico           │  │
│  │  - Compresion GZIP               │  │
│  └───────────────────────────────────┘  │
└────────────┬────────────────────────────┘
             │
             ▼
┌─────────────────────────────────────────┐
│     Servicio Externo (Facebook)         │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │     Facebook Comments API         │  │
│  │  - SDK de Facebook JS             │  │
│  │  - Widget de comentarios          │  │
│  └───────────────────────────────────┘  │
└─────────────────────────────────────────┘
```

## 🚀 Como Ejecutar el Proyecto

### Prerequisitos
- Docker instalado
- Docker Compose instalado
- Puerto 8080 disponible

### Instrucciones de Despliegue

1. **Clonar o descargar el proyecto**
```bash
cd Proyecto_CV
```

2. **Construir la imagen Docker**
```bash
docker-compose build
```

3. **Iniciar el contenedor**
```bash
docker-compose up -d
```

4. **Acceder al CV**
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

## 🔧 Configuracion de Facebook Comments

### Pasos para Configurar Facebook Comments

1. **Crear una App en Facebook Developers**
   - Visita: https://developers.facebook.com/
   - Crear una nueva aplicacion
   - Seleccionar tipo "Pagina web"

2. **Obtener App ID**
   - Copiar el App ID de tu aplicacion

3. **Configurar Dominios Permitidos**
   - Agregar `localhost` para desarrollo
   - Agregar tu dominio de produccion

4. **Actualizar el Codigo**
   - En `index.html`, reemplazar `TU_APP_ID_AQUI` con tu App ID real

## 📊 Caracteristicas del CV

### Secciones Implementadas
1. **Header**: Informacion personal y contacto
2. **Sobre Mi**: Descripcion profesional y highlights
3. **Experiencia**: Historial laboral con fechas
4. **Habilidades**: Categorias de skills tecnicos
5. **Proyectos**: Portafolio con programacion lineal
6. **Comentarios**: Integracion de Facebook Comments
7. **Footer**: Redes sociales y contacto

### Funcionalidades
- ✅ Diseno responsive (movil, tablet, desktop)
- ✅ Animaciones de scroll suaves
- ✅ Integracion con redes sociales
- ✅ Optimizado para SEO
- ✅ Carga rapida (Nginx + Alpine)
- ✅ Containerizado con Docker

## 🎨 Decisiones de Diseno

### Colores
- **Verde Principal**: #228B22 (Tema irlandes)
- **Verde Oscuro**: #006400 (Gradientes)
- **Verde Claro**: #90EE90 (Acentos)
- **Dorado**: #FFD700 (Destacados)
- **Gris Claro**: #F5F5F5 (Fondos)

### Tipografia
- **Fuente Principal**: Arial (Compatibilidad maxima)
- **Tamanos Responsivos**: rem y porcentajes

### Interactividad
- Animaciones de entrada con IntersectionObserver
- Efectos hover en elementos interactivos
- Smooth scroll para navegacion
- Transiciones suaves (0.3s - 0.6s)

## 📈 Optimizaciones Implementadas

1. **Rendimiento**
   - Imagen Nginx Alpine (ultra ligera)
   - Sin dependencias backend
   - Compresion GZIP automatica
   - Cache de assets estaticos

2. **SEO**
   - Meta tags semanticos
   - Estructura HTML5 semantica
   - Open Graph para redes sociales

3. **Accesibilidad**
   - Contraste de colores adecuado
   - Iconografia descriptiva
   - Navegacion por teclado
   - Etiquetas semanticas

## 🔒 Seguridad

- Contenedor no-root user
- Solo puerto necesario expuesto
- Sin datos sensibles en el codigo
- HTTPS recomendado para produccion

## 📝 Licencia

Este proyecto es academico y de uso personal.

## 👤 Autor

**Gael Ramses Escobedo Huerta**
- Email: gael.escobedohuerta@cesunbc.edu.mx
- Facebook: https://www.facebook.com/gael.escobedo.148
- Instagram: https://www.instagram.com/gato_rx8/

## 🙏 Agradecimientos

- CESUN por la educacion en Ingenieria de Software
- Comunidad de desarrolladores open source
- Facebook Developers por la API de comentarios

---

**Version**: 1.0.0  
**Ultima actualizacion**: Enero 2025

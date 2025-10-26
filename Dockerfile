# Dockerfile simple para CV Profesional

FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copiar solo los archivos necesarios
COPY index.html .
COPY styles.css .

# Exponer puerto 80
EXPOSE 80

# Comando de inicio
CMD ["nginx", "-g", "daemon off;"]

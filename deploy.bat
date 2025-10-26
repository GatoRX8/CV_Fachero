@echo off
REM Script de despliegue automático para CV Profesional
REM 🍀 May the code be with you!

echo ==========================================
echo 🍀 CV Profesional - Despliegue Automático
echo ==========================================
echo.

REM Verificar que Docker esté instalado
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker no está instalado. Instálalo desde https://docker.com
    pause
    exit /b 1
)

echo ✅ Docker encontrado
docker --version

REM Verificar archivos necesarios
echo ℹ️ Verificando archivos necesarios...

if not exist "index.html" (
    echo ❌ Archivo index.html no encontrado
    pause
    exit /b 1
)

if not exist "styles.css" (
    echo ❌ Archivo styles.css no encontrado
    pause
    exit /b 1
)

if not exist "script.js" (
    echo ❌ Archivo script.js no encontrado
    pause
    exit /b 1
)

if not exist "facebook-config.js" (
    echo ❌ Archivo facebook-config.js no encontrado
    pause
    exit /b 1
)

if not exist "Dockerfile" (
    echo ❌ Archivo Dockerfile no encontrado
    pause
    exit /b 1
)

if not exist "nginx.conf" (
    echo ❌ Archivo nginx.conf no encontrado
    pause
    exit /b 1
)

echo ✅ Todos los archivos necesarios están presentes

REM Crear directorio de logs si no existe
if not exist "logs" mkdir logs

REM Detener contenedores existentes
echo ℹ️ Deteniendo contenedores existentes...
docker-compose down 2>nul

REM Limpiar imágenes anteriores si se especifica --clean
if "%1"=="--clean" (
    echo ℹ️ Limpiando imágenes anteriores...
    docker rmi cv-profesional_cv-profesional 2>nul
)

REM Construir la imagen
echo ℹ️ Construyendo imagen Docker...
docker-compose build --no-cache

REM Iniciar el contenedor
echo ℹ️ Iniciando contenedor...
docker-compose up -d

REM Esperar a que el contenedor esté listo
echo ℹ️ Esperando a que el servicio esté listo...
timeout /t 10 /nobreak >nul

REM Verificar que el contenedor esté funcionando
docker ps | findstr cv-gael-r >nul
if errorlevel 1 (
    echo ❌ El contenedor no se inició correctamente
    echo ℹ️ Verificando logs...
    docker logs cv-gael-r
    pause
    exit /b 1
)

echo ✅ Contenedor iniciado correctamente

REM Verificar que el servicio esté respondiendo
echo ℹ️ Verificando que el servicio esté respondiendo...
curl -f http://localhost:8080/health >nul 2>&1
if errorlevel 1 (
    echo ⚠️ El servicio no está respondiendo en el puerto 8080
) else (
    echo ✅ Servicio respondiendo correctamente
)

REM Mostrar información del despliegue
echo.
echo ==========================================
echo 🎉 ¡Despliegue completado exitosamente!
echo ==========================================
echo.
echo ℹ️ URLs disponibles:
echo   🌐 CV Principal: http://localhost:8080
echo   🧪 Página de Pruebas: http://localhost:8080/test.html
echo   ❤️ Health Check: http://localhost:8080/health
echo.
echo ℹ️ Comandos útiles:
echo   📊 Ver logs: docker logs cv-gael-r
echo   🛑 Detener: docker-compose down
echo   🔄 Reiniciar: docker-compose restart
echo   📈 Estado: docker ps
echo.
echo 🍀 ¡Tu CV con temática irlandesa está listo!
echo.

REM Mostrar estado del contenedor
echo ℹ️ Estado del contenedor:
docker ps --filter "name=cv-gael-r" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

pause
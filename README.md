# React_Vite_Docker

Actividad evaluada: React + Vite con Docker.

## Objetivo
Aplicacion de una sola pagina que muestra un elemento h1, ejecutable en local y dentro de Docker.

## Requisitos
- Node.js 20+
- npm
- Docker (opcional para validacion en contenedor)

## Ejecutar en local
1. Instalar dependencias:
	- npm install
2. Iniciar app:
	- npm run dev
3. Abrir:
	- http://localhost:5173

## Construccion de produccion
- npm run build

## Ejecutar con Docker
1. Construir imagen:
	- docker build -t react-vite-docker .
2. Ejecutar contenedor:
	- docker run --rm -p 5173:5173 react-vite-docker
3. Abrir:
	- http://localhost:5173

## Publicar en Docker Hub
1. Crear repositorio en Docker Hub (ejemplo: `usuario/react-vite-docker`).
2. Iniciar sesion desde terminal:
	- docker login
3. Construir imagen local:
	- docker build -t usuario/react-vite-docker:latest .
4. Subir imagen:
	- docker push usuario/react-vite-docker:latest
5. Verificar ejecucion desde Docker Hub:
	- docker run --rm -p 5173:5173 usuario/react-vite-docker:latest

## Sin Docker Desktop (opcion recomendada)
Si Docker Desktop no funciona, este repositorio incluye workflow para construir y publicar en Docker Hub desde GitHub Actions.

### Configuracion inicial
1. Crear un Access Token en Docker Hub (Account Settings -> Personal Access Tokens).
2. En GitHub, abrir Settings -> Secrets and variables -> Actions.
3. Crear estos secretos:
	- `DOCKERHUB_USERNAME` = tu usuario de Docker Hub
	- `DOCKERHUB_TOKEN` = tu token de Docker Hub

### Publicacion automatica
- El workflow se ejecuta al hacer push a `main` o manualmente desde Actions.
- Publica la imagen en:
	- `DOCKERHUB_USERNAME/react-vite-docker:latest`
	- `DOCKERHUB_USERNAME/react-vite-docker:<sha-corto>`

### Probar imagen publicada
- docker pull DOCKERHUB_USERNAME/react-vite-docker:latest
- docker run --rm -p 5173:5173 DOCKERHUB_USERNAME/react-vite-docker:latest

## Validacion automatica (skill)
- powershell -ExecutionPolicy Bypass -File ./.github/skills/actividad-evaluada/scripts/validar.ps1

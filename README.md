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

## Validacion automatica (skill)
- powershell -ExecutionPolicy Bypass -File ./.github/skills/actividad-evaluada/scripts/validar.ps1

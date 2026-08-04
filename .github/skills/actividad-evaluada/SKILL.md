---
name: actividad-evaluada
description: 'Guia paso a paso para completar la Actividad Evaluada de React + Vite con Docker y GitHub. Usar cuando necesites crear la app de una pagina con <h1>, contenedor Docker funcional y repositorio publico bien organizado.'
argument-hint: 'Describe el estado actual del proyecto y lo que ya tienes hecho'
user-invocable: true
---

# Actividad Evaluada: React + Vite con Docker

## Cuando usar este skill
- Cuando debas resolver la actividad evaluada de React, Vite, Docker y GitHub.
- Cuando necesites una lista de pasos exacta y verificable para cumplir todos los requisitos.
- Cuando quieras validar que el proyecto este listo para entrega.

## Objetivo
Construir una aplicacion frontend basica con React + Vite, ejecutarla en Docker y publicar el codigo en GitHub con buenas practicas.

## Procedimiento
1. Crear el proyecto React con Vite.
2. Dejar una sola pagina con un elemento h1 visible.
3. Crear y probar el Dockerfile para ejecutar la app en contenedor.
4. Subir el codigo a un repositorio publico en GitHub.
5. Verificar cada criterio antes de entregar.

## Modo rapido (automatico)
Si quieres avanzar mas rapido, sigue este flujo:
1. Copiar la plantilla [Dockerfile.template](./assets/Dockerfile.template) como Dockerfile en la raiz del proyecto.
2. Ajustar solo si tu proyecto usa un puerto diferente.
3. Ejecutar validacion automatica con [validar.ps1](./scripts/validar.ps1).
4. Corregir cualquier error reportado y volver a ejecutar.

## Pasos detallados

### 1) Crear proyecto con React y Vite
1. Inicializar proyecto con plantilla React:
   - npm create vite@latest nombre-proyecto -- --template react
2. Instalar dependencias:
   - npm install
3. Ejecutar en local para validar:
   - npm run dev

### 2) Implementar la pagina unica con h1
1. Editar la vista principal para que muestre solo una pagina.
2. Incluir un h1 con el texto definido para la actividad.
3. Confirmar en navegador que el h1 se visualiza correctamente.

### 3) Contenerizar con Docker
1. Crear archivo Dockerfile en la raiz del proyecto.
   - Puedes partir desde [Dockerfile.template](./assets/Dockerfile.template).
2. Usar una imagen base de Node apropiada para Vite.
3. Copiar package.json y package-lock.json, instalar dependencias y copiar el codigo fuente.
4. Exponer el puerto de desarrollo (normalmente 5173).
5. Definir comando de inicio para ejecutar Vite accesible desde fuera del contenedor.

Referencia de estructura y checklist: [criterios](./references/criterios.md).

### 4) Construir y ejecutar contenedor
1. Construir imagen:
   - docker build -t react-vite-docker .
2. Ejecutar contenedor:
   - docker run --rm -p 5173:5173 react-vite-docker
3. Abrir navegador y validar que la app responde y muestra el h1.
4. Opcional: correr validacion automatica:
   - powershell -ExecutionPolicy Bypass -File ./.github/skills/actividad-evaluada/scripts/validar.ps1

### 5) Publicar en GitHub
1. Verificar que el repositorio sea publico.
2. Confirmar que se incluya:
   - Codigo fuente completo
   - Dockerfile
3. Subir cambios con mensajes claros de commit.

## Criterios de verificacion finales
- Proyecto creado correctamente con React + Vite.
- Una sola pagina con h1 visible.
- Dockerfile configurado y funcional.
- Aplicacion ejecutando correctamente dentro de Docker.
- Repositorio publico de GitHub ordenado y completo.

## Entregable minimo esperado
- Codigo React + Vite funcional
- Dockerfile funcional
- Repositorio GitHub publico con todo el contenido

## Recursos del skill
- Plantilla Docker: [Dockerfile.template](./assets/Dockerfile.template)
- Validacion automatica: [validar.ps1](./scripts/validar.ps1)
- Criterios de evaluacion: [criterios](./references/criterios.md)

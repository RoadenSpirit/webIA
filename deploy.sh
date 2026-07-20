#!/bin/bash

# Script de construcción y despliegue local para WebIA
echo "=== Iniciando construcción de WebIA ==="

# Ir al directorio del proyecto
cd /home/carmay-dev/proyectos/webIA || exit

# Ejecutar la compilación de Astro
npm run build

if [ $? -eq 0 ]; then
  echo "=== Construcción completada con éxito! ==="
  echo "Los archivos estáticos actualizados están listos en: /home/carmay-dev/proyectos/webIA/dist"
else
  echo "❌ Error durante la construcción de Astro"
  exit 1
fi

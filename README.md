# Innovatech Chile - Frontend Application (Equipo Caltías) 🚀

[cite_start]Este repositorio contiene el componente de interfaz de usuario para el proyecto de gestión de Innovatech Chile, etapa 2[cite: 26]. [cite_start]La solución ha sido diseñada bajo principios DevOps para garantizar un despliegue ágil, seguro y escalable en la nube de AWS[cite: 12, 158].

## 🐳 Contenedorización (IE1)
[cite_start]La aplicación ha sido dockerizada siguiendo las mejores prácticas de la industria[cite: 28, 88]:
- [cite_start]**Dockerfile Multi-stage:** Se implementó una construcción en etapas para optimizar el tamaño de la imagen final y mejorar la seguridad al separar el entorno de compilación del de ejecución[cite: 29, 91, 129].
- [cite_start]**Seguridad:** El contenedor se ejecuta bajo un usuario no-root para minimizar privilegios y reducir la superficie de ataque[cite: 91, 129].
- [cite_start]**Optimización:** Limpieza de capas y gestión eficiente de dependencias para acelerar los tiempos de despliegue[cite: 91].

## 🛠️ Orquestación Local (IE2)
[cite_start]Para facilitar el desarrollo y pruebas locales, se incluye un archivo `docker-compose.yml` que levanta el stack completo de servicios (Frontend, Backend y Base de Datos) de forma conjunta[cite: 30, 92, 139].
- **Uso:** `docker-compose up -d`
- [cite_start]**Redes:** Se define una red interna bridge para permitir la comunicación aislada entre los servicios[cite: 139].

## 🔄 Pipeline CI/CD (IE4)
[cite_start]Se implementó un flujo automatizado mediante **GitHub Actions**[cite: 39, 102]:
- [cite_start]**Triggers:** El pipeline se activa automáticamente al realizar un `push` sobre la rama `deploy`[cite: 44, 113, 145].
- [cite_start]**Flujo:** Construcción de imagen -> Publicación en Docker Hub -> Despliegue automático en instancia EC2 mediante SSH[cite: 40, 41, 42, 104, 144].
- [cite_start]**Gestión de Secrets:** Uso de GitHub Secrets para proteger credenciales y variables críticas[cite: 43, 114, 146].

## ☁️ Despliegue en AWS (IE5)
[cite_start]La instancia de Frontend es la única accesible desde Internet (IP Pública), respetando la arquitectura de seguridad definida[cite: 175]:
- [cite_start]**Infraestructura:** Despliegue en Amazon EC2 dentro de una VPC personalizada[cite: 56, 121].
- [cite_start]**Security Groups:** Solo se permite tráfico entrante por el puerto 80 (HTTP) y el puerto 22 para administración segura[cite: 57, 122].
# Usamos una imagen ligera de Python
FROM python:3.9-slim

# Directorio de trabajo
WORKDIR /app

# Instalamos dependencias primero (por caché)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código
COPY . .

# Flask usa el puerto 5000 por defecto
EXPOSE 5000

# Comando para arrancar la app
CMD ["python", "app.py"]
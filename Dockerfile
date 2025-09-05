FROM python:3.12-slim

WORKDIR /app

# Installa uv
RUN pip install uv

# Copia tutti i sorgenti nella directory /app
COPY . /app

# Sincronizza l’ambiente Python con le dipendenze e il progetto tramite uv
RUN uv sync

# File .env (opzionale): copia se lo usi
#COPY .env /app/.env

CMD ["python", "main.py"]

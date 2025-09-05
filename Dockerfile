FROM python:3.13-slim

# Installazione delle dipendenze di sistema necessarie per la compilazione (libffi-dev per httpx)
RUN apt-get update && apt-get install -y build-essential libffi-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia i file di progetto per installare le dipendenze
COPY pyproject.toml uv.lock /app/

# Installa uv, poi sincronizza le dipendenze esatte dal lockfile
RUN pip install uv
RUN uv sync

# Copia tutto il resto del progetto nello spazio di lavoro
COPY . /app

# Comando di avvio del container
CMD ["python", "main.py"]

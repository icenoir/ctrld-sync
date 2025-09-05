FROM python:3.12-slim

# Installazione di system dependencies per compilazione, se serve
RUN apt-get update && apt-get install -y build-essential libffi-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia i file di progetto (incluso pyproject.toml e uv.lock)
COPY pyproject.toml uv.lock /app/

# Installa uv (gestore dipendenze) e sincronizza le dipendenze dal lockfile
RUN pip install uv
RUN uv sync 

# Copia il resto dei file sorgenti
COPY . /app

# Esponi la porta se necessario (dipende dal progetto)
# EXPOSE 8000

# Comando di avvio (adatta se serve)
CMD ["python", "main.py"]

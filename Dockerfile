# Usa la versione Python richiesta dal progetto
FROM python:3.13-slim

# Installa dipendenze di sistema necessarie per compilare dipendenze Python
RUN apt-get update && apt-get install -y build-essential libffi-dev && rm -rf /var/lib/apt/lists/*

# Setta la working directory nel container
WORKDIR /app

# Copia i file di configurazione per installare le dipendenze prima del codice
COPY pyproject.toml uv.lock /app/

# Installa uv e sincronizza l’ambiente in base al lockfile
RUN pip install uv
RUN uv sync

# Copia il resto del codice sorgente
COPY . /app

# Imposta variabili d’ambiente (da passare o tramite Dockerfile o docker-compose)
# ENV TOKEN=your_token_here
# ENV PROFILE=your_profile_id

# Comando di avvio dell’app
CMD ["python", "main.py"]


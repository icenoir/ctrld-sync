FROM python:3.12-slim

# Install uv, git, e dipendenze di base
RUN pip install uv

# Copia i sorgenti nel container
WORKDIR /app
COPY . /app

# Installa le dipendenze del progetto
RUN uv pip install -r requirements.txt

# Comando per eseguire lo script principale
CMD ["python", "main.py"]

FROM python:3.13-slim

RUN apt-get update && apt-get install -y build-essential libffi-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN pip install uv

RUN uv sync

RUN pip list   # Debug: lista pacchetti installati

RUN pip install python-dotenv httpx 

COPY . .

CMD ["python", "main.py"]



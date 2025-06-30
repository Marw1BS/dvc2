FROM python:3.12-slim

WORKDIR /app

# Installer git (nécessaire pour DVC)
RUN apt-get update && apt-get install -y git

# Copier requirements.txt et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Installer DVC avec support de DagsHub (HTTP)
RUN pip install dvc[http]

# Copier tout le projet (code + config DVC)
COPY . .

# Récupérer les données suivies par DVC (comme le modèle)
RUN dvc pull -f

EXPOSE 8000

# Lancer l'API FastAPI
CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]

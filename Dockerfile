FROM python:3.12-slim

WORKDIR /app

# Installer git (nécessaire pour DVC)
RUN apt-get update && apt-get install -y git && apt-get clean

# Copier requirements.txt et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Installer DVC avec support DagsHub (HTTP)
RUN pip install dvc[http]

# Copier tout le projet
COPY . .

# Copier le modèle suivi par DVC (si tu l’as dvc add + dvc push)
# Assure-toi que .dvc/config et .dvc/cache existent
RUN dvc pull -f || echo "⚠️ DVC pull failed (peut-être en local seulement)"

# Exposer le port
EXPOSE 8000

# Lancer FastAPI
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

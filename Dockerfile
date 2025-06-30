FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Ajoute DVC + Git (pour pouvoir faire dvc pull depuis DagsHub)
RUN pip install dvc[gs] git

# Copie tout le projet (y compris .dvc, .gitignore, src etc.)
COPY . .

# Récupère les données suivies par DVC (comme le modèle)
RUN dvc pull -f

EXPOSE 8000

CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]

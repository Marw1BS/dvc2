from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from starlette.middleware.httpsredirect import HTTPSRedirectMiddleware
from starlette.middleware.trustedhost import TrustedHostMiddleware
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.middleware.proxy_headers import ProxyHeadersMiddleware
import joblib
import pandas as pd

app = FastAPI()

# Support HTTPS behind proxy
app.add_middleware(ProxyHeadersMiddleware, trusted_hosts="*")

# Autoriser CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Chargement du modèle
model = joblib.load("models/random_forest_model/model.joblib")
print("✅ Modèle chargé avec succès")

@app.get("/")
def read_root():
    return {"message": "API UP ✅"}

@app.get("/predict")
def predict_example():
    # Ex de prédiction avec des valeurs mock
    input_data = {
        "feature1": 1.0,
        "feature2": 2.0,
        "feature3": 3.0,
        "feature4": 4.0
    }
    df = pd.DataFrame([input_data])
    prediction = model.predict(df)[0]
    return {"prediction": str(prediction)}

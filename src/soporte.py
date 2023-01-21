from geopy.geocoders import Nominatim
import pandas as pd

def obtener_estado(row):
    geolocator = Nominatim(user_agent="geoapiExercises")
    # Obtener la localización completa a partir de las coordenadas
    location = geolocator.reverse(f"{row['latitude']}, {row['longitude']}", exactly_one=True)
    # Obtener el estado a partir de la localización completa
    try:
        state = location.raw['address']['state']
    except (KeyError, TypeError):
        state = None
    return state

def exploration_df (df):
    df.shape
    df.info()
    df.describe().T
    df.columns
    df.duplicated().sum()
    df.isnull().sum()

import pandas as pd

def exploration_df (df):
    df.shape
    df.info()
    df.describe().T
    df.columns
    
def get_nulls (df):
    df.isnull().sum()
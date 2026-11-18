import pandas as pd
from pathlib import Path
df=pd.read_csv(Path(__file__).resolve().parents[1]/"data"/"ecommerce_sales.csv",parse_dates=["order_date"])
df=df.drop_duplicates()
df["month"]=df.order_date.dt.to_period("M").astype(str)
print("Total revenue:",df.revenue.sum())
print("Revenue by category:\n",df.groupby("category").revenue.sum().sort_values(ascending=False))
print("Monthly revenue:\n",df.groupby("month").revenue.sum())

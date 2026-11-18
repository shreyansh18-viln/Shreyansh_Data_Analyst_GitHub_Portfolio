import pandas as pd
from pathlib import Path
df=pd.read_csv(Path(__file__).resolve().parents[1]/"data"/"bank_transactions.csv",parse_dates=["transaction_date"]).drop_duplicates()
ok=df[df.status=="Successful"]
print("Transaction rows:",len(df))
print("Successful transaction value:",round(ok.amount.sum(),2))
print(ok.groupby("transaction_type").agg(tx_count=("transaction_id","count"),total_amount=("amount","sum")))
print(ok.groupby("channel").amount.agg(["count","sum","mean"]))

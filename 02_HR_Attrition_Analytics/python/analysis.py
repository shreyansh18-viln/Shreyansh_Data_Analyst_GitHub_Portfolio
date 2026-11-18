import pandas as pd
from pathlib import Path
df=pd.read_csv(Path(__file__).resolve().parents[1]/"data"/"hr_employee_data.csv").drop_duplicates()
print("Employees:",len(df))
print("Attrition rate %:",round((df.attrition.eq("Yes").mean()*100),2))
print(df.groupby("department").agg(headcount=("employee_id","count"),avg_salary=("monthly_salary","mean"),attrition_rate=("attrition",lambda s:100*(s=="Yes").mean())))

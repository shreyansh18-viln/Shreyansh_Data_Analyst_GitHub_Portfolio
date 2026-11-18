CREATE DATABASE IF NOT EXISTS banking_analytics; USE banking_analytics;
CREATE TABLE transactions(transaction_id VARCHAR(12) PRIMARY KEY, transaction_date DATE, account_id VARCHAR(12), transaction_type VARCHAR(30), amount DECIMAL(14,2), channel VARCHAR(30), status VARCHAR(20), branch_city VARCHAR(30));
-- Import data/bank_transactions.csv using MySQL Workbench, then run:
SELECT status,COUNT(*) transaction_count FROM transactions GROUP BY status;
SELECT transaction_type,COUNT(*) tx_count,SUM(amount) total_amount FROM transactions WHERE status='Successful' GROUP BY transaction_type ORDER BY total_amount DESC;
SELECT channel,ROUND(AVG(amount),2) avg_amount FROM transactions WHERE status='Successful' GROUP BY channel;
SELECT branch_city,COUNT(*) tx_count FROM transactions GROUP BY branch_city ORDER BY tx_count DESC;
SELECT account_id,SUM(amount) total_value FROM transactions WHERE status='Successful' GROUP BY account_id ORDER BY total_value DESC LIMIT 10;

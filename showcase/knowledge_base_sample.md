# How to Investigate Failed QR Transactions

1. **Check Logs**
   - Use Splunk to search logs:
     ```
     index=payment_logs "QR" error
     ```
2. **Query Error Codes**
   - Run SQL query to group failures by error code.

3. **Review Configurations**
   - Check routing rules for changes in the past 24 hours.
   - Verify credentials in config files.

4. **Escalation Criteria**
   - If root cause is not identified within 2 hours, escalate to Product/Engineering.

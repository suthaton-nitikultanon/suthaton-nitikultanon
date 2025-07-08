# Jira Ticket: Investigate High Timeout Errors on eWallet Payments

- **Issue Type:** Bug
- **Priority:** High (P2)
- **Reporter:** Suthaton Nitikultanon
- **Assignee:** Payment Engineering Team

## Description

Since 2025-04-20, timeout errors for eWallet transactions increased from avg. 50/day to 350/day.

## Investigation Steps

- Check logs in Splunk for error trends.
- Run SQL queries to identify affected merchant IDs.
- Verify system configurations for recent changes.

## Acceptance Criteria

- Root cause identified and documented.
- Preventive actions proposed.
- Knowledge base updated.

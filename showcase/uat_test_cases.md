# Test Cases: Verify Routing Rule Changes

## Test Case 1

- **Title:** Process QR transaction after routing change
- **Given:** New routing rule deployed to gateway
- **When:** A test transaction is submitted
- **Then:** Transaction should be routed to new endpoint successfully
- **Expected Result:** No timeouts or errors

---

## Test Case 2

- **Title:** Rollback routing rule
- **Given:** A rollback is triggered
- **When:** Transaction is submitted
- **Then:** Transaction should follow previous routing path
- **Expected Result:** Transaction succeeds without timeout

---

## Test Case 3

- **Title:** SLA Validation
- **Given:** Normal traffic volume
- **When:** Transactions processed over 1 hour
- **Then:** 95% of transactions complete under 10 seconds

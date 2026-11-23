# Environment
- DBMS: MySQL Community Server 8.4.11 (InnoDB engine).
- Client: DBeaver Community / MySQL CLI (UTF-8 encoding).
- Account prerequisites: A MySQL account with privileges to create/select a database and run DDL, DML, views, indexes, and SELECT queries (no credentials stored in repository).
- Approval reference: null (transaction commit/rollback scripts and tests are omitted per the instructor's email announcement).

# Build
- Create an empty dedicated database and select it as active (do not include CREATE/DROP DATABASE in SQL scripts).
- Run construction scripts in order (`sql/01_schema.sql`, `sql/02_data.sql`, `sql/03_views.sql`, `sql/04_indexes.sql`).

# Queries
- Run `queries/Q01.sql` through `queries/Q08.sql` on the freshly constructed seed baseline before running tests.
- Export each query's result set (including column headers) to `evidence/query_results/Qxx.csv`, encoding SQL `NULL` as `\N` and keeping empty strings empty.

# Tests
- Start each test from a freshly constructed seed database (or re-run `01_schema.sql` and `02_data.sql` to restore the seed baseline between tests).
- Run `tests/positive.sql` for valid operations (`POS01`–`POS06`).
- Run each negative test file `tests/negative/N01.sql`–`N08.sql` separately outside construction, record the MySQL error number and before/after state in `evidence/test_cases.csv`, and restore the seed baseline afterward.
- Transaction commit/rollback scripts are omitted per the instructor's email announcement.

# Limitations
- Declarative DDL enforces primary keys, unique constraints (`email`, `type_name`), `ON DELETE RESTRICT` / `ON UPDATE RESTRICT` foreign keys, `status` ENUM, non-empty names, `capacity >= 1`, and `end_time > start_time`.
- Cross-row/temporal rules—confirmed booking capacity cap, at most one active booking per session, max two active bookings across future sessions, FIFO waitlist promotion on cancellation, and post-end-time completion—are not enforced by declarative `CHECK`/`UNIQUE` constraints in `01_schema.sql` alone.
- Excluded processes: walk-in consultations, payment gateways, automated notifications, multi-centre sync, background schedulers, and concurrency locking.

# File inventory
- `metadata.json`, `README.md`, `report.pdf`, `contribution.pdf`, `ai_usage.md`, `presentation.pdf`
- `sql/01_schema.sql`, `sql/02_data.sql`, `sql/03_views.sql`, `sql/04_indexes.sql`
- `queries/Q01.sql`–`Q08.sql`
- `tests/positive.sql` and `tests/negative/N01.sql`–`N08.sql`
- `evidence/query_map.csv`, `evidence/test_cases.csv`, and `evidence/query_results/Q01.csv`–`Q08.csv`

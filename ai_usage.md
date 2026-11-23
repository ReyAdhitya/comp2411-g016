# AI Usage Declaration (Stage 2)

## 1. Tool Identification
* **Tool used**: Claude (Anthropic), used by Reysendrya Athaya Adhitya.
* **Stage**: Stage 2 (Implementation and Demonstration).
* Other members: see Section 6.

## 2. Purpose of Assistance
* **Debugging and verification**: rebuilt the database from scratch on MySQL 8.4 (01_schema → 02_data → 03_views → 04_indexes), ran queries Q01–Q08 and the group's tests (tests/positive.sql, tests/negative/N01–N08), and reported errors and actual outcomes. These checks found that the `CHECK (id > 0)` constraints on AUTO_INCREMENT columns fail on MySQL 8 (error 3818), and that a `USE g_16test;` line would break the build in the marker's database. Both were then removed.
* **Seed data fit**: compared 02_data.sql against F Jo's draft queries and listed which values needed changing (session type names, October dates, an extra past session and bookings) so that every query returns rows. Rey made the edits.
* **View guidance**: explained what `v_session_summary(session_id, type_id, waitlisted_count)` needed to return for Q03 (LEFT JOIN, count only 'Waitlisted', one row per session). Rey wrote the view; AI saved it to sql/03_views.sql and tested it.
* **Evidence capture**: produced the result screenshots (Q01–Q08, view, build/row counts, SHOW INDEX/EXPLAIN, test runs) from real MySQL output and placed them into the report and slide placeholders with one-line factual captions. It also exported evidence/query_results/Q01–Q08.csv from a clean run.
* **Repository housekeeping**: moved the query files to the required top-level `queries/` folder and created this file and metadata.json from the course format.
* **Templates and suggestions**: made an empty contribution-declaration form (names, IDs, file ownership only). It also suggested which points the seed-data paragraph in report Section 7.2 should cover; Rey wrote the text.

## 3. Affected Files and Sections
* sql/01_schema.sql, sql/02_data.sql: removal of `USE g_16test;` (and the invalid id CHECKs found in testing).
* sql/03_views.sql: Rey's view, saved and tested with AI help.
* queries/ (moved from sql/queries/; content unchanged), evidence/query_results/*.csv, metadata.json, ai_usage.md.
* Report: screenshots in Sections 7.1–7.3, 7.5, 8.3, 9.1, 9.2 and 10.6 (images and captions only).
* Presentation: screenshots on the build slide and the insight/index slide.
* contribution.pdf: blank form layout only.

## 4. Acceptance and Rejection of Content
* **Accepted**: test results, error diagnoses, screenshots, CSV exports and file moves, after the group checked them against their own runs.
* **Rejected / not used**: AI was asked to write 03_views.sql, the report text and the test scripts outright. This was declined, because Section 8 of the guidance requires the core SQL and report to be the group's own work; AI gave explanations and specifications instead. Testing showed that capacity (Rule 2), active-booking uniqueness and limit (Rules 5–6), FIFO promotion (Rule 8) and the completion timing (Rule 9) are **not** enforced by the schema. The group recorded this as a limitation instead of adding AI-written triggers.

## 5. Group Verification Method
* On 23 Nov 2026 the full build (01 → 04), queries Q01–Q08 and all tests were re-run from an empty MySQL 8.4 database. ADHITYA Reysendrya Athaya checked the outputs against the screenshots, the CSVs and evidence/test_cases.csv.
* The view and seed data were checked by Rey against the Q03 output and the expected results in the report.

## 6. Other Members' AI Use
* [TO BE COMPLETED BY EACH MEMBER: state "No AI assistance was used" or list tool, purpose, affected files, what was accepted or rejected, and how it was checked.]
* Brayden Aaron Santoso (schema, report, slides): ...
* Fransiskus Jonathan Muljadi (queries Q01–Q08, 04_indexes.sql): ...
* Oshea Joshua Tangyong (tests, evidence CSVs, README): ...

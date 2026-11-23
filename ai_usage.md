# AI Usage Declaration (Stage 2)

## 1. Tool Identification
* **Tools**: Claude (Anthropic), used by Reysendrya Athaya Adhitya; Gemini (Google), used by Fransiskus Jonathan Muljadi and Oshea Joshua Tangyong (see Section 6).

## 2. Purpose of Assistance
* Testing: rebuilding the database, running Q01–Q08 and the tests, and finding errors (invalid id CHECKs, a `USE` line).
* Evidence: result/test screenshots for the report and slides, and the Q01–Q08 result CSVs.
* Housekeeping: moving queries to `queries/`, metadata.json, and blank templates (contribution form).
* SQL and text help: completing the `v_session_summary` view from Rey's input, and drafting the four seed-data sentences in report Section 7.2.

## 3. Affected Files and Sections
* sql/01_schema.sql, sql/02_data.sql (fixes), sql/03_views.sql, queries/, evidence/query_results/, metadata.json.
* Report: Section 7.2 seed-data sentences, plus screenshots and captions. Slides: screenshots.

## 4. Acceptance and Rejection of Content
* Accepted after review: test findings, fixes, the view, the 7.2 sentences, screenshots and CSVs.
* Rejected: AI-written tests and other report text (kept as the group's own work), and adding triggers for the rules testing showed are not enforced (capacity, FIFO promotion, booking limits). These are listed as limitations instead.

## 5. Group Verification Method
* On 23 Nov 2026 Rey (ADHITYA Reysendrya Athaya) reviewed every AI-assisted change and compared the re-run results from an empty MySQL 8.4 database against the screenshots and CSVs.

## 6. Other Members' AI Use
* **Brayden Aaron Santoso**: No AI assistance was used.
* **Fransiskus Jonathan Muljadi**: Gemini (Google) assisted with queries Q01–Q08 and 04_indexes.sql. F Jo reviewed the output and ran the queries against the database.
* **Oshea Joshua Tangyong**: Gemini (Google) assisted with the test scripts (tests/), evidence CSVs and README.md. Oshea reviewed the output and ran the tests.

# TaskFlow user stories

| ID | Story | Acceptance criteria |
|----|-------|---------------------|
| R1 | As a user I can create a task with a title and optional description | AC1 title required, 1–120 chars; AC2 returns 201 with the new task's id |
| R2 | As a user I can see all my tasks | AC1 newest first; AC2 filter by status (todo, doing, done) |
| R3 | As a user I can update a task's status or text | AC1 invalid status returns 422; AC2 updated_at changes |
| R4 | As a user I can delete a task | AC1 returns 204; AC2 unknown id returns 404 |
| R5 | As a user I can do all of the above from a web page | AC1 no page reload needed; AC2 works on mobile width |
| R6 | As an operator I can check the app is alive | AC1 GET /health returns {"status":"ok"} and the git commit SHA |

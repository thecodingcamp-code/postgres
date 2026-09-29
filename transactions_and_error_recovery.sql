BEGIN;
INSERT INTO projects (name)
VALUES ('Security Audit')
RETURNING id, name;
SELECT id, name FROM projects WHERE name = 'Security Audit';
ROLLBACK;
SELECT id, name FROM projects WHERE name = 'Security Audit';

BEGIN;
INSERT INTO projects (name)
VALUES ('Security Audit')
RETURNING id, name;
COMMIT;
SELECT id, name FROM projects WHERE name = 'Security Audit';

-- The following intentionally triggers a foreign-key violation partway through
-- the transaction, to demonstrate that ROLLBACK discards the whole group of
-- changes -- including the valid insert that ran before the error.
BEGIN;
INSERT INTO tasks (project_id, title)
VALUES ((SELECT id FROM projects WHERE name = 'Security Audit'), 'Schedule audit kickoff')
RETURNING id, project_id, title;
INSERT INTO tasks (project_id, title)
VALUES (999, 'Bogus task')
RETURNING id, project_id, title;
SELECT id, title FROM tasks WHERE title = 'Schedule audit kickoff';
ROLLBACK;
SELECT id, title FROM tasks WHERE title = 'Schedule audit kickoff';

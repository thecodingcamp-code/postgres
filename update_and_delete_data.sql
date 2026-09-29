SELECT id, title, is_done
FROM tasks
WHERE title = 'Draft wireframes';

UPDATE tasks
SET is_done = true
WHERE title = 'Draft wireframes'
RETURNING id, title, is_done;

SELECT id, title, is_done
FROM tasks
WHERE project_id = 1;

UPDATE tasks
SET is_done = true
WHERE project_id = 1
RETURNING id, title, is_done;

SELECT id, title
FROM tasks
WHERE title = 'Review color palette';

DELETE FROM tasks
WHERE title = 'Review color palette'
RETURNING id, title;

-- The following demonstrates the effect of omitting WHERE.
-- It intentionally runs against a disposable copy of tasks, not the real table.
CREATE TABLE tasks_scratch AS SELECT * FROM tasks;

UPDATE tasks_scratch
SET is_done = true
RETURNING id, title, is_done;

DELETE FROM tasks_scratch
RETURNING id, title;

DROP TABLE tasks_scratch;

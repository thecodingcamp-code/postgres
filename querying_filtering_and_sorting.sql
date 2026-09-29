SELECT title, is_done
FROM tasks;

SELECT title
FROM tasks
WHERE project_id = 1;

SELECT id, title
FROM tasks
WHERE title = 'Draft wireframes';

SELECT title
FROM tasks
WHERE project_id = 1 AND is_done = false;

SELECT title
FROM tasks
ORDER BY title;

SELECT title
FROM tasks
ORDER BY title
LIMIT 2;

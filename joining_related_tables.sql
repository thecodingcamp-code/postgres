SELECT p.name AS project_name, t.title AS task_title, t.is_done
FROM tasks AS t
JOIN projects AS p ON t.project_id = p.id
ORDER BY p.name, t.title;

-- The following intentionally fails: id exists on both tables, so it's ambiguous
-- without qualifying it. This demonstrates why qualified column names matter.
SELECT id, title
FROM tasks AS t
JOIN projects AS p ON t.project_id = p.id;

SELECT p.name AS project_name, t.title AS task_title, t.is_done
FROM tasks AS t
JOIN projects AS p ON t.project_id = p.id
WHERE p.name = 'Website Redesign'
ORDER BY t.title;

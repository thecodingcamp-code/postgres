SELECT COUNT(*)
FROM tasks;

SELECT p.name AS project_name, COUNT(*) AS task_count
FROM tasks AS t
JOIN projects AS p ON t.project_id = p.id
GROUP BY p.name
ORDER BY p.name;

SELECT p.name AS project_name, COUNT(*) AS incomplete_task_count
FROM tasks AS t
JOIN projects AS p ON t.project_id = p.id
WHERE t.is_done = false
GROUP BY p.name
ORDER BY p.name;

-- Adding a project with no tasks yet, to demonstrate that JOIN omits it entirely
-- from the grouped report below (rather than showing it with a count of zero).
INSERT INTO projects (name)
VALUES ('Internal Wiki Migration')
RETURNING id, name, created_at;

SELECT p.name AS project_name, COUNT(*) AS task_count
FROM tasks AS t
JOIN projects AS p ON t.project_id = p.id
GROUP BY p.name
ORDER BY p.name;

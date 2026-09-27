INSERT INTO projects (name)
VALUES ('Website Redesign')
RETURNING id, name, created_at;

INSERT INTO projects (name)
VALUES ('Mobile App Launch'), ('Q4 Marketing Campaign')
RETURNING id, name, created_at;

INSERT INTO tasks (project_id, title)
VALUES (1, 'Draft wireframes')
RETURNING id, project_id, title, is_done;

INSERT INTO tasks (project_id, title)
VALUES
    (1, 'Design homepage mockup'),
    (1, 'Review color palette'),
    (2, 'Write App Store listing')
RETURNING id, project_id, title, is_done;

-- The next statement is intentionally invalid: project 99 does not exist.
-- Running it demonstrates the foreign-key violation covered in the lecture.
-- Comment it out (or expect it to fail) before running the rest of the file.
INSERT INTO tasks (project_id, title)
VALUES (99, 'Set up analytics tracking')
RETURNING id, project_id, title, is_done;

INSERT INTO tasks (project_id, title)
VALUES (3, 'Set up analytics tracking')
RETURNING id, project_id, title, is_done;

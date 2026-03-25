DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    is_done BOOLEAN DEFAULT FALSE,
    user_id INTEGER REFERENCES users(id)
);

INSERT INTO users (username, email) VALUES
    ('alice', 'alice@example.com'),
    ('bob', 'bob@example.com'),
    ('charlie', 'charlie@example.com');

INSERT INTO tasks (title, user_id) VALUES
    ('Купить молоко', 1),
    ('Сделать домашку', 1),
    ('Позвонить другу', 2);

-- Обычный JOIN
SELECT tasks.title, tasks.is_done, users.username
FROM tasks
JOIN users ON tasks.user_id = users.id;

-- LEFT JOIN
SELECT tasks.title, tasks.is_done, users.username
FROM tasks
LEFT JOIN users ON tasks.user_id = users.id;

-- Вот теперь увидишь разницу — идём от users
SELECT users.username, tasks.title
FROM users
LEFT JOIN tasks ON tasks.user_id = users.id;
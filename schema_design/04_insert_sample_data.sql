-- Task 1: Insert sample data into the students table
INSERT INTO "students" ("id", "name", "email")
VALUES 
    (1, 'Anastasiia', 'anastasiia@example.com'),
    (2, 'Maria', 'maria@example.com'),
    (3, 'Daniel', 'daniel@example.com'),
    (4, 'Sofia', 'sofia@example.com');

-- Task 2: Insert sample data into the languages table
INSERT INTO "languages" ("id", "name", "difficulty_level")
VALUES 
    (1, 'English', 'intermediate'),
    (2, 'German', 'advanced'),
    (3, 'Latin', 'beginner');

-- Task 3: Insert sample data in the lessons table
INSERT INTO "lessons" ("id", "language_id", "title", "topic")
VALUES 
    (1, 1, 'Present Simple', 'Grammar'),
    (2, 1, 'Travel Vocabulary', 'Vocabulary'),
    (3, 2, 'Perfekt', 'Grammar'),
    (4, 2, 'Job Interview Phrases', 'Speaking'),
    (5, 3, 'First Declension', 'Grammar'),
    (6, 3, 'Latin Greetings', 'Vocabulary');

-- Task 4: Insert sample data in the lesson_progress table
INSERT INTO "lesson_progress" ("student_id", "lesson_id", "is_completed")
VALUES 
    (1, 1, 1),
    (1, 2, 1),
    (1, 5, 0),
    (2, 3, 1),
    (2, 4, 0),
    (3, 1, 1),
    (3, 5, 1),
    (4, 2, 0);
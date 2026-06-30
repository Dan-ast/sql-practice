-- Task 1: Try to insert a student with a duplicate email
INSERT INTO "students" ("id", "name", "email")
VALUES (5, 'Anna', 'anastasiia@example.com');

-- Task 2: Try to insert a language with NULL name
INSERT INTO "languages" ("id", "name", "difficulty_level")
VALUES (4, NULL, 'beginner');

-- Task 3: Try to insert a language with an invalid difficulty level
INSERT INTO "languages" ("id", "name", "difficulty_level")
VALUES (4, 'Spanish', 'expert');

-- Task 4: Try to insert a lesson with a non-existing language_id
INSERT INTO "lessons" ("id", "language_id", "title", "topic")
VALUES (7, 99, 'Subjunctive Mood', 'Grammar'); 

-- Task 5: Try to insert progress for a non-existing student
INSERT INTO "lesson_progress" ("student_id", "lesson_id", "is_completed")
VALUES (99, 1, 1);

-- Task 6: Try to insert progress with an invalid is_completed value
INSERT INTO "lesson_progress" ("student_id", "lesson_id", "is_completed")
VALUES (1, 1, 2);
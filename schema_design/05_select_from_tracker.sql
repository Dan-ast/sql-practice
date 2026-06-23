-- Task 1: Show all students
SELECT "id", "name", "email"
FROM "students"
ORDER BY "id";

-- Task 2: Show all languages
SELECT "id", "name", "difficulty_level"
FROM "languages"
ORDER BY "id";

-- Task 3: Show all lessons with their language names
SELECT "lessons"."id", "lessons"."title", "lessons"."topic", "languages"."name"
FROM "lessons"
JOIN "languages" ON "languages"."id" = "lessons"."language_id"
ORDER BY "lessons"."id";

-- Task 4: Show student progress with lesson titles
SELECT "students"."name", "lessons"."title", "lesson_progress"."is_completed"
FROM "lesson_progress"
JOIN "students" ON "students"."id" = "lesson_progress"."student_id"
JOIN "lessons" ON "lessons"."id" = "lesson_progress"."lesson_id"
ORDER BY "students"."name", "lessons"."id";

-- Task 5: Show each student and number_of_lessons
SELECT "students"."name", COUNT("lesson_progress"."student_id") AS "number_of_lessons"
FROM "students"
LEFT JOIN "lesson_progress" ON "lesson_progress"."student_id" = "students"."id"
GROUP BY "students"."id"
ORDER BY "number_of_lessons" DESC, "students"."name";

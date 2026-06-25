-- Task 1: Show each student name and number_of_lessons
SELECT "students"."name" AS "student_name", COUNT("lesson_progress"."lesson_id") AS "number_of_lessons"
FROM "students"
LEFT JOIN "lesson_progress" ON "lesson_progress"."student_id" = "students"."id"
GROUP BY "students"."id"
ORDER BY "number_of_lessons" DESC, "students"."name";

-- Task 2: Show each student name and completed_lessons
SELECT "students"."name" AS "student_name", 
SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) AS "completed_lessons"
FROM "students"
LEFT JOIN "lesson_progress" ON "lesson_progress"."student_id" = "students"."id"
GROUP BY "students"."id"
ORDER BY "completed_lessons" DESC, "students"."name";

-- Task 3: Show each student, completed_lessons, and learning status
SELECT "students"."name" AS "student_name", 
SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) AS "completed_lessons",
CASE 
    WHEN SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) = 0 THEN 'not started'
    WHEN SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) = 1 THEN 'in progress'
    WHEN SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) >= 2 THEN 'active learner'
END AS "learning_status"
FROM "students"
LEFT JOIN "lesson_progress" ON "lesson_progress"."student_id" = "students"."id"
GROUP BY "students"."id"
ORDER BY "completed_lessons" DESC, "students"."name";

-- Task 4: Show each language and number_of_lessons
SELECT "languages"."name" AS "language_name", COUNT("lessons"."id") AS "number_of_lessons"
FROM "languages"
LEFT JOIN "lessons" ON "lessons"."language_id" = "languages"."id"
GROUP BY "languages"."id"
ORDER BY "number_of_lessons" DESC, "languages"."name";

-- Task 5: Show each language and completed_progress_records
SELECT "languages"."name" AS "language_name", 
SUM(CASE 
    WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END
    ) AS "completed_progress_records"
FROM "languages"
LEFT JOIN "lessons" ON "lessons"."language_id" = "languages"."id"
LEFT JOIN "lesson_progress" ON "lesson_progress"."lesson_id" = "lessons"."id"
GROUP BY "languages"."name"
ORDER BY "completed_progress_records" DESC, "languages"."name";

-- Task 6: Show each language and progress_activity
SELECT "languages"."name" AS "language_name", 
CASE 
    WHEN SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) = 0 THEN 'inactive'
    WHEN SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) = 1 THEN 'low activity'
    WHEN SUM(CASE WHEN "lesson_progress"."is_completed" = 1 THEN 1 ELSE 0 END) >= 2 THEN 'high activity'
END AS "progress_activity"
FROM "languages"
LEFT JOIN "lessons" ON "lessons"."language_id" = "languages"."id"
LEFT JOIN "lesson_progress" ON "lesson_progress"."lesson_id" = "lessons"."id"
GROUP BY "languages"."name"
ORDER BY  "languages"."name";
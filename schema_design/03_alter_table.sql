-- Task 1: Rename the progress table to lesson_progress
ALTER TABLE "progress"
RENAME TO "lesson_progress";

-- Task 2: Add the score column to lesson_progress
ALTER TABLE "lesson_progress"
ADD COLUMN "score" INTEGER;

-- Task 3: Rename the completed column to is_completed
ALTER TABLE "lesson_progress"
RENAME COLUMN "completed" TO "is_completed";

-- Task 4: Drop the score column from lesson_progress
ALTER TABLE "lesson_progress"
DROP COLUMN "score";
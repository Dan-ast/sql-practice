-- Task 1. Create the students table
CREATE TABLE students (
    "id" INTEGER,
    "name" TEXT,
    "email" TEXT
);

-- Task 2: Create the languages table
CREATE TABLE languages (
    "id" INTEGER,
    "name" TEXT,
    "difficulty_level" TEXT
);

-- Task 3: Create the lessons table
CREATE TABLE lessons (
    "id" INTEGER,
    "language_id" INTEGER,
    "title" TEXT, 
    "topic" TEXT
);

-- Task 4: Create the progress table
CREATE TABLE progress (
    "student_id" INTEGER,
    "lesson_id" INTEGER,
    "completed" INTEGER
);
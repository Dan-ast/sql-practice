-- Task 1. Create the students table with constraints
CREATE TABLE students (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

-- Task 2: Create the languages table with constraints
CREATE TABLE languages (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "difficulty_level" TEXT NOT NULL CHECK("difficulty_level" IN ('beginner', 'intermediate', 'advanced')),
    PRIMARY KEY("id")
);

-- Task 3: Create the lessons table with constraints
CREATE TABLE lessons (
    "id" INTEGER,
    "language_id" INTEGER,
    "title" TEXT NOT NULL, 
    "topic" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("language_id") REFERENCES "languages"("id")
);

-- Task 4: Create the progress table with constraints
CREATE TABLE progress (
    "student_id" INTEGER,
    "lesson_id" INTEGER,
    "completed" INTEGER NOT NULL DEFAULT 0 CHECK("completed" IN (0, 1)),
    FOREIGN KEY("student_id") REFERENCES "students"("id"),
    FOREIGN KEY("lesson_id") REFERENCES "lessons"("id")
);
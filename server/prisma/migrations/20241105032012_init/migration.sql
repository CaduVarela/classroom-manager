-- CreateTable
CREATE TABLE "classroom" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "student" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "_classroomStudents" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_classroomStudents_A_fkey" FOREIGN KEY ("A") REFERENCES "classroom" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_classroomStudents_B_fkey" FOREIGN KEY ("B") REFERENCES "student" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "student_email_key" ON "student"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_classroomStudents_AB_unique" ON "_classroomStudents"("A", "B");

-- CreateIndex
CREATE INDEX "_classroomStudents_B_index" ON "_classroomStudents"("B");

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
CREATE TABLE "_ClassroomToStudent" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ClassroomToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "classroom" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ClassroomToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "student" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_ClassroomToStudent_AB_unique" ON "_ClassroomToStudent"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassroomToStudent_B_index" ON "_ClassroomToStudent"("B");

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "registrationNumber" INTEGER NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "image" TEXT,
    "courseId" TEXT,
    "cityId" INTEGER,
    "finishedRegister" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    CONSTRAINT "User_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "User_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Car" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "passengers" INTEGER NOT NULL,
    "ownerId" TEXT NOT NULL,
    "licensePlate" TEXT NOT NULL,
    CONSTRAINT "Car_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "City" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Course" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Trip" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "driverId" TEXT NOT NULL,
    "secondaryDriverId" TEXT,
    "fromId" INTEGER NOT NULL,
    "toId" INTEGER NOT NULL,
    "maxPassengers" INTEGER NOT NULL,
    "price" REAL NOT NULL,
    "when" DATETIME NOT NULL,
    "notes" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" DATETIME,
    CONSTRAINT "Trip_driverId_fkey" FOREIGN KEY ("driverId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Trip_secondaryDriverId_fkey" FOREIGN KEY ("secondaryDriverId") REFERENCES "User" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Trip_fromId_fkey" FOREIGN KEY ("fromId") REFERENCES "City" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Trip_toId_fkey" FOREIGN KEY ("toId") REFERENCES "City" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Passenger" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "tripId" TEXT NOT NULL,
    CONSTRAINT "Passenger_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Passenger_tripId_fkey" FOREIGN KEY ("tripId") REFERENCES "Trip" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_registrationNumber_key" ON "User"("registrationNumber");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

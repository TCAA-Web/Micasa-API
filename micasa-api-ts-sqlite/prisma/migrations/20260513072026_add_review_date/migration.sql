/*
  Warnings:

  - Added the required column `date` to the `reviews` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_reviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "subject" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "num_stars" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    "estate_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "reviews_estate_id_fkey" FOREIGN KEY ("estate_id") REFERENCES "estates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "reviews_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_reviews" ("comment", "created_at", "estate_id", "id", "is_active", "num_stars", "subject", "updated_at", "user_id") SELECT "comment", "created_at", "estate_id", "id", "is_active", "num_stars", "subject", "updated_at", "user_id" FROM "reviews";
DROP TABLE "reviews";
ALTER TABLE "new_reviews" RENAME TO "reviews";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

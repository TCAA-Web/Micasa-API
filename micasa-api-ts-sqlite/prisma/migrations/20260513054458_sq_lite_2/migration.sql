/*
  Warnings:

  - Added the required column `staff_id` to the `estates` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_estates" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "address" TEXT NOT NULL,
    "price" REAL NOT NULL DEFAULT 0.00,
    "payout" REAL NOT NULL DEFAULT 0.00,
    "gross" REAL NOT NULL DEFAULT 0.00,
    "net" REAL NOT NULL DEFAULT 0.00,
    "cost" REAL NOT NULL DEFAULT 0.00,
    "num_rooms" INTEGER NOT NULL DEFAULT 0,
    "num_floors" INTEGER NOT NULL DEFAULT 0,
    "floor_space" INTEGER NOT NULL DEFAULT 0,
    "ground_space" INTEGER NOT NULL DEFAULT 0,
    "basement_space" INTEGER NOT NULL DEFAULT 0,
    "year_construction" INTEGER NOT NULL DEFAULT 0,
    "year_rebuilt" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT NOT NULL,
    "floorplan" TEXT NOT NULL,
    "num_clicks" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    "type_id" INTEGER NOT NULL,
    "energy_label_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "estates_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "estates_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "estate_types" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "estates_energy_label_id_fkey" FOREIGN KEY ("energy_label_id") REFERENCES "energy_labels" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "estates_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "staffs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_estates" ("address", "basement_space", "city_id", "cost", "created_at", "description", "energy_label_id", "floor_space", "floorplan", "gross", "ground_space", "id", "net", "num_clicks", "num_floors", "num_rooms", "payout", "price", "type_id", "updated_at", "year_construction", "year_rebuilt") SELECT "address", "basement_space", "city_id", "cost", "created_at", "description", "energy_label_id", "floor_space", "floorplan", "gross", "ground_space", "id", "net", "num_clicks", "num_floors", "num_rooms", "payout", "price", "type_id", "updated_at", "year_construction", "year_rebuilt" FROM "estates";
DROP TABLE "estates";
ALTER TABLE "new_estates" RENAME TO "estates";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

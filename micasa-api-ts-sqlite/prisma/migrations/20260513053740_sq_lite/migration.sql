-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "refresh_token" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "cities" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "zipcode" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "estate_types" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "energy_labels" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "estates" (
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
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "estates_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "estates_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "estate_types" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "estates_energy_label_id_fkey" FOREIGN KEY ("energy_label_id") REFERENCES "energy_labels" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "images" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "filename" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "estate_image_rel" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "estate_id" INTEGER NOT NULL,
    "image_id" INTEGER NOT NULL,
    "is_main" BOOLEAN NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "estate_image_rel_estate_id_fkey" FOREIGN KEY ("estate_id") REFERENCES "estates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "estate_image_rel_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "images" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "reviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "subject" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "num_stars" INTEGER NOT NULL,
    "estate_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "reviews_estate_id_fkey" FOREIGN KEY ("estate_id") REFERENCES "estates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "reviews_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "favorites" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "estate_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "favorites_estate_id_fkey" FOREIGN KEY ("estate_id") REFERENCES "estates" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "favorites_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "staffs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

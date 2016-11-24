BEGIN TRANSACTION;
CREATE TABLE `Фото` (
	`Код`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Ссылка`	TEXT NOT NULL,
	`Код_места`	INTEGER NOT NULL
);
INSERT INTO `Фото` VALUES (1,'',0);
CREATE TABLE `Место_в _городе` (
	`Код`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Наименование`	TEXT NOT NULL,
	`Код_места`	INTEGER NOT NULL,
	`Описание_места`	TEXT NOT NULL,
	`Координата_места`	INTEGER NOT NULL,
	`Код_категории`	INTEGER
);
CREATE TABLE "Места" (
	`Номер`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Название`	TEXT NOT NULL UNIQUE,
	`Описание`	TEXT NOT NULL,
	`Широта`	NUMERIC NOT NULL,
	`Долгота`	NUMERIC NOT NULL
);
INSERT INTO `Места` VALUES (1,'Адлер','Адлер — курорт на Чёрном море, отдаленный микрорайон города Сочи. Этот район расположен на равнине, при впадении в Чёрное море реки Мзымты, с севера защищен Главным Кавказским хребтом с его вечными льдами и не тающими даже летом, вершинами, что тем самым обуславливает здесь относительно высокие среднегодовые температуры воздуха.

Купальный сезон здесь продолжается 5 месяцев с июня по октябрь, летом средняя температура воздуха +26,5С, воды +24,5С. Благоприятные сезоны для санаторно-курортного лечения: осень, зима, весна. В период «зимы», средняя температура воздуха составляет +9, +10С.',43.4343234,39.9339462);
INSERT INTO `Места` VALUES (2,'Абзаково','мрмирмии',45,55);
INSERT INTO `Места` VALUES (3,'','','','');
CREATE TABLE `Категория` (
	`Номер`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Название`	TEXT NOT NULL,
	`Код_фото`	INTEGER NOT NULL
);
COMMIT;

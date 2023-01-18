CREATE DATABASE VUZDATABASE
GO

USE VUZDATABASE
GO

CREATE TABLE Свойства
(	
		Свойство_ID int PRIMARY KEY,
		Свойство nvarchar(50)
);

CREATE TABLE ВУЗ_Свойства 
(
		Свойство_ID int PRIMARY KEY REFERENCES Свойства(Свойство_ID),
		Описание nvarchar(100) 
);

CREATE TABLE Подразделения 
(
		Подразделение_ID int PRIMARY KEY,
		Подразделение nvarchar(50)
);

CREATE TABLE Подразделение_Свойства 
(
		Подразделение_ID int,
		Свойство_ID int,
		Описание nvarchar(100),
		PRIMARY KEY (Подразделение_ID, Свойство_ID), 
		FOREIGN KEY(Подразделение_ID) REFERENCES Подразделения(Подразделение_ID),
		FOREIGN KEY(Свойство_ID) REFERENCES Свойства(Свойство_Id)
);

CREATE TABLE Сотрудники 
(
		Сотрудник_ID int PRIMARY KEY,
		Имя nvarchar(100)
);


CREATE TABLE Свойства_сотрудников 
(
		Свойство_ID int PRIMARY KEY,
		Свойство nvarchar(50)
);

CREATE TABLE Сотрудники_Свойства
(
		Сотрудник_ID int,
		Свойство_ID int,
		Описание nvarchar(100),
		PRIMARY KEY(Сотрудник_ID, Свойство_ID),
		FOREIGN KEY(Сотрудник_ID) REFERENCES Сотрудники(Сотрудник_ID),
		FOREIGN KEY(Свойство_ID) REFERENCES Свойства_сотрудников(Свойство_ID)
);

CREATE TABLE Должности
(
		Должность_ID int primary key,
		Должность nvarchar(50),
		Ответственность int
);

CREATE TABLE Сотрудник_Должность
(
		Сотрудник_ID int,
		Должность_ID int,
		PRIMARY KEY(Сотрудник_ID, Должность_ID),
		FOREIGN KEY(Сотрудник_ID) REFERENCES Сотрудники(Сотрудник_ID),
		FOREIGN KEY(Должность_ID) REFERENCES Должности(Должность_ID),
		
);

CREATE TABLE Ответственные_Должности
(
		Должность_ID int,
		Подразделение_ID int,
		Свойство_ID int,
		Описание nvarchar(100)
		PRIMARY KEY(Должность_ID, Подразделение_ID,Свойство_ID),
		FOREIGN KEY(Должность_ID) REFERENCES Должности(Должность_ID),
		FOREIGN KEY(Подразделение_ID) REFERENCES Подразделения(Подразделение_ID),
		FOREIGN KEY(Свойство_ID) REFERENCES Свойства_сотрудников(Свойство_ID),
);

CREATE TABLE Предметы
(
		Предмет_ID int PRIMARY KEY,
		Подразделение_ID int,
		Название nvarchar(50),
		Колво_лекций int,
		Колво_семинаров int
);

CREATE TABLE Предмет_Преподаватель
(
		Предмет_ID int ,
		Сотрудник_ID int,
		PRIMARY KEY(Предмет_ID, Сотрудник_ID),
		FOREIGN KEY(Предмет_ID) REFERENCES Предметы(Предмет_ID),
		FOREIGN KEY(Сотрудник_ID) REFERENCES Сотрудники(Сотрудник_ID),
);

CREATE TABLE Студенты
(
		Студент_ID int primary key,
		ФИО nvarchar(50),
		Группа_ID int,
		Год_поступления int
);

CREATE TABLE Статусы
(
		Статус_ID int primary key,
		Статус nvarchar(50)
);

CREATE TABLE Статус_Студента
(
		Студент_ID int PRIMARY KEY,
		Статус_ID int,
		FOREIGN KEY(Студент_ID) REFERENCES Студенты(Студент_ID),
		FOREIGN KEY(Статус_ID) REFERENCES Статусы(Статус_ID)
);

CREATE TABLE Факультеты
(
		Факультет_ID int PRIMARY KEY,
		Факультет nvarchar(50)
);

CREATE TABLE Группы
(
		Группа_ID int PRIMARY KEY,
		Факультет_ID int REFERENCES Факультеты(Факультет_ID)
);

CREATE TABLE История_обучения
(
		Студент_ID int,
		Семестр int,
		Год_обучения nvarchar(50),
		Группа_ID int,
		PRIMARY KEY(Студент_ID, Семестр, Год_обучения),
		FOREIGN KEY(Студент_ID) REFERENCES Студенты(Студент_ID),
		FOREIGN KEY(Группа_ID) REFERENCES Группы(Группа_ID)
);


CREATE TABLE Расписание
(
		Предмет_ID int,
		Группа_ID int,
		Семестр int,
		Год_обучения nvarchar(50),
		Сотрудник_ID int,
		PRIMARY KEY(Предмет_ID, Группа_ID),
		FOREIGN KEY(Предмет_ID) REFERENCES Предметы(Предмет_ID),
		FOREIGN KEY(Группа_ID) REFERENCES Группы(Группа_ID),
		FOREIGN KEY(Сотрудник_ID) REFERENCES Сотрудники(Сотрудник_ID)
);


CREATE TABLE Учебный_план
(
		Факультет_ID int,
		Предмет_ID int,
		Форма_оценивания nvarchar(50),
		Cеместр int,
		PRIMARY KEY(Факультет_ID, Предмет_ID),
		FOREIGN KEY(Факультет_ID) REFERENCES Факультеты(Факультет_ID),
		FOREIGN KEY(Предмет_ID) REFERENCES Предметы(Предмет_ID)
);


CREATE TABLE Ведомости
(
		Ведомость_ID int PRIMARY KEY,
		Дата_сдачи date,
		Cеместр int,
		Преподаватель_ID int,
		Предмет_ID int,
		FOREIGN KEY(Преподаватель_ID) REFERENCES Сотрудники(Сотрудник_ID),
		FOREIGN KEY(Предмет_ID) REFERENCES Предметы(Предмет_ID)
);

CREATE TABLE Оценки
(
		Ведомость_ID int,
		Студент_ID int,
		Оценка nvarchar(50),
		PRIMARY KEY(Ведомость_ID, Студент_ID),
		FOREIGN KEY(Ведомость_ID) REFERENCES Ведомости(Ведомость_ID),
		FOREIGN KEY(Студент_ID) REFERENCES Студенты(Студент_ID)
);

CREATE TABLE Успеваемость
(
		Студент_ID int,
		Прошедший_Семестр int,
		Предмет_ID int,
		Форма_Оценивания nvarchar(50),
		Оценка nvarchar(50),
		Колво_попыток_сдачи int,
		Дата_последней_сдачи date,
		Ведомость_ID int,
		PRIMARY KEY(Студент_ID, Прошедший_Семестр, Предмет_ID),
		FOREIGN KEY(Ведомость_ID) REFERENCES Ведомости(Ведомость_ID),
		FOREIGN KEY(Студент_ID) REFERENCES Студенты(Студент_ID),
		FOREIGN KEY(Предмет_ID) REFERENCES Предметы(Предмет_ID)
);








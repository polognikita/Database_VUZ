CREATE DATABASE VUZDATABASE
GO

USE VUZDATABASE
GO

CREATE TABLE Свойства
(	
		Свойство_ID int primary key,
		Свойство nvarchar(50)
);

CREATE TABLE ВУЗ_Свойства 
(
		Свойство_ID int primary key REFERENCES Свойства(Свойство_ID),
		Описание nvarchar(100) 
);

CREATE TABLE Подразделения 
(
		Подразделение_ID int primary key,
		Подразделение nvarchar(50)
);

CREATE TABLE Подразделение_Свойства 
(
		Подразделение_ID int,
		Свойство_ID int,
		Описание nvarchar(100),
		primary key (Подразделение_ID, Свойство_ID), 
		FOREIGN KEY(Подразделение_ID) REFERENCES Подразделения(Подразделение_ID),
		FOREIGN KEY(Свойство_ID) REFERENCES Свойства(Свойство_Id)
);

CREATE TABLE Сотрудники 
(
		Сотрудник_ID int primary key,
		Имя nvarchar(100)
);


CREATE TABLE Свойства_сотрудников 
(
		Свойство_ID int primary key,
		Свойство nvarchar(50)
);

CREATE TABLE Сотрудники_Свойства
(
		Сотрудник_ID int,
		Свойство_ID int,
		Описание nvarchar(100),
		primary key(Сотрудник_ID, Свойство_ID),
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
		primary key(Сотрудник_ID, Должность_ID)
);

CREATE TABLE Ответственные_Должности
(
		Должность_ID int,
		Подразделение_ID int,
		Свойство_ID int,
		Описание nvarchar(100)
		primary key(Должность_ID, Подразделение_ID, Свойство_ID),
		FOREIGN KEY(Должность_ID) REFERENCES Должности(Должность_ID),
		FOREIGN KEY(Подразделение_ID) REFERENCES Подразделения(Подразделение_ID),
		FOREIGN KEY(Свойство_ID) REFERENCES Свойства_сотрудников(Свойство_ID),
);

CREATE TABLE Предметы
(
		Предмет_ID int primary key,
		Подразделение_ID int,
		Название nvarchar(50),
		Колво_лекций int,
		Колво_семинаров int
);

CREATE TABLE Преподаватель_Предмет
(
		Предмет_ID int ,
		Сотрудник_ID int,
		primary key(Предмет_ID, Сотрудник_ID)
);



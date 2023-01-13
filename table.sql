CREATE DATABASE VUZDATABASE
GO

USE VUZDATABASE
GO

CREATE TABLE ��������
(	
		��������_ID int primary key,
		�������� nvarchar(50)
);

CREATE TABLE ���_�������� 
(
		��������_ID int primary key REFERENCES ��������(��������_ID),
		�������� nvarchar(100) 
);

CREATE TABLE ������������� 
(
		�������������_ID int primary key,
		������������� nvarchar(50)
);

CREATE TABLE �������������_�������� 
(
		�������������_ID int,
		��������_ID int,
		�������� nvarchar(100),
		primary key (�������������_ID, ��������_ID), 
		FOREIGN KEY(�������������_ID) REFERENCES �������������(�������������_ID),
		FOREIGN KEY(��������_ID) REFERENCES ��������(��������_Id)
);

CREATE TABLE ���������� 
(
		���������_ID int primary key,
		��� nvarchar(100)
);


CREATE TABLE ��������_����������� 
(
		��������_ID int primary key,
		�������� nvarchar(50)
);

CREATE TABLE ����������_��������
(
		���������_ID int,
		��������_ID int,
		�������� nvarchar(100),
		primary key(���������_ID, ��������_ID),
		FOREIGN KEY(���������_ID) REFERENCES ����������(���������_ID),
		FOREIGN KEY(��������_ID) REFERENCES ��������_�����������(��������_ID)
);

CREATE TABLE ���������
(
		���������_ID int primary key,
		��������� nvarchar(50),
		��������������� int
);

CREATE TABLE ���������_���������
(
		���������_ID int,
		���������_ID int,
		primary key(���������_ID, ���������_ID)
);

CREATE TABLE �������������_���������
(
		���������_ID int,
		�������������_ID int,
		��������_ID int,
		�������� nvarchar(100)
		primary key(���������_ID, �������������_ID, ��������_ID),
		FOREIGN KEY(���������_ID) REFERENCES ���������(���������_ID),
		FOREIGN KEY(�������������_ID) REFERENCES �������������(�������������_ID),
		FOREIGN KEY(��������_ID) REFERENCES ��������_�����������(��������_ID),
);

CREATE TABLE ��������
(
		�������_ID int primary key,
		�������������_ID int,
		�������� nvarchar(50),
		�����_������ int,
		�����_��������� int
);

CREATE TABLE �������������_�������
(
		�������_ID int ,
		���������_ID int,
		primary key(�������_ID, ���������_ID)
);



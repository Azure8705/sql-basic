USE master
GO
IF EXISTS (SELECT * FROM sys.databases 
	WHERE name = 'AzureSQL')
	DROP DATABASE AzureSQL
GO

CREATE DATABASE AzureSQL
GO

USE AzureSQL
GO

CREATE TABLE users (
	ID INT NOT NULL IDENTITY(1,1),
	DateAdded DATETIME DEFAULT(getdate()) NOT NULL,
	email VARCHAR(45) NULL,
	website VARCHAR(140) NULL
	PRIMARY KEY (ID)
);

CREATE TABLE skills (
	ID INT NOT NULL IDENTITY(1,1),
	skillName VARCHAR(140),
	skillCategory INT NOT NULL,
	skillStrength VARCHAR(140) NOT NULL,
	PRIMARY KEY (ID);
);

CREATE TABLE skillCategories (
	ID INT NOT NULL IDENTITY(1,1),
	skillCategoriesName VARCHAR(140) NOT NULL,
	skillStrengthLevel DECIMAL(3,2) CONSTRAINT chk_skillStrLvl check (skillStrengthLevel between 0 and 1),
);

ALTER TABLE skills WITH CHECK
	ADD CONSTRAINT [FK_Prod_Man] FOREIGN KEY (skillCategory)
	REFERENCES skillCategories(skillCategoriesName);
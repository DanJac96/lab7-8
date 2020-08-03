create database Lab7_8;
go
use Lab7_8;
go

create table Pais(
id_Pais int identity(1,1) primary key not null,
Nombre_Pais varchar(50) not null
);
go
create table Idioma(
id_Idioma int identity(1,1) primary key not null,
Descripcion_Idioma varchar(50) not null
);
go
create table GestionPrestamo(
id_GestionPrestamo int identity(1,1) primary key not null,
id_Pais int not null,
CONSTRAINT FK_GestionPrestamo_idPais FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais),
Habitantes int not null,
id_Idioma int not null,
CONSTRAINT FK_GestionPrestamo_idIdioma FOREIGN KEY (id_Idioma) REFERENCES Idioma(id_Idioma),
PIB int not null,
Superficie int not null,
RiesgoSeguridad Varchar(10) not null,
Prestamo bit not null
);
go

INSERT INTO [dbo].[Idioma]
           ([Descripcion_Idioma])
     VALUES
           ('Español');
GO

INSERT INTO [dbo].[Idioma]
           ([Descripcion_Idioma])
     VALUES
           ('Ingles');
GO

INSERT INTO [dbo].[Idioma]
           ([Descripcion_Idioma])
     VALUES
           ('Aleman');
GO


INSERT INTO [dbo].[Pais]
           ([Nombre_Pais])
     VALUES
           ('Costa Rica');
GO

INSERT INTO [dbo].[Pais]
           ([Nombre_Pais])
     VALUES
           ('Korea');
GO

INSERT INTO [dbo].[Pais]
           ([Nombre_Pais])
     VALUES
           ('USA');
GO


select *
from Idioma;
select *
from Pais;
select *
from GestionPrestamo;

USE [Lab7_8]
GO

INSERT INTO [dbo].[GestionPrestamo]
           ([id_Pais]
           ,[Habitantes]
           ,[id_Idioma]
           ,[PIB]
           ,[Superficie]
           ,[RiesgoSeguridad]
           ,[Prestamo])
     VALUES
           (1
           ,1
           ,1
           ,1
           ,1
           ,'alto'
           ,1)
GO

SELECT [id_GestionPrestamo]
      ,[Nombre_Pais]
      ,[Habitantes]
      ,[Descripcion_Idioma]
      ,[PIB]
      ,[Superficie]
      ,[RiesgoSeguridad]
      ,[Prestamo]
FROM [dbo].[GestionPrestamo] GP
join Pais on Pais.id_Pais = GP.id_Pais
join Idioma on Idioma.id_Idioma = GP.id_Idioma; 
go
-- T�m a��klamalar mevcut
-- Tablo Ad� = " Country ", Parametreler = Id, CountryName,Code

-- Tablo Ad� = " City", Parametreler = Id, CityName, CountryId,Code

-- Tablo Ad� = " District", Parametreler = Id, DistrictName, CountryId, CityId,Code

-- Tablo Ad� = " Town", Parametreler = Id, TownName, CountryId, CityId, DistrictId,Code
 
--Procedure �devi

--NOT : Yeni bir veri taban� kod ile olu�turulacak :)

--1) Yukar�daki tablolar Code ile olu�turulacak ve kod ile �li�kilendirilecektir.


create database CountriesInformation
use CountriesInformation
CREATE TABLE  Country
(
	Id int  Primary key not null Identity(1,1),
	CountryName nvarchar(40) not null,
	Code nvarchar(20) 
)
CREATE TABLE  City
(
	Id int  Primary key not null Identity(1,1),
	CityName nvarchar(40) not null,
	Code nvarchar(20) ,
	CountryId int foreign key  (Id) references Country(Id) not null
)
CREATE TABLE  District
(
	Id int  Primary key not null Identity(1,1),
	DistrictName nvarchar(40) not null,
	Code nvarchar(20) ,
	CountryId int foreign key  (Id) references Country(Id) not null,
	CityId int foreign key  (Id) references City(Id) not null
)
CREATE TABLE Town
(
	Id int  Primary key not null Identity(1,1),
	TownName nvarchar(40) not null,
	Code nvarchar(20) ,
	CountryId int foreign key  (Id) references Country(Id) not null,
	CityId int foreign key  (Id) references City(Id) not null,
	DistrictId int foreign key  (Id) references District(Id) not null
)
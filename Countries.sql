-- Tüm açýklamalar mevcut
-- Tablo Adý = " Country ", Parametreler = Id, CountryName,Code

-- Tablo Adý = " City", Parametreler = Id, CityName, CountryId,Code

-- Tablo Adý = " District", Parametreler = Id, DistrictName, CountryId, CityId,Code

-- Tablo Adý = " Town", Parametreler = Id, TownName, CountryId, CityId, DistrictId,Code
 
--Procedure Ödevi

--NOT : Yeni bir veri tabaný kod ile oluþturulacak :)

--1) Yukarýdaki tablolar Code ile oluþturulacak ve kod ile ýliþkilendirilecektir.


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
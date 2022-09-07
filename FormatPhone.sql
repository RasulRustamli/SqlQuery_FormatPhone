-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER format_phone
   ON  Shippers
   AFTER  INSERT
AS 
BEGIN
Update Shippers
SET Phone= 
dbo.Fn_formatPhones(s.Phone)
FROM 
inserted s
END

	insert into Shippers values('Yeni Kayýt5','905432134901')

	select * from Shippers



CREATE FUNCTION Fn_formatPhones (@phone varchar(25))
RETURNS varchar(25)
AS
BEGIN
DECLARE @forphone varchar(25)
SET @forphone=
CASE
		WHEN LEN(@phone)=13
					THEN '+90 ('+ SUBSTRING(@phone,4,3)+ ') ' +SUBSTRING(@phone,7,3) +' ' +SUBSTRING(@phone,10,2) 
					+ ' ' +SUBSTRING(@phone,12,2)
		WHEN LEN(@phone)=12
				THEN '+90 ('+ SUBSTRING(@phone,3,3)+ ') ' +SUBSTRING(@phone,6,3) +' ' +SUBSTRING(@phone,9,2) 
					+ ' ' +SUBSTRING(@phone,11,2)
		WHEN LEN(@phone)=11
				THEN '+90 ('+ SUBSTRING(@phone,2,3)+ ') ' +SUBSTRING(@phone,5,3) +' ' +SUBSTRING(@phone,8,2) 
					+ ' ' +SUBSTRING(@phone,10,2)
		WHEN LEN(@phone)=10
				THEN '+90 ('+ SUBSTRING(@phone,1,3)+ ') ' +SUBSTRING(@phone,4,3) +' ' +SUBSTRING(@phone,7,2) 
					+ ' ' +SUBSTRING(@phone,9,2)

					ELSE
					'Wrong format'
END
RETURN @forphone
END


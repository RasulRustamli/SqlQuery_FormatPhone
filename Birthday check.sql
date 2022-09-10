Create function CheckAge(@Age int,@thisDate date)
Returns nvarchar(Max)
as
	begin
		Declare	@thisYear int=(Select YEAR(@thisDate) as Year)
		Declare @thisMonth int=(Select MONTH(@thisDate) as MONTH)
		Declare @thisDay int=(Select Day(@thisDate) as Day)
		Declare	@NowDate date=GetDate()
		Declare	@NowYear int=(Select YEAR(@NowDate) as Year)
		Declare	@NowMonth int=(Select MONTH(@NowDate) as MONTH)
		Declare	@NowDay int=(Select YEAR(@NowDate) as Year)
		Declare @ResultYear int =@NowYear-@thisYear																														--09-08-2022<-->01-08-2022
		If @Age<@ResultYear
			return  Cast(@Age as nvarchar)+'ad gunu kecib'  
			Else If @Age=@ResultYear
				Begin
					If @NowMonth>@thisMonth
					return  Cast(@Age as nvarchar)+'ad gunu bitib'  
					Else If @NowMonth=@thisMonth
						Begin
							If @NowDay>@thisDay
							return  Cast(@Age as nvarchar)+'ad gunu kecib'  
							Else
							Begin
								return Cast((@thisDay-@NowDay) as nvarchar) +' gun qalib adgunuve'
							End
						end
				Else
					Begin
						If @NowDay<@thisDay
							return  'bu gun ' +Cast(@Age as nvarchar)+'  yasin artiq olub '+Cast((@thisMonth-@NowMonth) as nvarchar) +' ay '+Cast((@thisDay-@NowDay) as nvarchar) +' gun qabaq'
						Else If @NowDay=@thisDay
						Begin
							return  'senin ad gunun' +Cast((@thisMonth-@NowMonth) as nvarchar) + +Cast(@Age as nvarchar)+'qabaq olub '''
							end
							
		else
				begin
				return 'child'
				end
				return @thisAge
		end

select dbo.CheckAge(22,'01-03-2025')

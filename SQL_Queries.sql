-- Select
Select * from Movies -- all movies

select MovieName as 'Film Adi',Description as 'Aciklama' from Movies --Only MovieNames and Descriptions

select FirstName+' '+LastName as 'FullName',UserName from Users

--Where

--Movies longer than 105 minutes
select * from Movies where Duration >105

--Movies between 2010 and 2016
-- Option I
select * from Movies where Year > 2010 and Year<2016 --(2010 and 2016 not included)
-- Option II
select * from Movies Where Year between 2010 and 2016 --(2010 and 2016 included)

--Null
select * from Movies where Rating is null

--Not Null
select * from Movies where Rating is not null

--Movies with a rating of 73 or 81 
select * from Movies where Rating =73 or Rating = 81
select * from Movies Where Rating in (73,81)

--Order
select MovieName,Duration from Movies order by Duration asc -- ascending sort
select MovieName,Duration from Movies order by 2 asc --descending sort

--Like

select * from Movies where MovieName like 'A%' --Movies that start with 'A'
select * from Movies where MovieName like '%ad' --Movies that end with 'AD'
select * from Movies where MovieName like '__i%' --movies with 3rd letter 'i'
select * from Movies where Description like '%British%' --Movies that are british in the description
select * from Movies where MovieName Like '%[^r]' --Movies that don't end with r
select * from Movies where MovieName Like  '%[SP]%' --You can find words with S or P in them.

--String Functions
select ASCII('E') -- ASCII CODE E=>101
select CHAR(101) -- letter (101 => e)
select CHARINDEX('@', 'enesserenli@hotmail.com') -- Location
select LEFT('Enes Serenli ', 4) --number of characters from the left
select Right('Enes Serenli', 4) --number of characters from the right
select Len('Enes Serenli') --number of character
select lower('ENES SERENLI') -- shrinks all characters
select upper('enes serenli') -- enlarges all characters
select LTRIM('              enes serenli') -- deletes spaces on the left
select RTRIM('enes serenli            ') -- deletes spaces on the right
select LTRIM( RTRIM('     enes             '    )) -- deletes spaces on the everywhere
select REPLACE('Enes&&Serenli','&','-') -- Replaces texts with new ones [(&) will replace it with (-) when it sees]
select SUBSTRING('enes serenli',2,8) -- Subtitle
select REPLICATE('Hellööö',5) --Repeats the specified text as many times as the value in the 2nd parameter

--Aggregate Functions

--Count
select count(*) as 'Film sayýsý' from Movies

--Sum
select sum(Duration) as 'Toplam Film Süresi' from Movies

--Max
select max(Rating) as [En yüksek Rating] from Movies

--Min
select min(Rating) as 'En düþük Rating' from Movies

--Avg
select avg(Duration) as 'Ortalama film süresi' from Movies

year() --function giving the year
getdate() -- func giving current date
year(getdate()) --Returns the year of the current date

--Group By
select DirectorId as 'Yönetmen ID',
count(MovieName) as 'Film Sayýsý' 
from Movies
group by DirectorId

--SubQuery
select MovieName,
(select FullName from Directors d where d.Id=m.DirectorId) as 'Director Name' --parentheses is a subquery
from Movies m

select * from Comments c where UserId = (select Id from Users where FirstName = 'Enes') --parentheses is a subquery

--Having
select DirectorId,count(*) as 'Film Sayýsý'
from Movies 
group by DirectorId
having count(*) >= 3 order by 2 asc

--Join => inner Join

Select u.FirstName+' '+u.LastName as 'FullName',
u.UserName,
c.Body,m.MovieName
from Users u 
inner join Comments c on c.UserId=u.UserID 
join Movies m on m.MovieID=c.MovieId

--Outer join
use Northwind

--Left outer Join
select calisan.FirstName as 'Çalýþan',mudur.FirstName as 'Müdür' from Employees calisan left outer join Employees mudur on calisan.ReportsTo=mudur.EmployeeID

--Right outer Join
select calisan.FirstName as 'Çalýþan',mudur.FirstName as 'Müdür' from Employees calisan right outer join Employees mudur on calisan.ReportsTo=mudur.EmployeeID

--cross join
select calisan.FirstName as 'Çalýþan',mudur.FirstName as 'Müdür' from Employees calisan cross join Employees mudur
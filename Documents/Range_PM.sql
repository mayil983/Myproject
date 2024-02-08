USE [PlayerManagement]
Go

DELETE FROM [dbo].[Range]

GO

Insert Into  [dbo].[Range]
SELECT 'AbsUser',1,'A',30000,49999,30001,1,1,1,1 UNION ALL
SELECT 'Division',1,'A',20000,29999,20001,1,1,1,1 UNION ALL
SELECT 'Player',1,'A',10000,9999999,10001,1,1,1,1 UNION ALL --Player
SELECT 'PlayerSegmentation',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
SELECT 'Station',1,'A',20000,29000,20001,1,1,1,1 UNION ALL -- Station
SELECT 'UserDept',1,'A',20000,29999,20001,1,1,1,1 UNION ALL -- UserDept
SELECT 'UserJob',1,'A',20000,29999,20001,1,1,1,1  -- UserJob

select * from [dbo].[Range]

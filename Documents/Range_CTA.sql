USE [CTA]
GO

DELETE FROM [dbo].[Range]


Insert Into [dbo].[Range]
select 'AbsUser',1,'A',50000,59999,50001,1,1,1,1 UNION ALL -- AbsUser
select 'AbsUserIK',1,'A',10000,29999,10001,1,1,1,1 UNION ALL
select 'Cage Credit',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Cage CreditB',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Cage Fill',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Division',1,'A',30000,39999,30001,1,1,1,1 UNION ALL
select 'Front Money Deposit',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Front Money Withdrawal',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'MailStatus',1,'A',30000,39999,30001,1,1,1,1 UNION ALL
select 'Marker Issue',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Marker Redemption',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Player',1,'A',10000000,19999999,10000001,1,1,1,1 UNION ALL -- Player
select 'Proc TESTED',1,'A',10000,19999,10001,1,1,1,1UNION ALL
select 'Safekeeping Deposit',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Safekeeping Withdrawal',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Station',1,'A',30000,39999,30001 ,1,1,1,1 UNION ALL -- Sttaion
select 'StationType',1,'A',10000,19999,10001,1,1,1,1  UNION ALL
select 'Table Credit',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Table Fill',1,'A',10000,19999,10001,1,1,1,1 UNION ALL
select 'Table Jackpot',1,'A',10000,19999,10001,1,1,1,1  UNION ALL
select 'UserDept',1,'A',30000,39999,30001,1,1,1,1 UNION ALL -- UserDept
select 'UserJob',1,'A',30000,39999,30001,1,1,1,1 -- UserJob

select * from [dbo].[Range]

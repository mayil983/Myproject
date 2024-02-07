-- use cta
-- use ezpay
-- use Common
    DECLARE
        @szDatabaseName    VARCHAR(32),
        @szLoginName    VARCHAR(32),
        @nCounter        INT,
        @nTotalLogins    INT,
        @@szLanguageName varchar(32) = 'us_english'    

    SELECT 
        @nCounter = 1,
        @nTotalLogins = 19,
        @szDatabaseName = [name]
    FROM master.dbo.sysprocesses AS p
    JOIN master.dbo.sysdatabases AS d ON (p.dbid = d.dbid)
    WHERE spid = @@spid
    
    DECLARE @rolename_passvalue            varchar(10)
    SET @rolename_passvalue = 'Programs'

    IF NOT EXISTS (SELECT TOP 1 1 FROM sysusers WHERE [name] = @rolename_passvalue)
    BEGIN
        EXECUTE sp_addrole @rolename = @rolename_passvalue
    END

    WHILE @nCounter <= @nTotalLogins
    BEGIN
        /*
            the following IS a list OF logins TO parse through
            TO ADD MORE, up the variable @nTotalLogins by one FOR each login added
            THEN ADD TO the CASE statement below above the ELSE statement
            the NUMBER TO loginname IS irrelevent
        */
        SELECT @szLoginName = 
                    CASE @nCounter 
                    WHEN 1 THEN 'AbsPlayerManagement'
                    WHEN 2 THEN 'AbsBif'
                    WHEN 3 THEN 'AbsCrystal'
                    WHEN 4 THEN 'AbsGuardian'
                    WHEN 5 THEN 'AbsWizard'
                    WHEN 6 THEN 'AbsAttStat'
                    WHEN 7 THEN 'AbsTrans'
                    WHEN 8 THEN 'AbsBimbo'
                    WHEN 9 THEN 'AbsHardDrop'
                    WHEN 10 THEN 'AbsMonitor'
                    WHEN 11 THEN 'AbsPaging'
                    WHEN 12 THEN 'AbsSql'
                    WHEN 13 THEN 'AbsBingo'
                    WHEN 14 THEN 'AbsTransPT'
                    WHEN 15 THEN 'AbsProphet'
                    WHEN 16 THEN 'XDI'
                    WHEN 17 THEN 'CTAService'
                    WHEN 18 THEN 'ArcService'
                    ELSE 'Merlin'
                    END
                    
        SELECT @nCounter = @nCounter + 1

        EXEC ('USE ' + @szDatabaseName)

        -- drop previous
        IF EXISTS (SELECT TOP 1 1 FROM sysusers WHERE [name] = @szLoginName)
        BEGIN
            EXECUTE sp_droprolemember 'db_owner', @szLoginName
            EXECUTE sp_droprolemember @rolename_passvalue, @szLoginName
            if exists (select TOP 1 1 FROM sysusers WHERE [name] = @szLoginName)
                EXEC sp_revokedbaccess @szLoginName
        END

/*
        if exists (select TOP 1 1 FROM MASTER.DBO.syslogins WHERE [name] = @szLoginName)
            EXECUTE sp_droplogin @szLoginName
*/

        -- create new
        IF NOT EXISTS (SELECT TOP 1 1 FROM master.dbo.syslogins WHERE [name] = @szLoginName)
        BEGIN
--            IF (CHARINDEX('Microsoft SQL Server 2016',@@VERSION) <> 0 ) OR (CHARINDEX('Microsoft SQL Server 2012',@@VERSION) <> 0 )  OR (CHARINDEX('Microsoft SQL Server 2014',@@VERSION) <> 0 )
            IF CAST(LEFT(CAST(SERVERPROPERTY('ProductVersion') as varchar), 2) as int) >= 11
            BEGIN
                EXECUTE sp_addlogin @szLoginName,
                    0x0200EF489581CE48540AAE556BCCE68E12D99499D1CBD72844357A997E0A2C96FF7E924025E2D3F9CF338D18FDF326692976D15BF2003618A551CC2567E979CD1B993408D726,
                    @defdb = 'Master',
                    @deflanguage = @@szLanguageName,
                    @encryptopt = 'skip_encryption'
            END
            ELSE
            BEGIN
                EXECUTE sp_addlogin @szLoginName,
                    0x213123312954382d562f32503c524c22,
                    @defdb = 'Master',
                    @deflanguage = @@szLanguageName,
                    @encryptopt = 'skip_encryption'
            END
        END

        EXEC sp_grantdbaccess @szLoginName, @szLoginName
        EXEC sp_addrolemember 'db_owner', @szLoginName
        EXEC sp_addrolemember @rolename_passvalue, @szLoginName
        
        IF @szLoginName in ('AbsPlayerManagement', 'AbsGuardian', 'AbsWizard')
            EXEC master..sp_addsrvrolemember @loginame = @szLoginName, @rolename = N'sysadmin' 


        if exists (select TOP 1 1 FROM master.dbo.syslogins WHERE loginname=@szLoginName)
            PRINT '<<< CREATED LOGIN '+@szLoginName+'    >>>'
        ELSE
            PRINT '<<< FAILED CREATING LOGIN '+@szLoginName+'    >>>'

        IF USER_ID(@szLoginName) IS NOT NULL
            PRINT '<<< CREATED USER '+@szLoginName+' >>>'
        ELSE
            PRINT '<<< FAILED CREATING USER '+@szLoginName+'    >>>'
    END
GO

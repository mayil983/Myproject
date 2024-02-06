Declare 
@Accounting BIT, @ADI_MA BIT, @PlayerManagement BIT, @ADI_PM BIT, @Common BIT, @ADI_CTA  BIT, @CTA BIT, @EZPay BIT, @TableManager BIT,
 @DropUtility BIT, @EZPayMetaRS BIT,@IGT_DBMaintenance BIT, @S2STransport BIT, @SBDB BIT, @PlayerTracking BIT, @CreateShells BIT, @SETBROKER BIT, @Resize BIT,
 @path nvarchar(max), @FG1 nvarchar(max), @EGM INT, @DBNAME char(100), @LNAME char(100), @MDF int, @LDF int, @AUTOGM varchar(100), @SBDBTM BIT,
 @AUTOGL varchar(100), @AUTOGMR varchar(100), @AUTOGLR varchar(100), @sbroker char(100), @trust char(100), @recoverym char(100), @DBLNAME char(100),
 @Cpucount Int, @Temppath nvarchar(max), @Temp_Log_Path nvarchar(max), @ReportServer BIT, @ReportServerTempDB BIT, @EventSentry BIT, @RAS BIT, 
 @DistributedCache BIT, @RNGLogDatabase BIT, @VDM BIT, @TempDB BIT, @TournamentManager BIT, @filecount Int, @logical_name Sysname, 
 @Physical_name nvarchar(520), @TempFilename nvarchar(250), @file_name nvarchar(520),@logical_num int


IF OBJECT_ID ('tempdb..#IGTDATABASES') is not null DROP TABLE #IGTDATABASES

CREATE TABLE #IGTDATABASES (
dbname varchar(100) NOT NULL, recoverym varchar(100), mdf int, ldf int, autogm varchar(100), autogl varchar(100), autogmr varchar(100), autoglr varchar(100), sbroker varchar(100), trust varchar(100), filegroup varchar(100), install BIT)

set @path = 'S:\Program Files\Microsoft SQL Server\MSSQL13.IVS\MSSQL\DATA\EZPay_Data.ndf' 
set @Temppath = 'S:\Program Files\Microsoft SQL Server\MSSQL13.IVS\MSSQL\DATA\'
set @Temp_Log_Path = 'L:\Program Files\Microsoft SQL Server\Logs\'

/*SET EGM COUNT */
SELECT @EGM = 500

SELECT @SETBROKER =         1
SELECT @Resize =            1

SELECT @Accounting =        1
SELECT @ADI_MA =            1
SELECT @DropUtility =       1
SELECT @S2STransport =      1

SELECT @EZPay =             0
SELECT @EZPayMetaRS =       0

SELECT @PlayerManagement =  1
SELECT @ADI_PM =            1
SELECT @Common =            1

SELECT @PlayerTracking =    1
SELECT @ADI_CTA  =          0
SELECT @CTA =               0
SELECT @TableManager =      0
SELECT @SBDB =              1

--SET THIS IF SBDB IS ONLY FOR TM
SELECT @SBDBTM =            0

/*****************************************************
ReportServer DB config Update
Modified by :: Bharat Patel
*****************************************************/
SELECT @ReportServer =          0
SELECT @ReportServerTempDB =    0

SELECT @EventSentry =           0
SELECT @RAS =                   0

SELECT @DistributedCache =      0

SELECT @RNGLogDatabase =        0
SELECT @VDM =                   0

SELECT @TempDB =                0


SELECT @TournamentManager =     0

SELECT @IGT_DBMaintenance =     0




/***********************************************
END OF OPTIONS
***********************************************/

INSERT INTO #IGTDATABASES (dbname, recoverym ,mdf, ldf, autogm, autogl, autogmr, autoglr, sbroker, trust, filegroup) VALUES

(    'Accounting',    'Simple',    '512',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'ADI_CTA',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'ADI_MA',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'ADI_PM',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'Common',    'Simple',    '512',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'CTA',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'DistributedCache',    'Simple',    '512',    '256',    '200',    'UNLIMITED',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'DropUtility',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'EventSentry',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'EZPay',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'FG1_Data'    ),
(    'EZPayMetaRS',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'IB',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'IRC',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'PlayerManagement',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'PlayerTracking',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'RAS',    'Simple',    '512',    '256',    '200',    '100',    '100',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'ReportServer',    'Simple',    '256',    '128',    '10',    '5',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'ReportServerTempDB',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'RNGLogDatabase',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'S2STransport',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Disabled',    'Disabled',    'Primary'    ),
(    'SBDB',    'Simple',    '2560',    '5120',    '256',    '256',    '1024',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'TableManager',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'TempDB',    'Simple',    '512',    '512',    '0',    '0',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'TournamentManager',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'IGT_DBMaintenance',    'Simple',    '1024',    '512',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    ),
(    'VDM',    'Simple',    '512',    '256',    '200',    '100',    'UNLIMITED',    'UNLIMITED',    'Enabled',    'Enabled',    'Primary'    )

IF @SBDBTM = 1
    update #IGTDATABASES
    set mdf = '10240', ldf = '5120'
    where dbname = 'SBDB'

update #IGTDATABASES
set mdf = mdf*round(((@EGM+499)/500),0)
update #IGTDATABASES
set ldf = ldf*round(((@EGM+499)/500),0)
--select * from #IGTDATABASES
update #IGTDATABASES
set ldf = autoglr where ldf > autoglr and autoglr != 'UNLIMITED'
update #IGTDATABASES
set mdf = autogmr where mdf > autogmr and autogmr != 'UNLIMITED'

IF @Accounting = 1 update #IGTDATABASES
    set install = 1 where dbname = 'Accounting'
IF @ADI_MA = 1 update #IGTDATABASES
    set install = 1 where dbname = 'ADI_MA'
IF @DropUtility = 1 update #IGTDATABASES
    set install = 1 where dbname = 'DropUtility'
IF @S2STransport = 1 update #IGTDATABASES
    set install = 1 where dbname = 'S2STransport'
IF @EZPay = 1 update #IGTDATABASES
    set install = 1 where dbname = 'EZPay'
IF @EZPayMetaRS = 1 update #IGTDATABASES
    set install = 1 where dbname = 'EZPayMetaRS'
IF @PlayerManagement = 1 update #IGTDATABASES
    set install = 1 where dbname = 'PlayerManagement'
IF @ADI_PM = 1 update #IGTDATABASES
    set install = 1 where dbname = 'ADI_PM'
IF @Common = 1 update #IGTDATABASES
    set install = 1 where dbname = 'Common'
IF @PlayerTracking = 1 update #IGTDATABASES
    set install = 1 where dbname = 'PlayerTracking'
IF @ADI_CTA = 1 update #IGTDATABASES
    set install = 1 where dbname = 'ADI_CTA'
IF @CTA = 1 update #IGTDATABASES
    set install = 1 where dbname = 'CTA'
IF @TableManager = 1 update #IGTDATABASES
    set install = 1 where dbname = 'TableManager'
IF @SBDB = 1 update #IGTDATABASES
    set install = 1 where dbname = 'SBDB'
IF @ReportServer = 1 update #IGTDATABASES
    set install = 1 where dbname = 'ReportServer'
IF @ReportserverTempDB = 1 update #IGTDATABASES
    set install = 1 where dbname = 'ReportserverTempDB'    
IF @EventSentry = 1 update #IGTDATABASES
   set install = 1 where dbname = 'EventSentry'    
IF @RAS = 1 update #IGTDATABASES
   set install = 1 where dbname = 'RAS'    
IF @DistributedCache = 1 update #IGTDATABASES
   set install = 1 where dbname = 'DistributedCache'    
IF @RNGLogDatabase = 1 update #IGTDATABASES
   set install = 1 where dbname = 'RNGLogDatabase'
IF @VDM = 1 update #IGTDATABASES
   set install = 1 where dbname = 'VDM'
IF @TempDB = 1 update #IGTDATABASES
   set install = 1 where dbname = 'TempDB'
IF @VDM = 1 update #IGTDATABASES
   set install = 1 where dbname = 'VDM'
IF @TournamentManager = 1 update #IGTDATABASES
   set install = 1 where dbname = 'TournamentManager'
IF @IGT_DBMaintenance = 1 update #IGTDATABASES
   set install = 1 where dbname = 'IGT_DBMaintenance'

   
--SELECT TOP 100 * FROM #IGTDATABASES where install = 1
WHILE EXISTS (SELECT TOP 1 * FROM #IGTDATABASES where install = 1)
    BEGIN
        select top 1 @DBNAME = dbname, @MDF = mdf, @LDF = ldf, @AUTOGM = autogm, @AUTOGMR = autogmr, @AUTOGL = autogl, @AUTOGLR = autoglr, 
        @sbroker = sbroker, @trust = trust, @recoverym = recoverym from #IGTDATABASES where install = 1
        

            begin
            if  not exists(select * from sys.databases where name = @DBNAME)
            exec ('CREATE DATABASE '+ @DBNAME)
            end
        
        select @lname = f.name from sys.master_files f
        join sys.databases d on d.database_id = f.database_id
        where d.name = @dbname and f.[type] = 1
        
        select top 1 @dblname = f.name from sys.master_files f
        join sys.databases d on d.database_id = f.database_id
        where d.name = @dbname and f.[type] = 0
        order by data_space_id asc
            
            BEGIN
                IF @Resize = 1 and @DBLNAME != 'tempdev' AND @DBLNAME != 'tempdev1'
                BEGIN
                if not exists (select top 1 1 where ((select size from sys.master_files where name = @DBLNAME)/128)>=@MDF)
                
                EXEC ('ALTER DATABASE '+@DBNAME+
                'MODIFY FILE
                    (NAME = '+@DBLNAME+',
                    SIZE = '+@MDF+'MB);')
                else select 'DB is already set or larger than minimum for...... '+@DBNAME
                END
            
                
                IF @DBNAME = 'EZPAY'
                    begin
                    if not exists (select * from .ezpay.sys.filegroups where name like '%FG1%')
                        ALTER DATABASE EZPay ADD FILEGROUP FG1_Data
                    if not exists (select size from sys.master_files where name like '%EZPay%' and file_id > 2)
                            EXEC('Alter Database Ezpay
                                ADD FILE 
                                (NAME = EZPay_Data,
                                Filename = ' + '''' + @path + '''' +')
                                TO FILEGROUP [FG1_Data]')
                    if not exists (select * from .ezpay.sys.filegroups where name like '%FG1%' and is_default = 1)
                        ALTER DATABASE EZPay MODIFY FILEGROUP FG1_Data DEFAULT
                    end
                if (@DBLNAME != 'tempdev' AND @DBLNAME != 'tempdev1') 
                EXEC ('ALTER DATABASE ' + @DBNAME+  
                'MODIFY FILE
                    (NAME = '+@DBLNAME+',
                    FILEGROWTH = '+@AUTOGM+',
                    MAXSIZE = '+@AUTOGMR+')');
               
                /***********Added Logic for TempDB file Setting **** Bharat Patel ***************/
                if @DBNAME = 'TempDB'
                Begin
                    /*****TempDB file setting**/
                    
                    IF OBJECT_ID('tempdb..#TEMPDBFiles') IS NOT NULL Drop Table #TEMPDBFiles
                        Create Table #TEMPDBFiles (TempFileName VARCHAR(200), Physicalname VARCHAR(250));
                        Insert into #TEMPDBFiles 
                        Select name, physical_name from tempdb.sys.database_files where type_desc = 'ROWS' --and size != '262144' OR growth <> 0
                        DECLARE C1 CURSOR 
                        for select TempFileName, physicalname from #TEMPDBFiles
                        OPEN C1;
                        FETCH NEXT FROM C1 into @TempFileName, @Physical_name;
                        While (@@FETCH_STATUS = 0)
                        Begin
                            set @file_name =  REVERSE(RTRIM(REVERSE(RIGHT(@Physical_name,charindex('\',REVERSE(@Physical_name))-1))))
                            set @physical_name = REVERSE(SUBSTring(REVERSE(@physical_name),LEN(RIGHT(@Physical_name,charindex('\',REVERSE(@Physical_name))-1))+1,LEN(@physical_name)))
                            If ((@Physical_name != @temppath) OR (SUBSTRING(@Physical_name,1,3) != SUBSTRING(@Temppath,1,3)))
                            Begin
                                  Exec('Alter Database TempDB
                                Modify File(Name = N'''+ @TempFilename +''',
                                filename =N''' + @Temppath + @file_name +''')')    
                            
                                EXEC ('ALTER DATABASE TempDB 
                                    MODIFY FILE
                                    (NAME =  N'''+ @TempFilename +''',
                                    SIZE = '+@MDF+'MB,
                                    FILEGROWTH = '+@AUTOGM+',
                                    MAXSIZE = '+@AUTOGMR+')')
                          End
                                        
                        FETCH NEXT FROM C1 into @TempFileName, @Physical_name;
                        End
                        Close C1;
                        Deallocate C1;
                    
                        
                        /*****TempLog file setting**/
                        select @Physical_name = physical_name from TempDB.sys.database_files  Where name = 'templog'
                        set @Physical_name = RTRIM(Replace(@Physical_name,'templog.ldf',''))
                        If ((@Physical_name != @Temp_Log_Path) OR (SUBSTRING(@Physical_name,1,3) != SUBSTRING(@Temp_Log_Path,1,3)))
                        Begin
                                                      
                            Exec('Alter Database TempDB
                            Modify File(Name = templog,
                            filename =N''' + @Temp_Log_Path + 'templog.ldf'')')
                            
                        End
                            
                        /************* Adding 1 TempDB/CPU File********************/
                        Select @filecount = COUNT(*) from tempdb.sys.database_files where type_desc = 'ROWS'
                        Select @logical_name = (Select  MAX(name) from tempdb.sys.database_files where type_desc = 'ROWS' and len(name) = (select max(len(name)) from tempdb.sys.database_files where type_desc = 'ROWS'))
                        Select @logical_num =  RTRIM((RIGHT(@Logical_name,LEN(@Logical_name)-7)) + 1)
                        Select @Cpucount= cpu_count from sys.dm_os_sys_info
                        While @filecount < @Cpucount
                        Begin
                            
                            Select @file_name = Replace(@temppath+@DBname+CAST(@logical_num AS Varchar) +'.mdf',' ','')
                            Exec ('Alter Database TempDB
                            Add File(Name =N'''+ 'tempdev' +  @logical_num +''',
                            filename =N'''+@file_name+''',
                            SIZE = '+@MDF+'MB)')
                            
                            Exec('ALTER DATABASE  TempDB
                            Modify FILE(NAME =N'''+'tempdev' + @logical_num+''',
                            FILEGROWTH = '+@AUTOGM+',
                            MAXSIZE = '+@AUTOGMR+')')
                        
                            set @filecount = @filecount + 1;
                            set @logical_num = @logical_num + 1;
                                                    
                        End
                        
                        /***** Checking of existing TempDB File size/Growth size*************/
                        
                        IF OBJECT_ID('tempdb..#TDBfiles') IS NOT NULL Drop Table #TDBfiles
                        Declare @Msg VARCHAR(Max) 
                        SET @Msg = 'ALL'
                        Create Table #TDBfiles (TempFileName NVARCHAR(100));
                        Insert into #TDBfiles 
                        Select name from tempdb.sys.database_files where type_desc = 'ROWS' and size != '262144' OR growth <> 0
                        DECLARE C2 CURSOR 
                        for select TempFileName from #TDBfiles
                        OPEN C2;
                        FETCH NEXT FROM C2 into @logical_name;
                        While (@@FETCH_STATUS = 0)
                        Begin
                            Exec ('Alter Database ' + @DBNAME+ 
                            'ModiFY File (Name =N'''+ @logical_name+''',
                            SIZE = '+@MDF+'MB)')
                        
                            EXEC ('ALTER DATABASE ' + @DBNAME+  
                            'MODIFY FILE
                            (NAME =N''' + @logical_name+''',
                            FILEGROWTH = '+@AUTOGM+',
                            MAXSIZE = '+@AUTOGMR+')')
                            
                            FETCH NEXT FROM C2 into @logical_name
                        End        
                         Close C2;
                         Deallocate C2;                        
                    End
                            
                --END    

                IF @Resize = 1
                BEGIN
                if not exists (select top 1 1 where ((select size from sys.master_files where name = @LNAME)/128)>=@LDF)
                
                EXEC ('ALTER DATABASE '+@DBNAME+ 
                'MODIFY FILE
                    (NAME = '+@LNAME+',
                    SIZE = '+@LDF+'MB)');
                else select 'Log is already set or larger than the minimum for '+@DBNAME
                END
                
                exec ('ALTER DATABASE '+@dbname+ 
                'MODIFY FILE
                    (NAME = '+@lname+',
                    FILEGROWTH = '+@autogl+'MB,
                    MAXSIZE = '+@autoglr+' )');
                
                IF @DBNAME = 'EZPAY' and @Resize = 1
                    BEGIN
                        if not exists (select top 1 1 where ((select size from sys.master_files where name like '%EZPay%' and file_id > 2)/128)>=@MDF)   and @Resize = 1
                        EXEC ('ALTER DATABASE EZPay 
                        MODIFY FILE
                            (NAME = EZPay_Data,
                            SIZE = '+@MDF+'MB);')
                        else select 'EZPay FG1 is already set or larger than the minimum'  
                    END
                IF @DBNAME = 'EZPAY'
                    BEGIN
                        EXEC ('ALTER DATABASE EZPay 
                        MODIFY FILE
                            (NAME = EZPay_Data,
                            FILEGROWTH = '+@autogm+',
                            MAXSIZE = '+@autogmr+')')
                    END                    
                if (@DBNAME !='TempDB')
                EXEC ('['+@DBNAME+'].dbo.sp_changedbowner @loginame = N''sa'', @map = false')
                IF (@trust = 'ENABLED' AND @DBNAME != 'Tempdb')
                    begin
                    --print'inside trustworthy'
                    EXEC ('ALTER DATABASE '+@DBNAME+' SET TRUSTWORTHY ON')
                    END
                
                If (@DBNAME != 'tempdb')
                 Begin
                 --print'inside recovery'
                 EXEC ('ALTER DATABASE '+@DBNAME+' SET RECOVERY ' + @recoverym)
                 End
                 
                IF (@SETBROKER = 1 and @sbroker = 'Enabled' AND @DBNAME != 'Tempdb' OR @DBNAME != 'S2STransport')
                    BEGIN
                        --print'inside set broker'
                        exec ('ALTER DATABASE '+@DBNAME+' SET ENABLE_BROKER with Rollback immediate')
                    END
               END
        
        update #IGTDATABASES set install = 0 where @DBNAME = dbname
        
    END

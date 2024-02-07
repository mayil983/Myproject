USE [TableManager]
GO

/****** Object: Index [IDX_EstWinLoss_InventoryID] Script Date: 9/5/2021 ******/
CREATE NONCLUSTERED INDEX [IDX_EstWinLoss_InventoryID] ON [TMS].[EstWinLoss]
(
    [InventoryID] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO
 
/****** Object: Index [IDX_Headcount_LocationId_GameDate_HeadcountTimeStatTimeTotalDropWinOpenStatusOpenRatingsHeadcountTotal] Script Date: 9/5/2021 ******/
CREATE NONCLUSTERED INDEX [IDX_Headcount_LocationId_GameDate_HeadcountTimeStatTimeTotalDropWinOpenStatusOpenRatingsHeadcountTotal] ON [TMS].[Headcount]
(
    [LocationId] ASC,
    [GameDate]
)
INCLUDE 
(
    [HeadcountTime],
    [StatTime],
    [TotalDrop],
    [Win],
    [OpenStatus],
    [OpenRatings], 
    [HeadcountTotal]
)
 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO
 
 
/****** Object: Index [IDX_Marker_DocumentID] Script Date: 9/5/2021 ******/
CREATE NONCLUSTERED INDEX [IDX_Marker_DocumentID] ON [TMS].[Marker]
(
    [DocumentID] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO
 
 
/****** Object: Index [IDX_Marker_TransferID] Script Date: 9/5/2021 ******/
CREATE NONCLUSTERED INDEX [IDX_Marker_TransferID] ON [TMS].[Marker]
(
    [TransferId] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO
 
 /****** Object: Index [IDX_RatingShapshot_RatingWagerID_RatingSnapshotID] Script Date: 9/5/2021 ******/
CREATE NONCLUSTERED INDEX [IDX_RatingShapshot_RatingWagerID_RatingSnapshotID] ON [TMS].[RatingSnapshot]
(
[RatingWagerId] ASC
)
INCLUDE 
(
[RatingSnapShotId]
) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90)
GO

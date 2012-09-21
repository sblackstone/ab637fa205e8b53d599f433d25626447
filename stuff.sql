drop view if exists `WinSummary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cdb`.`WinSummary` AS 


select `cdb`.`WinCache`.`PID` AS `PID`,
       sum(((`cdb`.`WinCache`.`IsItem` = 1) and (`cdb`.`WinCache`.`EndDateTime` > `yesterday`()))) AS `DailyItemCount`,
       sum(((`cdb`.`WinCache`.`IsBidpack` = 1) and (`cdb`.`WinCache`.`EndDateTime` > `yesterday`()))) AS `DailyBidpackCount`,
       sum(((`cdb`.`WinCache`.`IsItem` = 0) and (`cdb`.`WinCache`.`IsBidpack` = 0) and (`cdb`.`WinCache`.`EndDateTime` > `yesterday`()))) AS `DailyExpertCount`,
       sum(((`cdb`.`WinCache`.`IsItem` = 1) or (`cdb`.`WinCache`.`IsBidpack` = 1))) AS `PeriodWinCount`,
       sum(`cdb`.`WinCache`.`Bids`) AS `PeriodBidWinCount`,
       min(if((`cdb`.`WinCache`.`IsBidpack` = 1),`cdb`.`WinCache`.`EndDateTime`,NULL)) AS `earliestBidWinDate`,
       min(if(((`cdb`.`WinCache`.`IsItem` + `cdb`.`WinCache`.`IsBidpack`) > 0),
       `cdb`.`WinCache`.`EndDateTime`,NULL)) AS `earliestWinDate`,
       min(if(((`cdb`.`WinCache`.`IsBidpack` = 1) and (`cdb`.`WinCache`.`EndDateTime` > `yesterday`())),`cdb`.`WinCache`.`EndDateTime`,NULL)) AS `earliestDailyBidpackWinDate`,
       min(if((((`cdb`.`WinCache`.`IsItem` + `cdb`.`WinCache`.`IsBidpack`) = 0) and (`cdb`.`WinCache`.`EndDateTime` > `yesterday`())),
      `cdb`.`WinCache`.`EndDateTime`,NULL)) AS `earliestDailyExpertWinDate`,
      min(if((((`cdb`.`WinCache`.`IsItem` + `cdb`.`WinCache`.`IsBidpack`) > 0) and (`cdb`.`WinCache`.`EndDateTime` > `yesterday`())),
     `cdb`.`WinCache`.`EndDateTime`,NULL)) AS `earliestDailyItemWinDate` 

from `cdb`.`WinCache` where (`cdb`.`WinCache`.`EndDateTime` > `onePeriodAgo`() and `cdb`.`WinCache`.`quickfire` = 0) group by `cdb`.`WinCache`.`PID`;


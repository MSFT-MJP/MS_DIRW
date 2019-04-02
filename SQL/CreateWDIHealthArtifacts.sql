-- clean up
DROP VIEW IF EXISTS [RPT].[Health];
DROP TABLE IF EXISTS [WDI].[Health_Indicators];
DROP TABLE IF EXISTS [WDI].[Health_Countries];
DROP SCHEMA IF EXISTS [WDI];
DROP SCHEMA IF EXISTS [RPT];
DROP USER IF EXISTS [WDIHealthReports];
GO

-- create schema
CREATE SCHEMA [WDI]
AUTHORIZATION [dbo];
GO

CREATE SCHEMA [RPT]
AUTHORIZATION [dbo];
GO

-- create tables for WDI data
CREATE TABLE [WDI].[Health_Countries](
	[CountryCode] CHAR(3) NOT NULL
		CONSTRAINT [PK_WDI_Health_Countries] PRIMARY KEY CLUSTERED,
	[ShortName] NVARCHAR(50) NOT NULL
		CONSTRAINT [UQ_WDI_Health_ShortName] UNIQUE,
	[LongName] NVARCHAR(75) NOT NULL
		CONSTRAINT [UQ_WDI_Health_LongName] UNIQUE,
	[Region] NVARCHAR(30) NOT NULL,
	[IncomeGroup] NVARCHAR(20) NOT NULL
);
GO
CREATE NONCLUSTERED INDEX [IX_WDI_Health_Countries_Region] ON [WDI].[Health_Countries]([Region]);
CREATE NONCLUSTERED INDEX [IX_WDI_Health_Countries_IncomeGroup] ON [WDI].[Health_Countries]([IncomeGroup]);
GO

CREATE TABLE [WDI].[Health_Indicators](
	[CountryCode] CHAR(3) NOT NULL
		CONSTRAINT [FK_WDI_Health_Indicators_Countries] FOREIGN KEY REFERENCES [WDI].[Health_Countries]([CountryCode]),
	[Year] INT NOT NULL, 
	[SH.XPD.PVTD.PP.CD] FLOAT NULL, 
	[SH.XPD.PVTD.PC.CD] FLOAT NULL, 
	[SH.XPD.PVTD.CH.ZS] FLOAT NULL, 
	[SH.XPD.OOPC.PP.CD] FLOAT NULL, 
	[SH.XPD.OOPC.PC.CD] FLOAT NULL, 
	[SH.XPD.OOPC.CH.ZS] FLOAT NULL, 
	[SH.XPD.GHED.PP.CD] FLOAT NULL, 
	[SH.XPD.GHED.PC.CD] FLOAT NULL, 
	[SH.XPD.GHED.GE.ZS] FLOAT NULL, 
	[SH.XPD.GHED.GD.ZS] FLOAT NULL, 
	[SH.XPD.GHED.CH.ZS] FLOAT NULL, 
	[SH.XPD.EHEX.PP.CD] FLOAT NULL, 
	[SH.XPD.EHEX.PC.CD] FLOAT NULL, 
	[SH.XPD.EHEX.CH.ZS] FLOAT NULL, 
	[SH.XPD.CHEX.PP.CD] FLOAT NULL, 
	[SH.XPD.CHEX.PC.CD] FLOAT NULL, 
	[SH.XPD.CHEX.GD.ZS] FLOAT NULL, 
	[SH.VAC.TTNS.ZS] FLOAT NULL, 
	[SH.UHC.SRVS.CV.XD] FLOAT NULL, 
	[SH.UHC.OOPC.25.ZS] FLOAT NULL, 
	[SH.UHC.OOPC.25.TO] FLOAT NULL, 
	[SH.UHC.OOPC.10.ZS] FLOAT NULL, 
	[SH.UHC.OOPC.10.TO] FLOAT NULL, 
	[SH.UHC.NOP2.ZS] FLOAT NULL, 
	[SH.UHC.NOP2.ZG] FLOAT NULL, 
	[SH.UHC.NOP2.TO] FLOAT NULL, 
	[SH.UHC.NOP2.CG] FLOAT NULL, 
	[SH.UHC.NOP1.ZS] FLOAT NULL, 
	[SH.UHC.NOP1.ZG] FLOAT NULL, 
	[SH.UHC.NOP1.TO] FLOAT NULL, 
	[SH.UHC.NOP1.CG] FLOAT NULL, 
	[SH.TBS.INCD] FLOAT NULL, 
	[SH.TBS.DTEC.ZS] FLOAT NULL, 
	[SH.TBS.CURE.ZS] FLOAT NULL, 
	[SH.SVR.WAST.ZS] FLOAT NULL, 
	[SH.SVR.WAST.MA.ZS] FLOAT NULL, 
	[SH.SVR.WAST.FE.ZS] FLOAT NULL, 
	[SH.STA.WAST.ZS] FLOAT NULL, 
	[SH.STA.WAST.MA.ZS] FLOAT NULL, 
	[SH.STA.WAST.FE.ZS] FLOAT NULL, 
	[SH.STA.TRAF.P5] FLOAT NULL, 
	[SH.STA.SUIC.P5] FLOAT NULL, 
	[SH.STA.STNT.ZS] FLOAT NULL, 
	[SH.STA.STNT.MA.ZS] FLOAT NULL, 
	[SH.STA.STNT.FE.ZS] FLOAT NULL, 
	[SH.STA.SMSS.ZS] FLOAT NULL, 
	[SH.STA.SMSS.UR.ZS] FLOAT NULL, 
	[SH.STA.SMSS.RU.ZS] FLOAT NULL, 
	[SH.STA.OWGH.ZS] FLOAT NULL, 
	[SH.STA.OWGH.MA.ZS] FLOAT NULL, 
	[SH.STA.OWGH.FE.ZS] FLOAT NULL, 
	[SH.STA.ORTH] FLOAT NULL, 
	[SH.STA.ORCF.ZS] FLOAT NULL, 
	[SH.STA.ODFC.ZS] FLOAT NULL, 
	[SH.STA.ODFC.UR.ZS] FLOAT NULL, 
	[SH.STA.ODFC.RU.ZS] FLOAT NULL, 
	[SH.STA.MMRT.NE] FLOAT NULL, 
	[SH.STA.MMRT] FLOAT NULL, 
	[SH.STA.MALN.ZS] FLOAT NULL, 
	[SH.STA.MALN.MA.ZS] FLOAT NULL, 
	[SH.STA.MALN.FE.ZS] FLOAT NULL, 
	[SH.STA.HYGN.ZS] FLOAT NULL, 
	[SH.STA.HYGN.UR.ZS] FLOAT NULL, 
	[SH.STA.HYGN.RU.ZS] FLOAT NULL, 
	[SH.STA.FGMS.ZS] FLOAT NULL, 
	[SH.STA.DIAB.ZS] FLOAT NULL, 
	[SH.STA.BRTW.ZS] FLOAT NULL, 
	[SH.STA.BRTC.ZS] FLOAT NULL, 
	[SH.STA.BFED.ZS] FLOAT NULL, 
	[SH.STA.BASS.ZS] FLOAT NULL, 
	[SH.STA.BASS.UR.ZS] FLOAT NULL, 
	[SH.STA.BASS.RU.ZS] FLOAT NULL, 
	[SH.STA.ARIC.ZS] FLOAT NULL, 
	[SH.STA.ANVC.ZS] FLOAT NULL, 
	[SH.SGR.PROC.P5] FLOAT NULL, 
	[SH.SGR.IRSK.ZS] FLOAT NULL, 
	[SH.SGR.CRSK.ZS] FLOAT NULL, 
	[SH.PRV.SMOK.MA] FLOAT NULL, 
	[SH.PRV.SMOK.FE] FLOAT NULL, 
	[SH.PRG.ANEM] FLOAT NULL, 
	[SH.MMR.RISK.ZS] FLOAT NULL, 
	[SH.MMR.RISK] FLOAT NULL, 
	[SH.MMR.DTHS] FLOAT NULL, 
	[SH.MLR.TRET.ZS] FLOAT NULL, 
	[SH.MLR.NETS.ZS] FLOAT NULL, 
	[SH.MLR.INCD.P3] FLOAT NULL, 
	[SH.MED.SAOP.P5] FLOAT NULL, 
	[SH.MED.PHYS.ZS] FLOAT NULL, 
	[SH.MED.NUMW.P3] FLOAT NULL, 
	[SH.MED.CMHW.P3] FLOAT NULL, 
	[SH.MED.BEDS.ZS] FLOAT NULL, 
	[SH.IMM.MEAS] FLOAT NULL, 
	[SH.IMM.IDPT] FLOAT NULL, 
	[SH.IMM.HEPB] FLOAT NULL, 
	[SH.HIV.PMTC.ZS] FLOAT NULL, 
	[SH.HIV.INCD.ZS] FLOAT NULL, 
	[SH.HIV.INCD.TL] FLOAT NULL, 
	[SH.HIV.INCD.14] FLOAT NULL, 
	[SH.HIV.INCD] FLOAT NULL, 
	[SH.HIV.ARTC.ZS] FLOAT NULL, 
	[SH.HIV.1524.MA.ZS] FLOAT NULL, 
	[SH.HIV.1524.FE.ZS] FLOAT NULL, 
	[SH.HIV.0014] FLOAT NULL, 
	[SH.H2O.SMDW.ZS] FLOAT NULL, 
	[SH.H2O.SMDW.UR.ZS] FLOAT NULL, 
	[SH.H2O.SMDW.RU.ZS] FLOAT NULL, 
	[SH.H2O.BASW.ZS] FLOAT NULL, 
	[SH.H2O.BASW.UR.ZS] FLOAT NULL, 
	[SH.H2O.BASW.RU.ZS] FLOAT NULL, 
	[SH.FPL.SATM.ZS] FLOAT NULL, 
	[SH.DYN.NMRT] FLOAT NULL, 
	[SH.DYN.NCOM.ZS] FLOAT NULL, 
	[SH.DYN.MORT.MA] FLOAT NULL, 
	[SH.DYN.MORT.FE] FLOAT NULL, 
	[SH.DYN.MORT] FLOAT NULL, 
	[SH.DYN.AIDS.ZS] FLOAT NULL, 
	[SH.DYN.AIDS.FE.ZS] FLOAT NULL, 
	[SH.DYN.0514] FLOAT NULL, 
	[SH.DTH.NMRT] FLOAT NULL, 
	[SH.DTH.NCOM.ZS] FLOAT NULL, 
	[SH.DTH.MORT] FLOAT NULL, 
	[SH.DTH.INJR.ZS] FLOAT NULL, 
	[SH.DTH.IMRT] FLOAT NULL, 
	[SH.DTH.COMM.ZS] FLOAT NULL, 
	[SH.DTH.0514] FLOAT NULL, 
	[SH.CON.1524.MA.ZS] FLOAT NULL, 
	[SH.CON.1524.FE.ZS] FLOAT NULL, 
	[SH.ANM.NPRG.ZS] FLOAT NULL, 
	[SH.ANM.CHLD.ZS] FLOAT NULL, 
	[SH.ANM.ALLW.ZS] FLOAT NULL, 
	[SH.ALC.PCAP.LI] FLOAT NULL, 
	[SN.ITK.VITA.ZS] FLOAT NULL, 
	[SN.ITK.SALT.ZS] FLOAT NULL, 
	[SN.ITK.DFCT] FLOAT NULL, 
	[SN.ITK.DEFC.ZS] FLOAT NULL,
	[SP.UWT.TFRT] FLOAT NULL, 
	[SP.REG.DTHS.ZS] FLOAT NULL, 
	[SP.REG.BRTH.ZS] FLOAT NULL, 
	[SP.REG.BRTH.UR.ZS] FLOAT NULL, 
	[SP.REG.BRTH.RU.ZS] FLOAT NULL, 
	[SP.REG.BRTH.MA.ZS] FLOAT NULL, 
	[SP.REG.BRTH.FE.ZS] FLOAT NULL, 
	[SP.POP.TOTL.MA.ZS] FLOAT NULL, 
	[SP.POP.TOTL.MA.IN] FLOAT NULL, 
	[SP.POP.TOTL.FE.ZS] FLOAT NULL, 
	[SP.POP.TOTL.FE.IN] FLOAT NULL, 
	[SP.POP.TOTL] FLOAT NULL, 
	[SP.POP.GROW] FLOAT NULL, 
	[SP.POP.DPND.YG] FLOAT NULL, 
	[SP.POP.DPND.OL] FLOAT NULL, 
	[SP.POP.DPND] FLOAT NULL, 
	[SP.POP.BRTH.MF] FLOAT NULL, 
	[SP.POP.80UP.MA.5Y] FLOAT NULL, 
	[SP.POP.80UP.FE.5Y] FLOAT NULL, 
	[SP.POP.7579.MA.5Y] FLOAT NULL, 
	[SP.POP.7579.FE.5Y] FLOAT NULL, 
	[SP.POP.7074.MA.5Y] FLOAT NULL, 
	[SP.POP.7074.FE.5Y] FLOAT NULL, 
	[SP.POP.65UP.TO.ZS] FLOAT NULL, 
	[SP.POP.65UP.TO] FLOAT NULL, 
	[SP.POP.65UP.MA.ZS] FLOAT NULL, 
	[SP.POP.65UP.MA.IN] FLOAT NULL, 
	[SP.POP.65UP.FE.ZS] FLOAT NULL, 
	[SP.POP.65UP.FE.IN] FLOAT NULL, 
	[SP.POP.6569.MA.5Y] FLOAT NULL, 
	[SP.POP.6569.FE.5Y] FLOAT NULL, 
	[SP.POP.6064.MA.5Y] FLOAT NULL, 
	[SP.POP.6064.FE.5Y] FLOAT NULL, 
	[SP.POP.5559.MA.5Y] FLOAT NULL, 
	[SP.POP.5559.FE.5Y] FLOAT NULL, 
	[SP.POP.5054.MA.5Y] FLOAT NULL, 
	[SP.POP.5054.FE.5Y] FLOAT NULL, 
	[SP.POP.4549.MA.5Y] FLOAT NULL, 
	[SP.POP.4549.FE.5Y] FLOAT NULL, 
	[SP.POP.4044.MA.5Y] FLOAT NULL, 
	[SP.POP.4044.FE.5Y] FLOAT NULL, 
	[SP.POP.3539.MA.5Y] FLOAT NULL, 
	[SP.POP.3539.FE.5Y] FLOAT NULL, 
	[SP.POP.3034.MA.5Y] FLOAT NULL, 
	[SP.POP.3034.FE.5Y] FLOAT NULL, 
	[SP.POP.2529.MA.5Y] FLOAT NULL, 
	[SP.POP.2529.FE.5Y] FLOAT NULL, 
	[SP.POP.2024.MA.5Y] FLOAT NULL, 
	[SP.POP.2024.FE.5Y] FLOAT NULL, 
	[SP.POP.1564.TO.ZS] FLOAT NULL, 
	[SP.POP.1564.TO] FLOAT NULL, 
	[SP.POP.1564.MA.ZS] FLOAT NULL, 
	[SP.POP.1564.MA.IN] FLOAT NULL, 
	[SP.POP.1564.FE.ZS] FLOAT NULL, 
	[SP.POP.1564.FE.IN] FLOAT NULL, 
	[SP.POP.1519.MA.5Y] FLOAT NULL, 
	[SP.POP.1519.FE.5Y] FLOAT NULL, 
	[SP.POP.1014.MA.5Y] FLOAT NULL, 
	[SP.POP.1014.FE.5Y] FLOAT NULL, 
	[SP.POP.0509.MA.5Y] FLOAT NULL, 
	[SP.POP.0509.FE.5Y] FLOAT NULL, 
	[SP.POP.0014.TO.ZS] FLOAT NULL, 
	[SP.POP.0014.TO] FLOAT NULL, 
	[SP.POP.0014.MA.ZS] FLOAT NULL, 
	[SP.POP.0014.MA.IN] FLOAT NULL, 
	[SP.POP.0014.FE.ZS] FLOAT NULL, 
	[SP.POP.0014.FE.IN] FLOAT NULL, 
	[SP.POP.0004.MA.5Y] FLOAT NULL, 
	[SP.POP.0004.FE.5Y] FLOAT NULL, 
	[SP.MTR.1519.ZS] FLOAT NULL, 
	[SP.M18.2024.FE.ZS] FLOAT NULL, 
	[SP.HOU.FEMA.ZS] FLOAT NULL, 
	[SP.DYN.WFRT] FLOAT NULL, 
	[SP.DYN.TO65.MA.ZS] FLOAT NULL, 
	[SP.DYN.TO65.FE.ZS] FLOAT NULL, 
	[SP.DYN.TFRT.IN] FLOAT NULL, 
	[SP.DYN.LE00.MA.IN] FLOAT NULL, 
	[SP.DYN.LE00.IN] FLOAT NULL, 
	[SP.DYN.LE00.FE.IN] FLOAT NULL, 
	[SP.DYN.IMRT.MA.IN] FLOAT NULL, 
	[SP.DYN.IMRT.IN] FLOAT NULL, 
	[SP.DYN.IMRT.FE.IN] FLOAT NULL, 
	[SP.DYN.CONU.ZS] FLOAT NULL, 
	[SP.DYN.CONM.ZS] FLOAT NULL, 
	[SP.DYN.CDRT.IN] FLOAT NULL, 
	[SP.DYN.CBRT.IN] FLOAT NULL, 
	[SP.DYN.AMRT.MA] FLOAT NULL, 
	[SP.DYN.AMRT.FE] FLOAT NULL, 
	[SP.DTH.REPT.ZS] FLOAT NULL, 
	[SP.DTH.INFR.ZS] FLOAT NULL, 
	[SP.ADO.TFRT] FLOAT NULL,
	CONSTRAINT [PK_WDI_Health_Indicators] PRIMARY KEY ([CountryCode], [Year])
);
GO
CREATE NONCLUSTERED INDEX [IX_WDI_Health_Indicators_Year] ON [WDI].[Health_Indicators]([Year]);
GO

-- create a view for our reports
CREATE VIEW [RPT].[Health]
AS
SELECT
	c.[CountryCode],
	c.[ShortName],
	c.[LongName],
	c.[Region],
	c.[IncomeGroup],
	i.[Year], 
	i.[SP.UWT.TFRT], 
	i.[SP.REG.DTHS.ZS], 
	i.[SP.REG.BRTH.ZS], 
	i.[SP.REG.BRTH.UR.ZS], 
	i.[SP.REG.BRTH.RU.ZS], 
	i.[SP.REG.BRTH.MA.ZS], 
	i.[SP.REG.BRTH.FE.ZS], 
	i.[SP.POP.TOTL.MA.ZS], 
	i.[SP.POP.TOTL.MA.IN], 
	i.[SP.POP.TOTL.FE.ZS], 
	i.[SP.POP.TOTL.FE.IN], 
	i.[SP.POP.TOTL], 
	i.[SP.POP.GROW], 
	i.[SP.POP.DPND.YG], 
	i.[SP.POP.DPND.OL], 
	i.[SP.POP.DPND], 
	i.[SP.POP.BRTH.MF], 
	i.[SP.POP.80UP.MA.5Y], 
	i.[SP.POP.80UP.FE.5Y], 
	i.[SP.POP.7579.MA.5Y], 
	i.[SP.POP.7579.FE.5Y], 
	i.[SP.POP.7074.MA.5Y], 
	i.[SP.POP.7074.FE.5Y], 
	i.[SP.POP.65UP.TO.ZS], 
	i.[SP.POP.65UP.TO], 
	i.[SP.POP.65UP.MA.ZS], 
	i.[SP.POP.65UP.MA.IN], 
	i.[SP.POP.65UP.FE.ZS], 
	i.[SP.POP.65UP.FE.IN], 
	i.[SP.POP.6569.MA.5Y], 
	i.[SP.POP.6569.FE.5Y], 
	i.[SP.POP.6064.MA.5Y], 
	i.[SP.POP.6064.FE.5Y], 
	i.[SP.POP.5559.MA.5Y], 
	i.[SP.POP.5559.FE.5Y], 
	i.[SP.POP.5054.MA.5Y], 
	i.[SP.POP.5054.FE.5Y], 
	i.[SP.POP.4549.MA.5Y], 
	i.[SP.POP.4549.FE.5Y], 
	i.[SP.POP.4044.MA.5Y], 
	i.[SP.POP.4044.FE.5Y], 
	i.[SP.POP.3539.MA.5Y], 
	i.[SP.POP.3539.FE.5Y], 
	i.[SP.POP.3034.MA.5Y], 
	i.[SP.POP.3034.FE.5Y], 
	i.[SP.POP.2529.MA.5Y], 
	i.[SP.POP.2529.FE.5Y], 
	i.[SP.POP.2024.MA.5Y], 
	i.[SP.POP.2024.FE.5Y], 
	i.[SP.POP.1564.TO.ZS], 
	i.[SP.POP.1564.TO], 
	i.[SP.POP.1564.MA.ZS], 
	i.[SP.POP.1564.MA.IN], 
	i.[SP.POP.1564.FE.ZS], 
	i.[SP.POP.1564.FE.IN], 
	i.[SP.POP.1519.MA.5Y], 
	i.[SP.POP.1519.FE.5Y], 
	i.[SP.POP.1014.MA.5Y], 
	i.[SP.POP.1014.FE.5Y], 
	i.[SP.POP.0509.MA.5Y], 
	i.[SP.POP.0509.FE.5Y], 
	i.[SP.POP.0014.TO.ZS], 
	i.[SP.POP.0014.TO], 
	i.[SP.POP.0014.MA.ZS], 
	i.[SP.POP.0014.MA.IN], 
	i.[SP.POP.0014.FE.ZS], 
	i.[SP.POP.0014.FE.IN], 
	i.[SP.POP.0004.MA.5Y], 
	i.[SP.POP.0004.FE.5Y], 
	i.[SP.MTR.1519.ZS], 
	i.[SP.M18.2024.FE.ZS], 
	i.[SP.HOU.FEMA.ZS], 
	i.[SP.DYN.WFRT], 
	i.[SP.DYN.TO65.MA.ZS], 
	i.[SP.DYN.TO65.FE.ZS], 
	i.[SP.DYN.TFRT.IN], 
	i.[SP.DYN.LE00.MA.IN], 
	i.[SP.DYN.LE00.IN], 
	i.[SP.DYN.LE00.FE.IN], 
	i.[SP.DYN.IMRT.MA.IN], 
	i.[SP.DYN.IMRT.IN], 
	i.[SP.DYN.IMRT.FE.IN], 
	i.[SP.DYN.CONU.ZS], 
	i.[SP.DYN.CONM.ZS], 
	i.[SP.DYN.CDRT.IN], 
	i.[SP.DYN.CBRT.IN], 
	i.[SP.DYN.AMRT.MA], 
	i.[SP.DYN.AMRT.FE], 
	i.[SP.DTH.REPT.ZS], 
	i.[SP.DTH.INFR.ZS], 
	i.[SP.ADO.TFRT],
	i.[SN.ITK.VITA.ZS], 
	i.[SN.ITK.SALT.ZS], 
	i.[SN.ITK.DFCT], 
	i.[SN.ITK.DEFC.ZS],
	i.[SH.XPD.PVTD.PP.CD], 
	i.[SH.XPD.PVTD.PC.CD], 
	i.[SH.XPD.PVTD.CH.ZS], 
	i.[SH.XPD.OOPC.PP.CD], 
	i.[SH.XPD.OOPC.PC.CD], 
	i.[SH.XPD.OOPC.CH.ZS], 
	i.[SH.XPD.GHED.PP.CD], 
	i.[SH.XPD.GHED.PC.CD], 
	i.[SH.XPD.GHED.GE.ZS], 
	i.[SH.XPD.GHED.GD.ZS], 
	i.[SH.XPD.GHED.CH.ZS], 
	i.[SH.XPD.EHEX.PP.CD], 
	i.[SH.XPD.EHEX.PC.CD], 
	i.[SH.XPD.EHEX.CH.ZS], 
	i.[SH.XPD.CHEX.PP.CD], 
	i.[SH.XPD.CHEX.PC.CD], 
	i.[SH.XPD.CHEX.GD.ZS], 
	i.[SH.VAC.TTNS.ZS], 
	i.[SH.UHC.SRVS.CV.XD], 
	i.[SH.UHC.OOPC.25.ZS], 
	i.[SH.UHC.OOPC.25.TO], 
	i.[SH.UHC.OOPC.10.ZS], 
	i.[SH.UHC.OOPC.10.TO], 
	i.[SH.UHC.NOP2.ZS], 
	i.[SH.UHC.NOP2.ZG], 
	i.[SH.UHC.NOP2.TO], 
	i.[SH.UHC.NOP2.CG], 
	i.[SH.UHC.NOP1.ZS], 
	i.[SH.UHC.NOP1.ZG], 
	i.[SH.UHC.NOP1.TO], 
	i.[SH.UHC.NOP1.CG], 
	i.[SH.TBS.INCD], 
	i.[SH.TBS.DTEC.ZS], 
	i.[SH.TBS.CURE.ZS], 
	i.[SH.SVR.WAST.ZS], 
	i.[SH.SVR.WAST.MA.ZS], 
	i.[SH.SVR.WAST.FE.ZS], 
	i.[SH.STA.WAST.ZS], 
	i.[SH.STA.WAST.MA.ZS], 
	i.[SH.STA.WAST.FE.ZS], 
	i.[SH.STA.TRAF.P5], 
	i.[SH.STA.SUIC.P5], 
	i.[SH.STA.STNT.ZS], 
	i.[SH.STA.STNT.MA.ZS], 
	i.[SH.STA.STNT.FE.ZS], 
	i.[SH.STA.SMSS.ZS], 
	i.[SH.STA.SMSS.UR.ZS], 
	i.[SH.STA.SMSS.RU.ZS], 
	i.[SH.STA.OWGH.ZS], 
	i.[SH.STA.OWGH.MA.ZS], 
	i.[SH.STA.OWGH.FE.ZS], 
	i.[SH.STA.ORTH], 
	i.[SH.STA.ORCF.ZS], 
	i.[SH.STA.ODFC.ZS], 
	i.[SH.STA.ODFC.UR.ZS], 
	i.[SH.STA.ODFC.RU.ZS], 
	i.[SH.STA.MMRT.NE], 
	i.[SH.STA.MMRT], 
	i.[SH.STA.MALN.ZS], 
	i.[SH.STA.MALN.MA.ZS], 
	i.[SH.STA.MALN.FE.ZS], 
	i.[SH.STA.HYGN.ZS], 
	i.[SH.STA.HYGN.UR.ZS], 
	i.[SH.STA.HYGN.RU.ZS], 
	i.[SH.STA.FGMS.ZS], 
	i.[SH.STA.DIAB.ZS], 
	i.[SH.STA.BRTW.ZS], 
	i.[SH.STA.BRTC.ZS], 
	i.[SH.STA.BFED.ZS], 
	i.[SH.STA.BASS.ZS], 
	i.[SH.STA.BASS.UR.ZS], 
	i.[SH.STA.BASS.RU.ZS], 
	i.[SH.STA.ARIC.ZS], 
	i.[SH.STA.ANVC.ZS], 
	i.[SH.SGR.PROC.P5], 
	i.[SH.SGR.IRSK.ZS], 
	i.[SH.SGR.CRSK.ZS], 
	i.[SH.PRV.SMOK.MA], 
	i.[SH.PRV.SMOK.FE], 
	i.[SH.PRG.ANEM], 
	i.[SH.MMR.RISK.ZS], 
	i.[SH.MMR.RISK], 
	i.[SH.MMR.DTHS], 
	i.[SH.MLR.TRET.ZS], 
	i.[SH.MLR.NETS.ZS], 
	i.[SH.MLR.INCD.P3], 
	i.[SH.MED.SAOP.P5], 
	i.[SH.MED.PHYS.ZS], 
	i.[SH.MED.NUMW.P3], 
	i.[SH.MED.CMHW.P3], 
	i.[SH.MED.BEDS.ZS], 
	i.[SH.IMM.MEAS], 
	i.[SH.IMM.IDPT], 
	i.[SH.IMM.HEPB], 
	i.[SH.HIV.PMTC.ZS], 
	i.[SH.HIV.INCD.ZS], 
	i.[SH.HIV.INCD.TL], 
	i.[SH.HIV.INCD.14], 
	i.[SH.HIV.INCD], 
	i.[SH.HIV.ARTC.ZS], 
	i.[SH.HIV.1524.MA.ZS], 
	i.[SH.HIV.1524.FE.ZS], 
	i.[SH.HIV.0014], 
	i.[SH.H2O.SMDW.ZS], 
	i.[SH.H2O.SMDW.UR.ZS], 
	i.[SH.H2O.SMDW.RU.ZS], 
	i.[SH.H2O.BASW.ZS], 
	i.[SH.H2O.BASW.UR.ZS], 
	i.[SH.H2O.BASW.RU.ZS], 
	i.[SH.FPL.SATM.ZS], 
	i.[SH.DYN.NMRT], 
	i.[SH.DYN.NCOM.ZS], 
	i.[SH.DYN.MORT.MA], 
	i.[SH.DYN.MORT.FE], 
	i.[SH.DYN.MORT], 
	i.[SH.DYN.AIDS.ZS], 
	i.[SH.DYN.AIDS.FE.ZS], 
	i.[SH.DYN.0514], 
	i.[SH.DTH.NMRT], 
	i.[SH.DTH.NCOM.ZS], 
	i.[SH.DTH.MORT], 
	i.[SH.DTH.INJR.ZS], 
	i.[SH.DTH.IMRT], 
	i.[SH.DTH.COMM.ZS], 
	i.[SH.DTH.0514], 
	i.[SH.CON.1524.MA.ZS], 
	i.[SH.CON.1524.FE.ZS], 
	i.[SH.ANM.NPRG.ZS], 
	i.[SH.ANM.CHLD.ZS], 
	i.[SH.ANM.ALLW.ZS], 
	i.[SH.ALC.PCAP.LI]
FROM [WDI].[Health_Countries] c
INNER JOIN [WDI].[Health_Indicators] i ON c.[CountryCode] = i.[CountryCode];
GO

CREATE USER [WDIHealthReports]
WITH PASSWORD = 'pa$$w0rd';
GO

ALTER ROLE [db_owner] ADD MEMBER [WDIHealthReports];
GO
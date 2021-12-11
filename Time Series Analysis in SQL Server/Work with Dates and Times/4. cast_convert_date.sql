DECLARE
	@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245',
	@OlderDateType DATETIME = '2016-11-03 00:30:29.245';


SELECT
	-- Fill in the missing function calls
	CAST(@CubsWinWorldSeries AS DATE) AS CubsWinDateForm,
	CAST(@CubsWinWorldSeries AS NVARCHAR(30)) AS CubsWinStringForm,
	CAST(@OlderDateType AS DATE) AS OlderDateForm,
	CAST(@OlderDateType AS NVARCHAR(30)) AS OlderStringForm;

/*
CubsWinDateForm	CubsWinStringForm	 OlderDateForm	 OlderStringForm
2016-11-03	2016-11-03 00:30:29.245	 2016-11-03	     Nov  3 2016 12:30AM */


DECLARE
	@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';
SELECT
	CAST(CAST(@CubsWinWorldSeries AS DATE) AS NVARCHAR(30)) AS DateStringForm;

DECLARE
	@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';
SELECT
	CONVERT(DATE, @CubsWinWorldSeries) AS CubsWinDateForm,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries) AS CubsWinStringForm;

DECLARE
	@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';
SELECT
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 0) AS DefaultForm,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 3) AS UK_dmy,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries,1) AS US_mdy,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 103) AS UK_dmyyyy,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 101) AS US_mdyyyy;
-- 'd' format as short dates.
DECLARE
	@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';

SELECT
	-- Fill in the function call and format parameter
	FORMAT(@Python3ReleaseDate, 'd', 'en-US') AS US_d,
	FORMAT(@Python3ReleaseDate, 'd', 'de-DE') AS DE_d,
	-- Fill in the locale for Japan
	FORMAT(@Python3ReleaseDate, 'd', 'jp-JP') AS JP_d,
	FORMAT(@Python3ReleaseDate, 'd', 'zh-cn') AS CN_d;

--'D' to build long dates
DECLARE
	@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';

SELECT
	-- Fill in the format parameter
	FORMAT(@Python3ReleaseDate, 'D', 'en-US') AS US_D,
	FORMAT(@Python3ReleaseDate, 'D', 'de-DE') AS DE_D,
	-- Fill in the locale for Indonesia
	FORMAT(@Python3ReleaseDate, 'D', 'id-ID') AS ID_D,
	FORMAT(@Python3ReleaseDate, 'D', 'zh-cn') AS CN_D;


DECLARE
	@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';
    
SELECT
	-- 20081203
	FORMAT(@Python3ReleaseDate, 'yyyyMMdd') AS F1,
	-- 2008-12-03
	FORMAT(@Python3ReleaseDate, 'yyyy-MM-dd') AS F2,
	-- Dec 03+2008 (the + is just a "+" character)
	FORMAT(@Python3ReleaseDate, 'MMM dd+yyyy') AS F3,
	-- 12 08 03 (month, two-digit year, day)
	FORMAT(@Python3ReleaseDate, 'MM yy dd') AS F4,
	-- 03 07:45 2008.00
    -- (day hour:minute year.second)
	FORMAT(@Python3ReleaseDate, 'dd hh:mm yyyy.ss') AS F5;
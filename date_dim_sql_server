CREATE TABLE DateDimension (
    DateKey INT PRIMARY KEY,
    DateFull DATE NOT NULL,
    Year SMALLINT NOT NULL,
    Quarter TINYINT NOT NULL,
    Month TINYINT NOT NULL,
    MonthName VARCHAR(10) NOT NULL,
    DayOfMonth TINYINT NOT NULL,
    DayOfWeek TINYINT NOT NULL,
    DayOfWeekName VARCHAR(10) NOT NULL,
    WeekOfYear TINYINT NOT NULL,
    IsWeekend BIT NOT NULL,
    IsHoliday BIT NOT NULL,
    HolidayName VARCHAR(50)
);

-- Example of how you might populate the table for one year (e.g., 2023)
DECLARE @Date DATE = '2023-01-01';

WHILE @Date < '2024-01-01'
BEGIN
    INSERT INTO DateDimension (
        DateKey,
        DateFull,
        Year,
        Quarter,
        Month,
        MonthName,
        DayOfMonth,
        DayOfWeek,
        DayOfWeekName,
        WeekOfYear,
        IsWeekend,
        IsHoliday,
        HolidayName
    )
    VALUES (
        CONVERT(INT, REPLACE(CONVERT(VARCHAR, @Date, 112), '-', '')), -- DateKey as YYYYMMDD
        @Date, -- Full Date
        YEAR(@Date), -- Year
        DATEPART(QUARTER, @Date), -- Quarter
        MONTH(@Date), -- Month
        DATENAME(MONTH, @Date), -- Month Name
        DAY(@Date), -- Day of Month
        DATEPART(WEEKDAY, @Date), -- Day of Week
        DATENAME(WEEKDAY, @Date), -- Day of Week Name
        DATEPART(WEEK, @Date), -- Week of Year
        CASE WHEN DATEPART(WEEKDAY, @Date) IN (1, 7) THEN 1 ELSE 0 END, -- IsWeekend
        0, -- IsHoliday (Placeholder, needs logic to determine holidays)
        NULL -- HolidayName (Placeholder, needs logic for holiday names)
    );

    SET @Date = DATEADD(DAY, 1, @Date);
END;

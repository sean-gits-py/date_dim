DO $$
DECLARE
    _date DATE := '2023-01-01';
BEGIN
    WHILE _date < '2024-01-01' LOOP
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
        ) VALUES (
            CAST(TO_CHAR(_date, 'YYYYMMDD') AS INT),
            _date,
            EXTRACT(YEAR FROM _date),
            EXTRACT(QUARTER FROM _date),
            EXTRACT(MONTH FROM _date),
            TO_CHAR(_date, 'Month'),
            EXTRACT(DAY FROM _date),
            EXTRACT(DOW FROM _date) + 1, -- Adjusting for PostgreSQL's 0-indexed DOW
            TO_CHAR(_date, 'Day'),
            EXTRACT(WEEK FROM _date),
            CASE WHEN EXTRACT(DOW FROM _date) IN (0, 6) THEN TRUE ELSE FALSE END,
            FALSE,
            NULL
        );

        _date := _date + INTERVAL '1 day';
    END LOOP;
END $$;

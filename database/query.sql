--Create the Address table
CREATE TABLE Addresses (
    ID VARCHAR(100) NOT NULL, 
    Name VARCHAR(255) NOT NULL
);

--Create the Theaters table
CREATE TABLE Theaters (
    ID VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    TotalHall INT NOT NULL,
    AddressID VARCHAR(100) NOT NULL
);

--Create the Halls table
CREATE TABLE Halls (
    ID VARCHAR(255) NOT NULL, 
    Number INT NOT NULL,
    TotalSeat INT NOT NULL,
    TheaterID VARCHAR(255) NOT NULL
);

--Create the Seats table
CREATE TABLE Seats (
    ID INT IDENTITY(1,1) NOT NULL,
	Name VARCHAR(20) NOT NULL,
    Row VARCHAR(1) NOT NULL,
    Col INT NOT NULL,
    HallID VARCHAR(255) NOT NULL,
	SeatTypeID INT NOT NULL
);

--Create the SeatTypes
CREATE TABLE SeatTypes(
	ID INT NOT NULL,
	Name VARCHAR(50),
	Price DECIMAL(8,0)
)

--Create the Genres table
CREATE TABLE Genres (
    ID VARCHAR(100) NOT NULL,
    Name VARCHAR(100) NOT NULL
);

--Create the Movies table
ALTER TABLE Movies (
    ID INT IDENTITY(1,1) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    RunningTime INT NOT NULL,
    Description VARCHAR(1000),
    Poster VARCHAR(255),
    ReleaseDate DATE,
    Trailer VARCHAR(255),
    GenreID VARCHAR(100) NOT NULL,
	MovieStatusID INT NOT NULL
);

CREATE TABLE MovieStatuses(
	ID INT NOT NULL,
	Name VARCHAR(100)
)

--Create Movies and Genres
CREATE TABLE MovieGenres(
 ID INT IDENTITY(1,1) NOT NULL,
 MovieID INT NOT NULL,
 GenreID VARCHAR(100) NOT NULL
);

--Create the Shows table
CREATE TABLE Shows (
    ID INT IDENTITY(1,1) NOT NULL, 
    ShowDate DATE NOT NULL,
    ShowTime TIME NOT NULL,
	ShowPrice DECIMAL(8,0) NOT NULL,
    HallID VARCHAR(255) NOT NULL,
    MovieID INT NOT NULL
);

--Create the ShowBookings table
CREATE TABLE ShowBookings (
    ID INT IDENTITY(1,1) NOT NULL,
    Username VARCHAR(255),
    ShowID INT NOT NULL,
    NumberOfSeats INT NOT NULL,
	Total DECIMAL(8,0)
);

--Create the SeatBookings table (assuming UsernameID is a typo and should be Username)
CREATE TABLE SeatBookings (
    ID INT IDENTITY(1,1) NOT NULL, 
    SeatID INT,
    Username VARCHAR(255),
    ShowBookingID INT NOT NULL
);

--Create the Foods table
CREATE TABLE Foods (
    ID INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(8,0) NOT NULL
);

--Create the Drinks table
CREATE TABLE Drinks (
    ID INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Price DECIMAL(8,0) NOT NULL
);

--Create the FoodBookings table
CREATE TABLE FoodBookings (
    ID INT IDENTITY(1,1) NOT NULL,
    Username VARCHAR(255),
    FoodID INT NOT NULL,
    ShowBookingID INT NOT NULL
);

--Create the DrinkBookings table
CREATE TABLE DrinkBookings (
    ID INT IDENTITY(1,1) NOT NULL,
    Username VARCHAR(255),
    DrinkID INT NOT NULL,
    ShowBookingID INT NOT NULL
);

--Create the UserTypes table
CREATE TABLE UserTypes (
    ID INT IDENTITY(1,1) NOT NULL, -- No primary key yet
    Role VARCHAR(10) NOT NULL
);

--Create the Users table
CREATE TABLE Users (
    Username VARCHAR(255) NOT NULL, -- No primary key yet
    Password VARCHAR(255) NOT NULL,
    UserTypeID INT NOT NULL
);

ALTER TABLE Addresses ADD PRIMARY KEY (ID);
ALTER TABLE Theaters ADD PRIMARY KEY (ID);
ALTER TABLE Genres ADD PRIMARY KEY (ID);
ALTER TABLE Movies ADD PRIMARY KEY (ID);
ALTER TABLE MovieStatuses ADD PRIMARY KEY (ID);
ALTER TABLE MovieGenres ADD PRIMARY KEY (ID);
ALTER TABLE Halls ADD PRIMARY KEY (ID);
ALTER TABLE Seats ADD PRIMARY KEY (ID);
ALTER TABLE SeatTypes ADD PRIMARY KEY (ID)
ALTER TABLE UserTypes ADD PRIMARY KEY (ID);
ALTER TABLE Users ADD PRIMARY KEY (Username);
ALTER TABLE Shows ADD PRIMARY KEY (ID);
ALTER TABLE ShowBookings ADD PRIMARY KEY (ID);
ALTER TABLE SeatBookings ADD PRIMARY KEY (ID);
ALTER TABLE Foods ADD PRIMARY KEY (ID);
ALTER TABLE Drinks ADD PRIMARY KEY (ID);
ALTER TABLE FoodBookings ADD PRIMARY KEY (ID);
ALTER TABLE DrinkBookings ADD PRIMARY KEY (ID);

-- Add foreign keys
ALTER TABLE Theaters
ADD CONSTRAINT FK_Theaters_Addresses
FOREIGN KEY (AddressID) 
REFERENCES Addresses(ID);

ALTER TABLE Movies 
ADD CONSTRAINT FK_Movies_Genres 
FOREIGN KEY (GenreID) 
REFERENCES Genres(ID);

ALTER TABLE Movies
ADD CONSTRAINT FK_Movies_Status
FOREIGN KEY (MovieStatusID)
REFERENCES MovieStatuses(ID);

ALTER TABLE Halls 
ADD CONSTRAINT FK_Halls_Theaters 
FOREIGN KEY (TheaterID) 
REFERENCES Theaters(ID);

ALTER TABLE Seats 
ADD CONSTRAINT FK_Seats_Halls 
FOREIGN KEY (HallID) 
REFERENCES Halls(ID);

ALTER TABLE Seats
ADD CONSTRAINT FK_Seats_SeatTypes
FOREIGN KEY (SeatTypeID)
REFERENCES SeatTypes(ID);

ALTER TABLE Users 
ADD CONSTRAINT FK_Users_UserTypes 
FOREIGN KEY (UserTypeID) 
REFERENCES UserTypes(ID);

ALTER TABLE Shows 
ADD CONSTRAINT FK_Shows_Halls 
FOREIGN KEY (HallID) 
REFERENCES Halls(ID);

ALTER TABLE Shows 
ADD CONSTRAINT FK_Shows_Movies 
FOREIGN KEY (MovieID) 
REFERENCES Movies(ID);

ALTER TABLE ShowBookings 
ADD CONSTRAINT FK_ShowBookings_Users 
FOREIGN KEY (Username) 
REFERENCES Users(Username);

ALTER TABLE ShowBookings 
ADD CONSTRAINT FK_ShowBookings_Shows 
FOREIGN KEY (ShowID) 
REFERENCES Shows(ID);

ALTER TABLE SeatBookings 
ADD CONSTRAINT FK_SeatBookings_Seats 
FOREIGN KEY (SeatID) 
REFERENCES Seats(ID);

ALTER TABLE SeatBookings 
ADD CONSTRAINT FK_SeatBookings_Users 
FOREIGN KEY (Username) 
REFERENCES Users(Username);

ALTER TABLE SeatBookings 
ADD CONSTRAINT FK_SeatBookings_ShowBookings 
FOREIGN KEY (ShowBookingID) 
REFERENCES ShowBookings(ID);

ALTER TABLE FoodBookings 
ADD CONSTRAINT FK_FoodBookings_Users 
FOREIGN KEY (Username) 
REFERENCES Users(Username);

ALTER TABLE FoodBookings 
ADD CONSTRAINT FK_FoodBookings_Foods 
FOREIGN KEY (FoodID) 
REFERENCES Foods(ID);

ALTER TABLE FoodBookings 
ADD CONSTRAINT FK_FoodBookings_ShowBookings 
FOREIGN KEY (ShowBookingID) 
REFERENCES ShowBookings(ID);

ALTER TABLE DrinkBookings 
ADD CONSTRAINT FK_DrinkBookings_Users 
FOREIGN KEY (Username) 
REFERENCES Users(Username);

ALTER TABLE DrinkBookings 
ADD CONSTRAINT FK_DrinkBookings_Drinks 
FOREIGN KEY (DrinkID) 
REFERENCES Drinks(ID);

ALTER TABLE DrinkBookings 
ADD CONSTRAINT FK_DrinkBookings_ShowBookings 
FOREIGN KEY (ShowBookingID) 
REFERENCES ShowBookings(ID);

ALTER TABLE MovieGenres 
ADD CONSTRAINT FK_MovieGenres_Movies 
FOREIGN KEY (MovieID) 
REFERENCES Movies(ID);

ALTER TABLE MovieGenres 
ADD CONSTRAINT FK_MovieGenres_Genres 
FOREIGN KEY (GenreID)
REFERENCES Genres(ID);

-- input value
--addresses
select * from Addresses
insert into Addresses values 
('binhthanh', 'Binh Thanh'),
('govap', 'Go Vap'),
('thuduc', 'Thu Duc'),
('district1', 'Quan 1')
--Theaters
select * from Theaters
insert into Theaters values
('phanvantri', 'Phan Van Tri Theater', 3, 'govap'),
('dienbienphu', 'Dien Bien Phu Theater', 4, 'binhthanh'),
('phamvandong', 'Pham Van Dong Theater', 4, 'thuduc'),
('nguyenhue', 'Nguyen Hue Theater', 5, 'district1')
--Halls
select * from Halls
insert into Halls values
('phanvantri_1', 1, 100, 'phanvantri'),
('phanvantri_2', 2, 120, 'phanvantri'),
('phanvantri_3', 3, 100, 'phanvantri'),
('dienbienphu_1', 1, 120, 'dienbienphu'),
('dienbienphu_2', 2, 100, 'dienbienphu'),
('dienbienphu_3', 3, 120, 'dienbienphu'),
('dienbienphu_4', 4, 100, 'dienbienphu'),
('phamvandong_1', 1, 100, 'phamvandong'),
('phamvandong_2', 2, 120, 'phamvandong'),
('phamvandong_3', 1, 100, 'phamvandong'),
('phamvandong_4', 4, 120, 'phamvandong'),
('nguyenhue_1', 1, 100, 'nguyenhue'),
('nguyenhue_2', 2, 120, 'nguyenhue'),
('nguyenhue_3', 3, 120, 'nguyenhue'),
('nguyenhue_4', 4, 100, 'nguyenhue'),
('nguyenhue_5', 5, 120, 'nguyenhue')
--SeatTypes
select * from SeatTypes
insert into SeatTypes values
(1, 'Standard', 50000),
(2, 'VIP', 80000)
-- Seats

CREATE PROCEDURE GenerateSeatsForHall
    @HallID VARCHAR(255),
	@TotalSeat INT
AS
BEGIN
    DECLARE @row CHAR(1);
    DECLARE @col INT;
    DECLARE @seatTypeID INT;
    DECLARE @seatID VARCHAR(10);
    DECLARE @i INT = 1;

    -- Loop to generate 50 seats
    WHILE @i <= @TotalSeat
    BEGIN
        -- Calculate row letter (A, B, C, ...)
        SET @row = CHAR(64 + ((@i - 1) / 10) + 1);
        
        -- Calculate column number (1 to 10)
        SET @col = ((@i - 1) % 10) + 1;
        
        -- Determine seat type: 1 for standard (first 20 seats), 2 for VIP (remaining 30 seats)
        SET @seatTypeID = CASE WHEN @i <= 30 THEN 1 ELSE 2 END;
        
        -- Generate seat ID
        SET @seatID = 'seat_' + LOWER(@row) + CAST(@col AS VARCHAR(2));
        
        -- Insert into Seats table
        INSERT INTO Seats (ID, Row, Col, HallID, SeatTypeID)
        VALUES (@seatID, @row, @col, @HallID, @seatTypeID);
        
        -- Increment loop counter
        SET @i += 1;
    END
END;
--EXECUTE
EXEC GenerateSeatsForHall @HallID = 'phanvantri_1', @TotalSeat = 100;
--
CREATE PROCEDURE GenerateSeatsForAllHalls
AS
BEGIN
    DECLARE @HallID VARCHAR(255);
    DECLARE @TotalSeat INT;
    DECLARE @ExistingSeats INT;
    DECLARE @seatName VARCHAR(20);

    -- Declare a cursor to select all halls from the Halls table
    DECLARE hall_cursor CURSOR FOR
    SELECT ID, TotalSeat
    FROM Halls;

    -- Open the cursor
    OPEN hall_cursor;

    -- Fetch the first row from the cursor
    FETCH NEXT FROM hall_cursor INTO @HallID, @TotalSeat;

    -- Loop until there are no more rows to fetch
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if the hall already has seats
        SELECT @ExistingSeats = COUNT(*)
        FROM Seats
        WHERE HallID = @HallID;

        IF @ExistingSeats > 0
        BEGIN
            -- Print an announcement
            PRINT 'Hall ' + @HallID + ' already has seats.';
        END
        ELSE
        BEGIN
            -- Declare variables for seat generation
            DECLARE @row CHAR(1);
            DECLARE @col INT;
            DECLARE @seatTypeID INT;
            DECLARE @i INT = 1;

            -- Loop to generate seats for the current hall
            WHILE @i <= @TotalSeat
            BEGIN
                -- Calculate row letter (A, B, C, ...)
                SET @row = CHAR(64 + ((@i - 1) / 10) + 1);

                -- Calculate column number (1 to 10)
                SET @col = ((@i - 1) % 10) + 1;

                -- Determine seat type: 1 for standard (first 30 seats), 2 for VIP (remaining seats)
                SET @seatTypeID = CASE WHEN @i <= 30 THEN 1 ELSE 2 END;

                -- Generate seat name
                SET @seatName = 'seat_' + LOWER(@row) + CAST(@col AS VARCHAR(2));

                -- Insert into Seats table
                INSERT INTO Seats (Name, Row, Col, HallID, SeatTypeID)
                VALUES (@seatName, @row, @col, @HallID, @seatTypeID);

                -- Increment loop counter
                SET @i += 1;
            END
            
            -- Print a success message
            PRINT 'Seats created successfully for Hall ' + @HallID;
        END

        -- Fetch the next row from the cursor
        FETCH NEXT FROM hall_cursor INTO @HallID, @TotalSeat;
    END

    -- Close and deallocate the cursor
    CLOSE hall_cursor;
    DEALLOCATE hall_cursor;
END;

EXEC GenerateSeatsForAllHalls;
select * from Seats




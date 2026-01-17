CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE CHECK (Email LIKE '%_@__%.__%'),
    Phone VARCHAR(15),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Agents (
    AgentID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE CHECK (Email LIKE '%_@__%.__%'),
    Phone VARCHAR(15),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Destinations (
    DestinationID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    Description TEXT
);

CREATE TABLE Packages (
    PackageID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Description TEXT
);

CREATE TABLE Bookings (
    BookingID SERIAL PRIMARY KEY,
    CustomerID INT,
    AgentID INT,
    PackageID INT,
    BookingDate DATE CHECK (BookingDate >= CURRENT_DATE),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID),
    FOREIGN KEY (PackageID) REFERENCES Packages(PackageID)
);

CREATE TABLE Payments (
    PaymentID SERIAL PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10, 2) CHECK (Amount > 0),
    PaymentDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Reviews (
    ReviewID SERIAL PRIMARY KEY,
    CustomerID INT,
    PackageID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (PackageID) REFERENCES Packages(PackageID)
);

CREATE TABLE Activities (
    ActivityID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Duration INT
);

CREATE TABLE BookingActivities (
    BookingID INT,
    ActivityID INT,
    PRIMARY KEY (BookingID, ActivityID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);

CREATE TABLE PackageDestinations (
    PackageID INT,
    DestinationID INT,
    PRIMARY KEY (PackageID, DestinationID),
    FOREIGN KEY (PackageID) REFERENCES Packages(PackageID),
    FOREIGN KEY (DestinationID) REFERENCES Destinations(DestinationID)
);

CREATE TABLE AgentBookings (
    AgentID INT,
    BookingID INT,
    PRIMARY KEY (AgentID, BookingID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


--create index 
CREATE INDEX idx_customer_id ON Bookings(CustomerID);
CREATE INDEX idx_agent_id ON Bookings(AgentID);
CREATE INDEX idx_package_id ON Bookings(PackageID);


--insert data
INSERT INTO Customers (Name, Email, Phone) VALUES
('John Doe', 'john@example.com', '1234567890'),
('Jane Smith', 'jane@example.com', '0987654321'),
('Alice Johnson', 'alice@example.com', '2345678901'),
('Bob Brown', 'bob@example.com', '3456789012');

INSERT INTO Agents (Name, Email, Phone) VALUES
('Agent A', 'agentA@example.com', '1122334455'),
('Agent B', 'agentB@example.com', '5566778899'),
('Agent C', 'agentC@example.com', '9988776655');

INSERT INTO Destinations (Name, Country, Description) VALUES
('Paris', 'France', 'City of Lights'),
('New York', 'USA', 'The Big Apple'),
('Tokyo', 'Japan', 'The Capital of Japan'),
('Sydney', 'Australia', 'Famous for its Opera House');

INSERT INTO Packages (Name, Price, Description) VALUES
('Paris Getaway', 999.99, 'A romantic trip to Paris'),
('New York Adventure', 799.99, 'Explore the vibrant city of New York'),
('Tokyo Experience', 1099.99, 'Discover the culture and cuisine of Tokyo'),
('Sydney Escape', 899.99, 'Enjoy the sights of Sydney');

INSERT INTO Bookings (CustomerID, AgentID, PackageID, BookingDate) VALUES
(1, 1, 1, CURRENT_DATE),
(2, 2, 2, CURRENT_DATE),
(3, 1, 3, CURRENT_DATE),
(4, 3, 4, CURRENT_DATE);

INSERT INTO Payments (BookingID, Amount, PaymentDate) VALUES
(1, 999.99, CURRENT_DATE),
(2, 799.99, CURRENT_DATE),
(3, 1099.99, CURRENT_DATE),
(4, 899.99, CURRENT_DATE);

INSERT INTO Reviews (CustomerID, PackageID, Rating, Comment) VALUES
(1, 1, 5, 'Amazing experience!'),
(2, 2, 4, 'Had a great time!'),
(3, 3, 5, 'Loved it!'),
(4, 4, 3, 'It was okay.');

INSERT INTO Activities (Name, Description, Duration) VALUES
('City Tour', 'A guided tour of the city.', 3),
('Museum Visit', 'Visit the famous museum.', 2),
('Culinary Experience', 'Learn to cook local dishes.', 4),
('Beach Day', 'Relax at the beach.', 5);

INSERT INTO BookingActivities (BookingID, ActivityID) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(4, 4);

INSERT INTO PackageDestinations (PackageID, DestinationID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO AgentBookings (AgentID, BookingID) VALUES
(1, 1),
(2, 2),
(1, 3),
(3, 4);

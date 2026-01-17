-- Inserting more Customers
INSERT INTO Customers (Name, Email, Phone) VALUES
('Charlie White', 'charlie@example.com', '4567890123'),
('Diana Prince', 'diana@example.com', '5678901234'),
('Ethan Hunt', 'ethan@example.com', '6789012345');

-- Inserting more Agents
INSERT INTO Agents (Name, Email, Phone) VALUES
('Agent D', 'agentD@example.com', '2233445566'),
('Agent E', 'agentE@example.com', '3344556677');

-- Inserting more Destinations
INSERT INTO Destinations (Name, Country, Description) VALUES
('Rome', 'Italy', 'The Eternal City'),
('London', 'UK', 'Capital of England');

-- Inserting more Packages
INSERT INTO Packages (Name, Price, Description) VALUES
('Rome Tour', 899.99, 'Explore the historic sites of Rome'),
('London Experience', 749.99, 'Discover the charm of London');

-- Inserting more Bookings
INSERT INTO Bookings (CustomerID, AgentID, PackageID, BookingDate) VALUES
(5, 1, 5, CURRENT_DATE),
(6, 2, 6, CURRENT_DATE),
(3, 1, 5, CURRENT_DATE),
(4, 2, 6, CURRENT_DATE);

-- Inserting more Payments
INSERT INTO Payments (BookingID, Amount, PaymentDate) VALUES
(5, 899.99, CURRENT_DATE),
(6, 749.99, CURRENT_DATE);

-- Inserting more Reviews
INSERT INTO Reviews (CustomerID, PackageID, Rating, Comment) VALUES
(5, 5, 4, 'Great tour!'),
(6, 6, 5, 'Amazing experience!'),
(3, 5, 3, 'It was okay.'),
(4, 6, 4, 'Really enjoyed it!');

-- Inserting more Activities
INSERT INTO Activities (Name, Description, Duration) VALUES
('Night Tour', 'A guided night tour of the city.', 3),
('Art Class', 'Learn to paint with local artists.', 4);

-- Inserting more BookingActivities
INSERT INTO BookingActivities (BookingID, ActivityID) VALUES
(5, 1),
(6, 2);

-- Inserting more PackageDestinations
INSERT INTO PackageDestinations (PackageID, DestinationID) VALUES
(5, 5),
(6, 6);

-- Inserting more AgentBookings
INSERT INTO AgentBookings (AgentID, BookingID) VALUES
(1, 5),
(2, 6);

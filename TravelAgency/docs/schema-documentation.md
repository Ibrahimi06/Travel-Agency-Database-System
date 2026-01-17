# Travel Agency Database Schema Documentation

## Overview
The Travel Agency Database is designed to manage and track various aspects of a travel agency, including customers, bookings, packages, payments, reviews, and activities. This documentation provides a detailed description of the database schema, including tables, attributes, and relationships.

## Tables

### 1. Customers
- **Description**: Stores information about customers.
- **Columns**:
  - `CustomerID` (INT, PK): Unique identifier for each customer.
  - `Name` (VARCHAR): Full name of the customer.
  - `Email` (VARCHAR): Email address of the customer.
  - `Phone` (VARCHAR): Contact number of the customer.
  - `CreatedAt` (TIMESTAMP): Date and time when the customer was created.

### 2. Agents
- **Description**: Stores information about travel agents.
- **Columns**:
  - `AgentID` (INT, PK): Unique identifier for each agent.
  - `Name` (VARCHAR): Full name of the agent.
  - `Email` (VARCHAR): Email address of the agent.
  - `Phone` (VARCHAR): Contact number of the agent.
  - `CreatedAt` (TIMESTAMP): Date and time when the agent was created.

### 3. Destinations
- **Description**: Contains information about travel destinations.
- **Columns**:
  - `DestinationID` (INT, PK): Unique identifier for each destination.
  - `Name` (VARCHAR): Name of the destination.
  - `Country` (VARCHAR): Country where the destination is located.
  - `Description` (TEXT): Description of the destination.

### 4. Packages
- **Description**: Stores information about travel packages offered by the agency.
- **Columns**:
  - `PackageID` (INT, PK): Unique identifier for each package.
  - `Name` (VARCHAR): Name of the package.
  - `Price` (DECIMAL): Price of the package.
  - `Description` (TEXT): Description of the package.

### 5. Bookings
- **Description**: Records information about customer bookings.
- **Columns**:
  - `BookingID` (INT, PK): Unique identifier for each booking.
  - `CustomerID` (INT, FK): Foreign key referencing `Customers`.
  - `AgentID` (INT, FK): Foreign key referencing `Agents`.
  - `PackageID` (INT, FK): Foreign key referencing `Packages`.
  - `BookingDate` (DATE): Date when the booking was made.

### 6. Payments
- **Description**: Tracks payments made for bookings.
- **Columns**:
  - `PaymentID` (INT, PK): Unique identifier for each payment.
  - `BookingID` (INT, FK): Foreign key referencing `Bookings`.
  - `Amount` (DECIMAL): Amount paid.
  - `PaymentDate` (DATE): Date when the payment was made.

### 7. Reviews
- **Description**: Contains customer reviews for packages.
- **Columns**:
  - `ReviewID` (INT, PK): Unique identifier for each review.
  - `CustomerID` (INT, FK): Foreign key referencing `Customers`.
  - `PackageID` (INT, FK): Foreign key referencing `Packages`.
  - `Rating` (INT): Rating given by the customer (1-5 scale).
  - `Comment` (TEXT): Review comment provided by the customer.

### 8. Activities
- **Description**: Stores information about activities associated with packages.
- **Columns**:
  - `ActivityID` (INT, PK): Unique identifier for each activity.
  - `Name` (VARCHAR): Name of the activity.
  - `Description` (TEXT): Description of the activity.
  - `Duration` (INT): Duration of the activity in hours.

### 9. BookingActivities
- **Description**: Junction table for many-to-many relationship between Bookings and Activities.
- **Columns**:
  - `BookingID` (INT, FK): Foreign key referencing `Bookings`.
  - `ActivityID` (INT, FK): Foreign key referencing `Activities`.

### 10. PackageDestinations
- **Description**: Junction table for many-to-many relationship between Packages and Destinations.
- **Columns**:
  - `PackageID` (INT, FK): Foreign key referencing `Packages`.
  - `DestinationID` (INT, FK): Foreign key referencing `Destinations`.

### 11. AgentBookings
- **Description**: Junction table for many-to-many relationship between Agents and Bookings.
- **Columns**:
  - `AgentID` (INT, FK): Foreign key referencing `Agents`.
  - `BookingID` (INT, FK): Foreign key referencing `Bookings`.

## Relationships
- **Customers** to **Bookings**: One-to-Many (One customer can have multiple bookings)
- **Agents** to **Bookings**: One-to-Many (One agent can handle multiple bookings)
- **Packages** to **Bookings**: One-to-Many (One package can have multiple bookings)
- **Bookings** to **Payments**: One-to-Many (One booking can have multiple payments)
- **Customers** to **Reviews**: One-to-Many (One customer can leave multiple reviews)
- **Packages** to **Reviews**: One-to-Many (One package can have multiple reviews)
- **Activities** to **BookingActivities**: One-to-Many (One activity can be part of multiple bookings)
- **Bookings** to **BookingActivities**: One-to-Many (One booking can include multiple activities)
- **Destinations** to **PackageDestinations**: One-to-Many (One destination can be linked to multiple packages)
- **Packages** to **PackageDestinations**: One-to-Many (One package can have multiple destinations)
- **Agents** to **AgentBookings**: One-to-Many (One agent can handle multiple bookings)
- **Bookings** to **AgentBookings**: One-to-Many (One booking can be handled by multiple agents)

## Conclusion
This schema documentation provides a comprehensive overview of the travel agency database structure, detailing each table and its relationships. This information is essential for understanding how data is organized and accessed within the database.

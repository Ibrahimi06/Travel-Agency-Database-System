✈️ Travel Agency Database System
1. Introduction

This project presents the design and implementation of a relational database system for a travel agency using PostgreSQL.
The database supports essential business processes such as customer management, booking management, payment tracking, and service evaluation through reviews.

The project is developed for academic and educational purposes, demonstrating the practical application of database design principles, normalization, and SQL querying techniques.

2. Objectives

The primary objectives of this project are:

Design a normalized relational database schema for a travel agency

Define relationships between entities using primary and foreign keys

Enforce data integrity through constraints

Populate the database with representative sample data

Demonstrate data retrieval, aggregation, and analysis using SQL queries

3. Technologies Used

Database Management System: PostgreSQL

Language: SQL

Database Concepts Applied

Relational modeling

Entity relationships

Constraints and validation rules

Indexing

Aggregation and analytical queries

4. Database Schema Description

The database consists of multiple interrelated tables representing real-world entities in a travel agency system.

4.1 Core Tables

Customers – Stores personal and contact information of customers

Agents – Stores information related to travel agents

Destinations – Contains data about travel destinations

Packages – Represents travel packages offered by the agency

Bookings – Records customer bookings for travel packages

Payments – Stores payment details associated with bookings

Reviews – Captures customer feedback and ratings for packages

Activities – Stores activities that can be associated with bookings

4.2 Associative Tables

BookingActivities – Resolves the many-to-many relationship between bookings and activities

PackageDestinations – Resolves the many-to-many relationship between packages and destinations

AgentBookings – Associates agents with bookings

5. Data Integrity and Constraints

To ensure data accuracy and consistency, the following mechanisms are implemented:

Primary Keys for unique identification of records

Foreign Keys to enforce referential integrity

CHECK constraints for:

Valid email formats

Positive monetary values

Valid rating ranges (1–5)

DEFAULT values for timestamp attributes

Indexes to improve query performance on frequently accessed columns

6. Sample Data

The database is populated with sample data representing customers, agents, destinations, packages, bookings, payments, reviews, and activities.

This data enables:

Immediate testing

Validation of constraints

Verification of query correctness

7. SQL Queries and Analysis

A set of SQL queries is included to demonstrate data retrieval, aggregation, and analysis.
The queries cover the following scenarios:

Identification of customers who have made bookings

Counting the number of bookings per customer

Calculation of total revenue generated

Determination of average package ratings

Classification of customers based on spending levels

Identification of inactive customers

Use of subqueries and window functions for advanced analysis

These queries illustrate the practical use of SQL for reporting and decision support.

8. Execution Instructions

To execute this project:

Install PostgreSQL on your local system

Create a new database

Execute the provided SQL script to create tables and constraints

Insert the sample data

Run the provided queries to analyze the database

9. Limitations and Future Enhancements

While the current implementation fulfills its academic objectives, future improvements may include:

Implementation of database views for reporting

Use of stored procedures and triggers

Role-based access control

Integration with an application-level backend

10. Conclusion

This project demonstrates a complete relational database solution for a travel agency scenario.
It applies both fundamental and advanced database concepts in a structured and organized manner, making it suitable for academic evaluation and as a foundation for future system development.

👤 Authors

Xhafer Ibrahimi

Altina Islami

📜 License

This project is developed exclusively for educational and academic use.

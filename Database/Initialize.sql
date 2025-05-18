-- Initialize.sql
-- Script to initialize the GarageApp.PostBin database schema

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS PostBin;
USE PostBin;

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS Requests;
DROP TABLE IF EXISTS Bins;

-- Create Bins table
CREATE TABLE Bins (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Identifier VARCHAR(50) NOT NULL,
    CreatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ExpiresAt TIMESTAMP NULL,
    
    -- Create unique index on Identifier
    CONSTRAINT UQ_Bins_Identifier UNIQUE (Identifier)
);

-- Create Requests table
CREATE TABLE Requests (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    BinId INT NOT NULL,
    Method VARCHAR(10) NOT NULL,
    Path TEXT NOT NULL,
    Headers JSON NOT NULL,
    Body MEDIUMTEXT NULL,
    IpAddress VARCHAR(45) NOT NULL, -- IPv4 and IPv6 support
    ReceivedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraint
    CONSTRAINT FK_Requests_Bins FOREIGN KEY (BinId) REFERENCES Bins(Id) ON DELETE CASCADE,
    
    -- Create indexes for efficient queries
    INDEX IX_Requests_BinId (BinId),
    INDEX IX_Requests_ReceivedAt (ReceivedAt)
);

-- Add a comment explaining the schema
/*
Schema Notes:
- Bins table stores information about each bin with a unique identifier
- Requests table stores all captured HTTP requests associated with bins
- JSON data type is used for storing request headers efficiently
- Indexes are created for frequently queried columns
- Foreign key ensures referential integrity between Requests and Bins tables
- IPv6 addresses can be up to 45 characters long (with colons)
*/

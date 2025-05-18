# Database Scripts for GarageApp.PostBin

This directory contains SQL scripts for setting up and maintaining the PostBin database.

## Scripts

- **Initialize.sql**: Creates the initial database schema with all required tables and indexes
- **Migrations.sql**: Template for future migrations and schema updates

## Schema Overview

### Bins Table
- Stores information about each request bin
- Contains a unique identifier for public access
- Tracks creation and expiration timestamps

### Requests Table
- Stores all captured HTTP requests
- Links to the associated bin via foreign key
- Stores complete request details (method, path, headers, body, etc.)
- Uses MySQL's native JSON type for efficient header storage

## How to Use

### Initial Setup

To create the database and all required tables, run:

```bash
mysql -u <username> -p < Initialize.sql
```

### Applied Migrations

For future schema updates, migrations can be added to Migrations.sql or separated into versioned files.

## Notes

- The schema is optimized for efficient querying and retrieval
- Indexes are created on frequently queried columns
- JSON columns allow flexible header storage while maintaining query performance
- Foreign keys ensure data integrity between related tables

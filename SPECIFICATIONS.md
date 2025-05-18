## Project Technical Specification

## General Informations
- Project Name: GarageApp.PostBin

### Core Technology Stack

* **Framework**: .NET 8 Minimal API
* **Language**: C# 12
* **Database**: MySQL 8.x
* **Data Access Layer**: Dapper (micro ORM)

---

## Functional Requirements

### HTTP Request Capture

* Accept and capture HTTP requests for all HTTP methods:

  * `GET`, `POST`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`, `HEAD`, etc.
* Persist comprehensive request information:

  * HTTP Method
  * URL Path and Query Parameters
  * Request Headers
  * Request Body (raw payload)
  * Client IP Address
  * Request Timestamp (UTC)

### Bin Management

* Auto-generate short, unique, user-friendly bin identifiers.
* Allow configurable bin expiration periods (default: 24 hours).
* Retrieve bin details using their unique identifier.

### Request Inspection API

* Provide endpoints to list requests stored in a bin.
* Provide detailed access to individual request data.
* Support pagination for performance and efficiency.

---

## Database Schema (MySQL)

**Tables**

* `Bins`

  * `Id` (Primary Key, auto-increment)
  * `Identifier` (varchar, unique, short URL slug)
  * `CreatedAt` (timestamp, UTC)
  * `ExpiresAt` (timestamp, UTC, nullable)

* `Requests`

  * `Id` (Primary Key, auto-increment)
  * `BinId` (Foreign Key → Bins.Id)
  * `Method` (varchar)
  * `Path` (text)
  * `Headers` (JSON)
  * `Body` (MEDIUMTEXT)
  * `IpAddress` (varchar)
  * `ReceivedAt` (timestamp, UTC)

**Indexes**

* `Bins.Identifier` (UNIQUE)
* `Requests.BinId`
* `Requests.ReceivedAt`

---

## Technical Considerations

* **Dapper** will directly execute optimized SQL queries for efficient database interactions.
* JSON columns (`Headers`) stored efficiently in MySQL’s native JSON data type.
* Database schema designed for fast querying and retrieval.

---

## Non-Functional Requirements

* Fast, asynchronous HTTP handling.
* Clean and maintainable minimal API endpoints.
* Robust input validation and clear error handling.
* Efficient memory and resource utilization.


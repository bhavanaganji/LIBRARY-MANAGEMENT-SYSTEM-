# 📚 Library Management System

A relational database project designed to efficiently manage and organize key operations of a library using MySQL and real-world datasets.

## 📌 Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Database Schema](#database-schema)
- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Sample Queries](#sample-queries)
- [Author](#author)

## 🧾 Overview
This Library Management System is a SQL-based project developed to handle the internal operations of a library. It includes entities such as books, borrowers, loans, authors, and library branches. The database is built by importing data from Excel files and supports various reporting and query functions for real-time information.

## ⚙️ Technologies Used
- **Database:** MySQL
- **Data Input:** Microsoft Excel (7 input files)
- **Language:** SQL
- **Tool:** MySQL Workbench / phpMyAdmin

## 🗂️ Database Schema

The database contains the following core tables:

- `Publisher`
- `Book`
- `Borrower`
- `LibraryBranch`
- `Book_Copies`
- `Book_Loans`
- `Book_Authors`

Each table is connected with appropriate foreign keys, ensuring data integrity and normalization.

## 🌟 Features

- Import of data from Excel files into MySQL tables
- Advanced SQL queries for:
  - Book availability
  - Borrower loan history
  - Overdue books
  - Author-specific reports
- Use of SQL `JOIN`, `GROUP BY`, and `SUBQUERY`
- Structured schema design with normalized relationships
- Real-world use case handling (e.g., loan due dates, book tracking)



# 📘 chommies SQL Simulation

A simple Java console application that simulates university administrative operations (course management, student registration, etc.) through a menu-driven interface connected to a MySQL database.

---

## 🚀 Features

- ✅ Add a **course convenor** to the database  
- ✅ Update the **lecture venue** for a course  
- ✅ Deregister a **student** from the system  
- ✅ View students currently **studying** and export the results to a `.txt` file  
- ✅ Console-based user interface

---

## 🛠️ Requirements

- Java 8 or higher  
- MySQL Server  
- JDBC driver (MySQL Connector/J)  
- A MySQL database named `chommies`

---

## 🧱 Sample Database Schema

Make sure your `chommies` database includes the following tables:

```sql
CREATE TABLE course_convenor (
  convenor_number INT PRIMARY KEY,
  convenor_name VARCHAR(100),
  convenor_surname VARCHAR(100)
);

CREATE TABLE course (
  course_code VARCHAR(10) PRIMARY KEY,
  lecture_venues VARCHAR(100)
);

CREATE TABLE course_list (
  course_list_id INT PRIMARY KEY AUTO_INCREMENT,
  degree_code VARCHAR(10),
  status VARCHAR(20) -- e.g., 'Ongoing', 'Completed'
);

CREATE TABLE students (
  student_number VARCHAR(20) PRIMARY KEY,
  student_name VARCHAR(100),
  course_list_id INT,
  FOREIGN KEY (course_list_id) REFERENCES course_list(course_list_id)
);
```
Getting copy of the files
```
git clone https://github.com/yourusername/chommies-sql-simulation.git
cd chommies-sql-simulation
```

Edit the chommies.java file and update these lines with your MySQL credentials:
```
private static final String URL = "jdbc:mysql://localhost:3306/chommies?...";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";
```

Run applications

```
javac chommies.java
java chommies
```

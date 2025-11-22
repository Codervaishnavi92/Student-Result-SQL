# Student Result Management System (SQL Project)

## Description
This project is created using **SQL Server Management Studio (SSMS)**.  
It manages Students, Courses, and their Results using relational database concepts.

The project includes:
- Tables (Students, Courses, Results)
- Primary & Foreign Keys
- Sample Data (for testing)
- View (`StudentFullReport`)
- Stored Procedure (`GetStudentReport`)

## Database Tables
1. **Students**
   - student_id (PK)
   - name  
   - email  
   - semester  

2. **Courses**
   - course_id (PK)
   - course_name  
   - credits  

3. **Results**
   - result_id (PK)
   - student_id (FK)  
   - course_id (FK)  
   - marks  
   - grade  

## How to Run
1. Open **SSMS**
2. Create a new database or use the script directly
3. Copy–paste the `.sql` file contents
4. Run the script
5. Test the project:
   ```sql
   SELECT * FROM StudentFullReport;
   EXEC GetStudentReport @stu_id = 1;

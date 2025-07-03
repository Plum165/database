import java.sql.*;
import java.util.Scanner;
import java.nio.file.Files;
import java.nio.file.Paths;

public class chommies {

   // JDBC URL, username, and password of MySQL server
   private static final String URL = "jdbc:mysql://localhost:3306/chommies?useLegacyDatetimeCode=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF8&zeroDateTimeBehavior=convertToNull&useOldAliasMetadataBehavior=true";
   private static final String USER = "root";
   private static final String PASSWORD = "root";

   public static void main(String[] args) {
      try {
         // Establish a connection to the database
         Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
         System.out.println("Welcome to chommies SQL Simulation");
         Scanner input = new Scanner(System.in);
         boolean flag = true;
         while (flag) {
            System.out.println("Pick a number of:\n1) Adding a course convenor details\n2) Change lecture venue\n3) Deregistering a student(testing)\n4) Students who currently studying and details\n5) Close program");
            int num = input.nextInt();
            input.nextLine();
            switch (num) {
               case 1:
                  // Adding a new convenor to the table
                  System.out.println("Convenor unique number: ");
                  int cnum = input.nextInt();
                  input.nextLine();
                  System.out.println("Convenor name: ");
                  String cname = input.nextLine();
                  System.out.println("Convenor surname: ");
                  String csurname = input.nextLine();
                  String SQL1 = "INSERT INTO course_convenor(convenor_number, convenor_name, convenor_surname) VALUES (?, ?, ?)";
                  try (PreparedStatement statement = conn.prepareStatement(SQL1)) {
                     statement.setInt(1, cnum);
                     statement.setString(2, cname);
                     statement.setString(3, csurname);
                     statement.executeUpdate();
                     System.out.println("Convenor added successfully.");
                  } catch (SQLException ex) {
                     ex.printStackTrace();
                  }
                  break;

               case 2:
                  // Changing a lecture venue
                  System.out.println("New Lecture Venue: ");
                  String venue = input.nextLine();
                  System.out.println("Course that changed its venue: ");
                  String course = input.nextLine();
                  String SQL2 = "UPDATE course SET lecture_venues = ? WHERE course_code = ?";
                  try (PreparedStatement statement = conn.prepareStatement(SQL2)) {
                     statement.setString(1, venue);
                     statement.setString(2, course);
                     int rowsUpdated = statement.executeUpdate();
                     if (rowsUpdated > 0) {
                        System.out.println("Venue updated successfully.");
                     } else {
                        System.out.println("No courses found matching the provided course codes.");
                     }
                  } catch (SQLException ex) {
                     ex.printStackTrace();
                  }
                  break;

               case 3:
                  // Deleting a deregistered student
                  String SQL3 = "DELETE FROM students WHERE student_number = ?";
                  try (PreparedStatement statement = conn.prepareStatement(SQL3)) {
                     statement.setString(1, "PRTJAM002");
                     int rowsDeleted = statement.executeUpdate();
                     if (rowsDeleted > 0) {
                        System.out.println("Student deleted successfully.");
                     } else {
                        System.out.println("No student found with the provided student number.");
                     }
                  } catch (SQLException ex) {
                     ex.printStackTrace();
                  }
                  break;

               case 4:
                  // Students who are currently studying and details (with export)
                  String SQL4 = "SELECT DISTINCT student_number, student_name, degree_code " +
                                "FROM students, course_list " +
                                "WHERE students.course_list_id = course_list.course_list_id AND course_list.status = ?";
                  try (PreparedStatement statement = conn.prepareStatement(SQL4)) {
                     statement.setString(1, "Ongoing");
                     ResultSet rs = statement.executeQuery();
                     System.out.println("Students that are currently studying: ");

                     StringBuilder sb = new StringBuilder();
                     while (rs.next()) {
                        String stu_num = rs.getString("student_number");
                        String stu_name = rs.getString("student_name");
                        String degree = rs.getString("degree_code");

                        System.out.println("Student Number: " + stu_num);
                        System.out.println("Student Name: " + stu_name);
                        System.out.println("Degree studying: " + degree);

                        sb.append("Student Number: ").append(stu_num).append("\n");
                        sb.append("Student Name: ").append(stu_name).append("\n");
                        sb.append("Degree studying: ").append(degree).append("\n\n");
                     }

                     Files.write(Paths.get("students_currently_studying.txt"), sb.toString().getBytes());
                     System.out.println("Results saved to 'students_currently_studying.txt'.");

                     rs.close();
                  } catch (Exception ex) {
                     ex.printStackTrace();
                  }
                  break;

               case 5:
                  flag = false;
                  break;
            }
         }
         // close connection
         conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}

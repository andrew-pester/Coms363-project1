import java.sql.*;

public class DropTables {
    public static Connection connect = null;

    public static Statement stmt = null;

    public static void main(String[] args) throws SQLException {
        createConnection();
        dropTables();
    }

    public static void createConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // Set up connection parameters
            String userName = "[username]";
            String password = "[password]";
            String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";

            // Set up connection
            connect = DriverManager.getConnection(dbServer, userName, password);

            stmt = connect.createStatement();
            // this works now
        } catch (Exception e) {

        }
    }

    public static void dropTables() throws SQLException {
        stmt.execute("SET FOREIGN_KEY_CHECKS = 0");
        String sql = "DROP TABLE minor;";
        stmt.execute(sql);
        sql = "DROP TABLE major;";
        stmt.execute(sql);
        sql = "DROP TABLE register;";
        stmt.execute(sql);
        sql = "DROP TABLE degrees;";
        stmt.execute(sql);
        sql = "DROP TABLE students;";
        stmt.execute(sql);
        sql = "DROP TABLE courses;";
        stmt.execute(sql);
        sql = "DROP TABLE departments;";
        stmt.execute(sql);
        stmt.execute("SET FOREIGN_KEY_CHECKS = 1");

    }
}

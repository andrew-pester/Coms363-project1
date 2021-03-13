import java.sql.*;

public class ModifyRecords {
    public static Connection connect = null;

    public static Statement stmt = null;

    public static void main(String[] args) throws SQLException {
        createConnection();
        modifyRecords();

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

    public static void modifyRecords() throws SQLException {
        String sql = "UPDATE students SET name = 'Scott' WHERE ssn =  746897816;";
        stmt.execute(sql);
        sql = "UPDATE major SET name = 'Computer Science', level = 'MS' WHERE snum = (select snum from students WHERE ssn = 746897816);";
        stmt.execute(sql);
        sql = "DELETE FROM register WHERE regtime = 'Spring2021';";
        stmt.execute(sql);

    }
}

import java.sql.*;

public class Query {
    public static Connection connect = null;

    public static Statement stmt = null;

    public static void main(String[] args) throws SQLException {
        createConnection();
        query();

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

    public static void query() throws SQLException {

        ResultSet rs = stmt.executeQuery("SELECT snum, ssn FROM students where name = 'Becky';");
        printQuery(rs);
        System.out.println();
        rs = stmt.executeQuery(
                "SELECT name, level FROM major WHERE snum = (SELECT snum from students where ssn = 123097834);");
        printQuery(rs);
        System.out.println();
        rs = stmt.executeQuery(
                "SELECT name FROM courses WHERE department_code = (select code from departments where name = 'Computer Science');");
        printQuery(rs);
        System.out.println();
        rs = stmt.executeQuery(
                "Select name, level from degrees where department_code = (select code from departments where name = 'Computer Science');");
        printQuery(rs);
        System.out.println();
        rs = stmt.executeQuery("select s.name from students s inner join minor m on m.snum = s.snum;");
        printQuery(rs);
    }

    public static void printQuery(ResultSet rs) throws SQLException {
        ResultSetMetaData rsmd = rs.getMetaData();
        int numCol = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= numCol; i++) {
                if (i > 1)
                    System.out.print(", ");
                String col = rs.getString(i);
                System.out.print(rsmd.getColumnName(i) + ": " + col);
            }
            System.out.println();
        }

    }
}

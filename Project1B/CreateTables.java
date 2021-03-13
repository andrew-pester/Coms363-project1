import java.sql.*;

public class CreateTables {

    public static Connection connect = null;
    public static Statement stmt = null;

    public static void main(String[] args) throws SQLException {
        createConnection();
        createStudent();
        createDepartments();
        createDegrees();
        createCourses();
        createRegister();
        createMajor();
        createMinor();

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

    public static void createStudent() throws SQLException {
        String sql = "CREATE TABLE students(" + "snum int," + "ssn int," + "name varchar(10)," + "gender varchar(1),"
                + "dob date," + "c_addr varchar(20)," + "c_phone varchar(10)," + "p_addr varchar(20),"
                + "p_phone varchar(10)," + "PRIMARY KEY (ssn)," + "UNIQUE (snum)" + ");";
        stmt.execute(sql);
    }

    public static void createDepartments() throws SQLException {
        String sql = "CREATE TABLE departments(" + "code int," + "name varchar(50)," + "phone varchar(10),"
                + "college varchar(20)," + "PRIMARY KEY(code)," + "UNIQUE (name)" + ");";
        stmt.execute(sql);

    }

    public static void createDegrees() throws SQLException {
        String sql = "CREATE TABLE degrees (" + "name varchar(50)," + "level varchar(5)," + "department_code int,"
                + "PRIMARY KEY (name,level)," + "FOREIGN KEY (department_code) REFERENCES departments(code)"
                + "ON DELETE CASCADE);";
        stmt.execute(sql);

    }

    public static void createCourses() throws SQLException {
        String sql = "CREATE TABLE courses (" + "number int," + "name varchar(50)," + "description varchar(50),"
                + "credithours int," + "level varchar(20)," + "department_code int," + "PRIMARY KEY (number),"
                + "UNIQUE (name)," + "FOREIGN KEY (department_code) REFERENCES departments(code)"
                + "ON DELETE CASCADE);";
        stmt.execute(sql);

    }

    public static void createRegister() throws SQLException {
        String sql = "CREATE TABLE register(" + "snum int," + "course_number int," + "regtime varchar(20),"
                + "grade int," + "PRIMARY KEY(snum, course_number),"
                + "FOREIGN KEY(snum) REFERENCES students(snum) ON DELETE CASCADE,"
                + "FOREIGN KEY(course_number) REFERENCES courses(number)" + "ON DELETE CASCADE);";
        stmt.execute(sql);
    }

    public static void createMajor() throws SQLException {
        String sql = "CREATE TABLE major(" + "snum int," + "name varchar(50)," + "level varchar(5),"
                + "PRIMARY KEY(snum, name, level)," + "FOREIGN KEY(snum) REFERENCES students(snum) ON DELETE CASCADE,"
                + "FOREIGN KEY(name, level) REFERENCES degrees(name, level)" + "ON DELETE CASCADE);";
        stmt.execute(sql);

    }

    public static void createMinor() throws SQLException {
        String sql = "CREATE TABLE minor(" + "snum int," + "name varchar(50)," + "level varchar(5),"
                + "PRIMARY KEY(snum, name, level)," + "FOREIGN KEY(snum) REFERENCES students(snum) ON DELETE CASCADE,"
                + "FOREIGN KEY(name, level) REFERENCES degrees(name, level)" + "ON DELETE CASCADE);";
        stmt.execute(sql);

    }

}
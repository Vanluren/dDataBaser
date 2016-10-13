import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

/**
 * Created by villadsvalur on 13/10/2016.
 */
public class ReadUnCommited {
    public static void main(String args[]){
        Connection connection;
        try {
            String url = "jdbc:mysql://localhost:8889";
            String userId = "root";
            String password = "root";
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            connection = DriverManager.getConnection(url, userId,password);
            connection.setAutoCommit(false);
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Rooms");
                while (resultSet.next()){
                    System.out.println(resultSet.getString(1) + " " + resultSet.getString(2));
                    statement.close();
                    connection.close();
                }


        }catch (Exception e){e.printStackTrace();}

    }
}

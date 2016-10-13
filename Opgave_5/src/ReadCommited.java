/**
 * Created by villadsvalur on 10/10/2016.
 */
import java.sql.*;
import java.util.*;

public class ReadCommited {
    public static void main(String args[]){
        Connection connection;
        try {
            String url = "jdbc:mysql://localhost:8889/rooms_participants";
            String userId = "root";
            String password = "root";
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            connection = DriverManager.getConnection(url, userId,password);
            connection.setAutoCommit(false);
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);

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

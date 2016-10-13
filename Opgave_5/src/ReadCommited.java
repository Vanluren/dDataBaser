/**
 * Created by villadsvalur on 10/10/2016.
 */
import java.sql.*;
import java.util.*;

public class ReadCommited {
    public static void main(String args[]){
        Connection connection = null;
        Properties info = new Properties( );
        info.put( "user", "root" );
        info.put( "password", "root" );



        try {
            String url = "jdbc:mysql://localhost:8889";
            connection = DriverManager.getConnection(url, info);
            connection.setAutoCommit(false);
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);




        }catch (Exception e){e.printStackTrace();}

    }
}

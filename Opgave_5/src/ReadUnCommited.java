import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * Created by villadsvalur on 13/10/2016.
 */
public class ReadUnCommited {
    public static void main(String args[]){
        Connection connection = null;
        Properties info = new Properties( );
        info.put( "user", "root" );
        info.put( "password", "root" );



        try {
            String url = "jdbc:mysql://localhost:8889";
            connection = DriverManager.getConnection(url, info);
            connection.setAutoCommit(false);
            connection.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);




        }catch (Exception e){e.printStackTrace();}

    }
}

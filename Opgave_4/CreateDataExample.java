/***
* BULK INSERT WITH:
* LOAD DATA INFILE 'C:/DataSet.csv'
* INTO TABLE test.LargeDataSet
* FIELDS TERMINATED BY ','
* LINES TERMINATED BY '\r\n';
***/
import java.io.FileWriter;
import java.io.IOException;
import java.security.SecureRandom;
import java.math.BigInteger;

public class CreateDataExample
{
	private static SecureRandom random = new SecureRandom();
	public static void main(String[] args) {
		try{
			FileWriter fwriter = new FileWriter("DataSet_Persons.csv");
			for(int i=1;i<=2000000;i++) {
				fwriter.write(i + "," + new BigInteger(130, random).toString(32) + "\r\n");
			}
			fwriter.close();	
		}
		catch(IOException e){
			System.out.println("An error occurred: " + e);
		}
	}  
}

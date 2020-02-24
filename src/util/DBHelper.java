package util;

import java.sql.*;

import com.mysql.jdbc.Connection;

public class DBHelper {
   private static final String driver="com.mysql.jdbc.Driver";//数据库驱动
   //连接数据库的URL地址
   private static final String url="jdbc:mysql://106.14.209.83:3306/perfume?useUnicode=true&chacterEncoding=UTF";
   private static final String username="perfume_reader";//数据库的用户名
   private static final String password="perfume@123";//数据库的密码
   private static java.sql.Connection conn=null;
   //静态代码块负责加载驱动
   static
   {
	   try {
		Class.forName(driver);
	   } 
	   catch (Exception ex) 
	   {
		ex.printStackTrace();
	   }
   }
   //单例模式返回数据库连接对象
   public static java.sql.Connection getConnection() throws Exception
   {
	   if(conn==null)
	   {
		   conn=DriverManager.getConnection(url,username,password);
		   return conn;
	   }
	   return conn;
   }
   public static void main(String[] args)
   {
	   try
	   {
		   java.sql.Connection conn=DBHelper.getConnection();
		   if(conn!=null)
		   {
			   System.out.println("数据库连接正常！");
		   }
		   else
		   {
			   System.out.println("数据库连接异常！");
		   }
	   }
	   catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
}

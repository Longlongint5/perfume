package util;

import java.sql.*;

import com.mysql.jdbc.Connection;

public class DBHelper {
   private static final String driver="com.mysql.jdbc.Driver";//���ݿ�����
   //�������ݿ��URL��ַ
   private static final String url="jdbc:mysql://106.14.209.83:3306/perfume?useUnicode=true&chacterEncoding=UTF";
   private static final String username="perfume_reader";//���ݿ���û���
   private static final String password="perfume@123";//���ݿ������
   private static java.sql.Connection conn=null;
   //��̬����鸺���������
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
   //����ģʽ�������ݿ����Ӷ���
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
			   System.out.println("���ݿ�����������");
		   }
		   else
		   {
			   System.out.println("���ݿ������쳣��");
		   }
	   }
	   catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
}

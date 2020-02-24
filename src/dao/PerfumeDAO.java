package dao;
import java.util.*;
import java.lang.*;
import java.sql.*;
import entity.*;
import util.*;
//商品的业务逻辑类
public class PerfumeDAO {
	// 获得所有的商品信息
		public ArrayList<Perfume> getAllItems() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			ArrayList<Perfume> list = new ArrayList<Perfume>();//商品集合
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from perfume;";//SQL语句
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Perfume perfume = new Perfume();
					perfume.setId(rs.getInt("id"));
					perfume.setName(rs.getString("name"));
					perfume.setEngname(rs.getString("engname"));
					perfume.setBrand(rs.getString("brand"));
					perfume.setPrice(rs.getDouble("price"));
					perfume.setPhoto(rs.getString("photo"));
					perfume.setDesc(rs.getString("desc"));
					perfume.setStock(rs.getInt("stock"));
					list.add(perfume);//把一个商品加入集合
				}
				return list;//返回集合
			} 
			catch (Exception ex) 
			{
				ex.printStackTrace();
				return null;
			} 
			finally 
			{
				//释放数据集对象
				if (rs != null) 
				{
					try {
						rs.close();
						rs = null;
					} 
					catch (Exception ex) 
					{
						ex.printStackTrace();
					}
				}
				//释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} 
					catch (Exception ex) 
					{
						ex.printStackTrace();
					}
				}
			}
		}
		//根据商品编号获得商品资料
		public Perfume getPerfumeById(int id)
		{
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from perfume where id=?;";//SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1,id);
				rs = stmt.executeQuery();
				if(rs.next()) 
				{
					Perfume perfume = new Perfume();
					perfume.setId(rs.getInt("id"));
					perfume.setName(rs.getString("name"));
					perfume.setEngname(rs.getString("engname"));
					perfume.setBrand(rs.getString("brand"));
					perfume.setPrice(rs.getDouble("price"));
					perfume.setPhoto(rs.getString("photo"));
					perfume.setDesc(rs.getString("desc"));
					perfume.setStock(rs.getInt("stock"));
					return perfume;
				}
				else 
				{
					return null;
				}
			} 
			catch (Exception ex)
			{
				ex.printStackTrace();
				return null;
			} 
			finally 
			{
				//释放数据集对象
				if (rs != null) 
				{
					try 
					{
						rs.close();
						rs = null;
					} 
					catch (Exception ex) 
					{
						ex.printStackTrace();
					}
				}
				//释放语句对象
				if (stmt != null) 
				{
					try 
					{
						stmt.close();
						stmt = null;
					} 
					catch (Exception ex) 
					{
						ex.printStackTrace();
					}
				}
			}
		}
}

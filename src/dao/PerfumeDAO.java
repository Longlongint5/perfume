package dao;
import java.util.*;
import java.lang.*;
import java.sql.*;
import entity.*;
import util.*;
//��Ʒ��ҵ���߼���
public class PerfumeDAO {
	// ������е���Ʒ��Ϣ
		public ArrayList<Perfume> getAllItems() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			ArrayList<Perfume> list = new ArrayList<Perfume>();//��Ʒ����
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from perfume;";//SQL���
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
					list.add(perfume);//��һ����Ʒ���뼯��
				}
				return list;//���ؼ���
			} 
			catch (Exception ex) 
			{
				ex.printStackTrace();
				return null;
			} 
			finally 
			{
				//�ͷ����ݼ�����
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
				//�ͷ�������
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
		//������Ʒ��Ż����Ʒ����
		public Perfume getPerfumeById(int id)
		{
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from perfume where id=?;";//SQL���
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
				//�ͷ����ݼ�����
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
				//�ͷ�������
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

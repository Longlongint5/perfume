package entity;
//���ﳵ��

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.tomcat.util.collections.ManagedConcurrentWeakHashMap;

public class Cart {
    //������Ʒ�ļ���
	private HashMap<Perfume, Integer> goods;
	//���ﳵ���ܽ��
	private double totalPrice;
	//���췽��
	public Cart()
	{
		goods=new HashMap<Perfume, Integer>();
		totalPrice=0.0;
	}
	public HashMap<Perfume, Integer> getGoods() {
		return goods;
	}
	public void setGoods(HashMap<Perfume, Integer> goods) {
		this.goods = goods;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	//�����Ʒ�����ﳵ
	public boolean addGoodsInCart(Perfume perfume,int number)
	{
		if(goods.containsKey(perfume))
		{
			goods.put(perfume, goods.get(perfume)+number);
		}
		else
		{
			goods.put(perfume, number);	
		}
		calTotalPrice(); //���¼��㹺�ﳵ���ܽ��
		return true;
	}
	//ɾ����Ʒ
	public boolean removeGoodsFromCart(Perfume perfume)
	{
		goods.remove(perfume);
		calTotalPrice();//���¼��㹺�ﳵ���ܽ��
		return true;
	}
	//ͳ�ƹ��ﳵ���ܽ��
	public double calTotalPrice()
	{
		double sum=0.0;
		Set<Perfume> keys=goods.keySet();//��ü��ļ���
		Iterator<Perfume> it=keys.iterator();
		while(it.hasNext())
		{
			Perfume i=it.next();
			sum+=i.getPrice()*goods.get(i);
		}
		this.setTotalPrice(sum);//���ù��ﳵ���ܽ��
		return this.getTotalPrice();
	}
	public int getnumbyid(int id)
	{
		Set<Perfume> keys=goods.keySet();//��ü��ļ���
		Iterator<Perfume> it=keys.iterator();
		while(it.hasNext())
		{
			Perfume i=it.next();
			if(i.getId()==id)
			{
				return goods.get(i);
			}
		}
		return 0;
	}
	public int getlength()
	{
		int sum=0;
		Set<Perfume> keys=goods.keySet();//��ü��ļ���
		Iterator<Perfume> it=keys.iterator();
		while(it.hasNext())
		{
			Perfume i=it.next();
			sum++;
		}
		return sum;
	}
}

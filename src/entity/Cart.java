package entity;
//购物车类

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.tomcat.util.collections.ManagedConcurrentWeakHashMap;

public class Cart {
    //购买商品的集合
	private HashMap<Perfume, Integer> goods;
	//购物车的总金额
	private double totalPrice;
	//构造方法
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
	//添加商品进购物车
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
		calTotalPrice(); //重新计算购物车的总金额
		return true;
	}
	//删除商品
	public boolean removeGoodsFromCart(Perfume perfume)
	{
		goods.remove(perfume);
		calTotalPrice();//重新计算购物车的总金额
		return true;
	}
	//统计购物车的总金额
	public double calTotalPrice()
	{
		double sum=0.0;
		Set<Perfume> keys=goods.keySet();//获得键的集合
		Iterator<Perfume> it=keys.iterator();
		while(it.hasNext())
		{
			Perfume i=it.next();
			sum+=i.getPrice()*goods.get(i);
		}
		this.setTotalPrice(sum);//设置购物车的总金额
		return this.getTotalPrice();
	}
	public int getnumbyid(int id)
	{
		Set<Perfume> keys=goods.keySet();//获得键的集合
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
		Set<Perfume> keys=goods.keySet();//获得键的集合
		Iterator<Perfume> it=keys.iterator();
		while(it.hasNext())
		{
			Perfume i=it.next();
			sum++;
		}
		return sum;
	}
}

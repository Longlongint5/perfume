package entity;

public class Perfume {
	private int id;//��Ʒ��� 
    private String name;//������
    private String engname;//Ӣ����
    private String brand;//Ʒ��
    private double price;//�۸�
    private String photo;//��Ƭ
    private String desc;//����
    private int stock; //���
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEngname() {
		return engname;
	}
	public void setEngname(String engname) {
		this.engname = engname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getId()+this.getName().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof Perfume)
		{
			Perfume i = (Perfume)obj;
			if(this.getId()==i.getId()&&this.getName().equals(i.getName()))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	public String toString()
	{
		return "��Ʒ��ţ�"+this.getId()+",��Ʒ���ƣ�"+this.getName();
	}
}

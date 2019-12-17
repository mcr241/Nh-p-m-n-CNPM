package model;

import java.io.Serializable;

import tools.Converter;

public class Product implements Serializable {
	private int id;
	private String name;
	private String des;
	private String des2;

	private long price;// do vi la K
	private int sale; // so phan tram muon giam
	private int quantity;

	private String image;
	private String thumbImg;
	
	private Category category;// cate_id
	private Manufacturer manufacturer;

	public Product() {
		super();
	}

	public Product(int id, String name, long price, String image, String des, Category category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.des = des;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getDes2() {
		return des2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
	
	public void setDes2(String des2) {
		this.des2 = des2;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getPriceFormat() {
		 return Converter.convertToStandardPrice(getMainPrice());
	}

	public String getPrePriceFormat() {
		return Converter.convertToStandardPrice(getExactPrice());
	}
	
	public String getPriceFormat(int quantity) {
		return Converter.convertToStandardPrice(getMainPrice()*quantity);
	}

	public long getExactPrice() {
		return getPrice() * 1000;
	}
	public long getMainPrice() {
		if(getSale() == 0)
			return getExactPrice();
		else
			return getPrice()*(100-getSale())*10;
	}

	public static void main(String[] args) {
	}

}

package controller.listcontrol;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;

import model.Product;
import tools.SortProduct;

public class ProductFilter {
	String sortType;

	public ProductFilter(String sortType) {
		this.sortType = sortType;
	}
	
	public ProductFilter() {
		// TODO Auto-generated constructor stub
	}

	public void sort(List<Product> products) {
		if (sortType.equals("increPrice")) {
			SortProduct.sortByIncreasePrice(products);
		}
		if (sortType.equals("decrePrice")) {
			System.out.println(sortType);
			SortProduct.sortByDecreasePrice(products);
		}
		if (sortType.equals("decreSale")) {
			System.out.println(sortType);
			SortProduct.sortByDecreaseSale(products);
		}
	}

	public List<Product> inteval(String interval, List<Product> products) {
		List<Product> list = new ArrayList<>();
		if (interval.equals("1")) {
			for(Product p: products) {
				if(p.getMainPrice() <= 5000000)
					list.add(p);
			}
		}
		if (interval.equals("2")) {
			for(Product p: products) {
				if(p.getMainPrice() > 5000000 && p.getMainPrice() <= 15000000)
					list.add(p);
			}
		}
		if (interval.equals("3")) {
			for(Product p: products) {
				if(p.getMainPrice() > 15000000 && p.getMainPrice() <= 30000000)
					list.add(p);
			}
		}
		if (interval.equals("4")) {
			for(Product p: products) {
				if(p.getMainPrice() > 3000000)
					list.add(p);
			}
		}
		return list;
		
	}
	
	public List<Product> getSubProduct(List<Product> productList, int noOfProducts) {
		
		if(noOfProducts>=productList.size()) {
			return productList;
		}
		else
			return productList.subList(0, noOfProducts);
	}
	
	
}

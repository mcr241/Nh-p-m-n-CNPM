package tools;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;


import model.Product;

public class SortProduct {
	public final static int INCREASE_PRICE = 1;
	public final static int DECREASE_PRICE = 2;
	public final static int DECREASE_SALE = 3;
	
	public static List<Product> sortByIncreasePrice(List<Product> products){
		Collections.sort(products, new Comparation(INCREASE_PRICE));
		return products;
	}
	public static List<Product> sortByDecreasePrice(List<Product> products){
		Collections.sort(products, new Comparation(DECREASE_PRICE));
		return products;
	}
	public static List<Product> sortByDecreaseSale(List<Product> products){
		Collections.sort(products, new Comparation(DECREASE_SALE));
		return products;
	}
}

class Comparation extends SortProduct implements Comparator<Product>{

	public int compareType = 1;
	
	public Comparation(int compareType) {
		this.compareType = compareType;
	}
	
	@Override
	public int compare(Product o1, Product o2) {
		switch (compareType) {
		case INCREASE_PRICE:
			return (int) (o1.getMainPrice() - o2.getMainPrice());
		case DECREASE_PRICE:
			return (int) (-o1.getMainPrice() + o2.getMainPrice());
		case DECREASE_SALE:
			return (int) (-o1.getSale() + o2.getSale());
		default:
			return 1;
		}
		
	}
	
}

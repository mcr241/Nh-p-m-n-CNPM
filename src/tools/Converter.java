package tools;

import java.util.Enumeration;
import java.util.Map;


public class Converter {
	public static String convertToStandardPrice(long priceT) {
		long price = priceT;
		String priceTemp = "" + price;
		int j = 0;
		for (int i = priceTemp.length() - 1; i >= 0; i--) {
			if (j % 3 == 0 && j > 0) {
				priceTemp = priceTemp.substring(0, i + 1) + '.' + priceTemp.substring(i + 1);
				j = 0;
			}
			++j;
		}
		return priceTemp;
	}

	public static String buildUrlFromAttri(Map<String, String[]> map) {
		String childURL = "";
		String sort="";
		String pInteval="";
		
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if (!entry.getKey().equals("page")) {
				if(entry.getKey().equals("sort")) {
					sort = ('&' + entry.getKey() + '=' + entry.getValue()[entry.getValue().length-1]);
				}else if (entry.getKey().equals("interval")) {
					pInteval = ('&' + entry.getKey() + '=' + entry.getValue()[entry.getValue().length-1]);
				}else {
					childURL += ('&' + entry.getKey() + '=' + entry.getValue()[entry.getValue().length-1]);
				}
				
			}
		}

		if (childURL.length() > 0) {
			childURL = '?' + childURL.substring(1);
		}else {
			childURL = "?non=1";
		}
		if(pInteval.contains("all"))
			pInteval="";
		childURL += sort += pInteval;
		

		return childURL;
	}
	
	public static String getLastValue(String para, Map<String, String[]> map) {
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			if(entry.getKey().equals(para)) {
				return entry.getValue()[entry.getValue().length-1];
			}
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(convertToStandardPrice(1000000));
	}
}

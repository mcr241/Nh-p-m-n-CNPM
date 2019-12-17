package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDao;
import dao.UserDao;
import database.DataBase;
import model.Category;
import model.Manufacturer;
import model.Product;
import model.User;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

public class ProductDaoImpl extends DataBase implements ProductDao {
	CategoryService categortService = new CategoryServiceImpl();

	@Override
	public void insert(Product product) {
		String sql = "INSERT INTO Product(name, price, sale, des, des2, image,cate_id, manu_id ,quantity) VALUES (?,?,?,?,?,?,?,?,?)";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setLong(2, product.getPrice());
			ps.setInt(3, product.getSale());
			ps.setString(4, product.getDes());
			ps.setString(5, product.getDes2());
			ps.setString(6, product.getImage());
			if (product.getCategory() != null)
				ps.setInt(7, product.getCategory().getId());
			else
				ps.setInt(7, -1);
			if(product.getManufacturer() != null)
				ps.setInt(8, product.getManufacturer().getId());
			else
				ps.setInt(8, -1);
			ps.setInt(9, product.getQuantity());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Product product) {
		String sql = "UPDATE Product SET Product.name = ? , price = ?,sale=?, image = ?,cate_id=?, des=?, des2=?, quantity=?, manu_id=?  WHERE id = ?";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setInt(3, product.getSale());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCategory().getId());
			ps.setString(6, product.getDes());
			ps.setString(7, product.getDes2());
			ps.setInt(8, product.getQuantity());
			ps.setInt(9, product.getManufacturer().getId());
			ps.setInt(10, product.getId());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM Product WHERE id=?";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Product get(int id) {
		String sql = "select product.*, cate.cate_name, manu.name as manu_name\r\n"
				+ "from product, Category cate, Manufacturer manu\r\n"
				+ "where product.cate_id = cate.cate_id and manu.manu_id = Product.manu_id and product.id = ?";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				return buildProduct(rs);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getAll() {

		List<Product> productList = new ArrayList<Product>();
		String sql = "select product.*, cate.cate_name, manu.name as manu_name\r\n"
				+ "from product, Category cate, Manufacturer manu\r\n"
				+ "where product.cate_id = cate.cate_id and manu.manu_id = Product.manu_id";
		Connection conn = DataBase.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				productList.add(buildProduct(rs));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	@Override
	public List<Product> search(String keyword) {
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT * FROM user WHERE name LIKE ? ";
		Connection conn = super.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + keyword + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				productList.add(buildProduct(rs));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	@Override
	public List<Product> seachByCategory(int cate_id) {
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT product.*, category.cate_name AS cate_name, category.cate_id AS cate_id "
				+ "FROM Product , Category   where product.cate_id = category.cate_id and Category.cate_id=?";
		Connection conn = super.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cate_id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				productList.add(buildProduct(rs));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	@Override
	public List<Product> seachByName(String productName) {
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT product.* , category.cate_name AS cate_name			"
				+ " FROM Product , Category   where product.cate_id = category.cate_id and Product.name like ? ";
		Connection conn = super.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + productName + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				productList.add(buildProduct(rs));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	public Product buildProduct(ResultSet rs) throws SQLException {
		Category category = null;
		try {
			category = categortService.get(rs.getInt("cate_id"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		Product product = new Product();
		product.setId(rs.getInt("id"));
		product.setName(rs.getString("name"));
		product.setDes(rs.getString("des"));
		product.setDes2(rs.getString("des2"));

		product.setPrice(rs.getLong("price"));
		product.setSale(rs.getInt("sale"));
		product.setQuantity(rs.getInt("quantity"));

		product.setImage(rs.getString("image"));
		product.setThumbImg(rs.getString("thumb_img"));

		product.setCategory(category);
		product.setManufacturer(new Manufacturer(rs.getInt("manu_id")));
		try {
			product.setManufacturer(new Manufacturer(rs.getInt("manu_id"), rs.getString("name")));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return product;
	}

	public List<Product> searchByCateAndManu(int cate_id, int manu_id) {
		String sql = "SELECT * FROM Product WHERE cate_id = ? and manu_id = ? ";
		Connection con = DataBase.getConnection();
		List<Product> productList = new ArrayList<Product>();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cate_id);
			ps.setInt(2, manu_id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				productList.add(buildProduct(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return productList;

	}

	public static void main(String[] args) {
		Product x = new Product();
		x.setName("dfefef");
//		new ProductDaoImpl().insert(x);
		System.out.println(new ProductDaoImpl().getAll().size());

	}

}

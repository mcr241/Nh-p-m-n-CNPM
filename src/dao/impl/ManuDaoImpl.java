package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DataBase;
import model.Manufacturer;

public class ManuDaoImpl extends DataBase {

	
	public void insert(Manufacturer manu) {
		String sql = "INSERT INTO manufacturer(name) VALUES (?)";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, manu.getName());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public void edit(Manufacturer manu) {
		String sql = "UPDATE manu SET cate_name = ? WHERE cate_id = ?";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, manu.getName());
			ps.setInt(2, manu.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void delete(int id) {
		String sql = "DELETE FROM manu WHERE cate_id = ?";
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

	
	public Manufacturer get(int id) {
		String sql = "SELECT * FROM Manufacturer WHERE manu_id = ? ";
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Manufacturer manu = new Manufacturer();

				manu.setId(rs.getInt("manu_id"));
				manu.setName(rs.getString("name"));

				return manu;

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public List<Manufacturer> getAll() {
		List<Manufacturer> manus = new ArrayList<Manufacturer>();
		String sql = "SELECT * FROM Manufacturer";
		Connection conn = super.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Manufacturer manu = new Manufacturer();

				manu.setId(rs.getInt("manu_id"));
				manu.setName(rs.getString("name"));

				manus.add(manu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return manus;
	}

	
	public List<Manufacturer> search(String keyword) {
		List<Manufacturer> manus = new ArrayList<Manufacturer>();
		String sql = "SELECT * FROM manu WHERE name LIKE ? ";
		Connection conn = super.getConnection();

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + keyword + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Manufacturer manu = new Manufacturer();

				manu.setId(rs.getInt("id"));
				manu.setName(rs.getString("name"));

				manus.add(manu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return manus;
	}

	
	public Manufacturer get(String name) {
		String sql = "SELECT * FROM Manufacturer WHERE name = N'%s'";
		sql = String.format(sql, name);
		Connection con = super.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Manufacturer manu = new Manufacturer();

				manu.setId(rs.getInt("manu_id"));
				manu.setName(rs.getString("name"));

				return manu;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
	}
}

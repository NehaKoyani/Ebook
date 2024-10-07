package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.bookdtlseller;

public class booksellerDAOImpl implements booksellerDAO{

	
	
	private Connection conn;
	public booksellerDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	@Override
	public boolean addbooks(bookdtlseller b) {
		
		boolean f=false;
		try
		{
			String sql= "insert into seller_book(bookname,author,price,bookCategory,typeCategory,status,photo,email) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getTypeCategory());
			ps.setString(6, b.getStatus());
			ps.setString(7, b.getPhotoname());
			ps.setString(8, b.getEmail());
			
			int i = ps.executeUpdate();
			if(i == 1)
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
		
	}
	
}

package com.entity;

public class BookDtls {
	private int bookid;
	private String bookname;
	private String author;
	private String price;
	private String bookCategory;
	private String typeCategory;
	private String status;
	private String photoname;
	private String email;
	public BookDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDtls(String bookname, String author, String price,  String bookCategory, String typeCategory,  String status, String photoname,
			String email) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.typeCategory = typeCategory;
		this.status = status;
		this.photoname = photoname;
		this.email = email;
	}
	public String getTypeCategory() {
		return typeCategory;
	}
	public void setTypeCategory(String typeCategory) {
		this.typeCategory = typeCategory;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "BookDtls [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ",typeCategory=" + typeCategory + ",  status=" + status + ", photoname=" + photoname + ", email="
				+ email + "]";
	}
	
	
	
}

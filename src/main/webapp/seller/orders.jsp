<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.Book_Order" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@pge isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	
	<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Price</th>
      <th scope="col">Ph No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
  	List<Book_Order> blist=dao.getAllOrder();
  	for(Book_Order b:blist)
  	{%>
  		<tr>
	      <th scope="row"><%=b.getOrderId()%></th>
	      <td><%=b.getUserName()%></td>
	      <td><%=b.getEmail()%></td>
	      <td><%=b.getFulladd()%></td>
	      <td><%=b.getPhno()%></td>
	      <td><%=b.getBookName()%></td>
	      <td><%=b.getAuthor()%></td>
	      <td><%=b.getPrice()%></td>
	      <td><%=b.getPaymentType()%></td>
    </tr>
  	<%}
  %>
    
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
  </tbody>
</table>
<div style="margin-top: 180px;">
<%@include file="footer.jsp"%></div>
</body>
</html>
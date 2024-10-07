<%@page import="com.entity.User" %>
<%@page import="com.DB.*"%>
<%@page import="com.DAO.BookDAOImpl" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.BookDtls" %>
<%@page import="java.util.List" %>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
*
{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
#body
{
	background-color: #7aacff;
}
#slider
{
	width: 100%;
	overflow: hidden;
	border: 10px solid #ffffff;
	border-radius: 8px;
}
#slider figure
{
	position: relative;
	width: 500%;
	margin: 0;
	left: 0;
	animation: 20s slider infinite;
}
#slider figure img
{
	width: 20%;
 	float: left;
}
@keyframes slider
{
	0%
	{
		left: 0;
	}
	20%
	{
		left: 0;
	}
	25%
	{
		left: -100%;
	}
	45%
	{
		left: -100%;
	}
	50%
	{
		left: -200%;
	}
	70%
	{
		left: -200%;
	}
	75%
	{
		left: -300%;
	}
	95%
	{
		left: -300%;
	}
	100%
	{
		left: -400%;
	}
}
</style>
</head>
<body style="background-color:#f7f7f7;">

	
	<%
	User u =(User) session.getAttribute("userobj");
	%>
	
	<%@include file="all_component/navbar.jsp" %>
		<section class="section">
					<div id="slider">
					 	<figure>
					 		<img src="img/10.jpg">
					 		<img src="img/h05.jpg">
					 		<img src="img/4.jpg">
					 		<img src="img/h1.png">
					 	</figure>
					</div>
		</section>
<!-- Start Recent Book -->	
	
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
		BookDAOImpl dao2= new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list2=dao2.getRecentBooks();
		for(BookDtls b:list2)
		{%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=" " src="book/<%=b.getPhotoname()%>" 
						style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
						<%
						if(b.getBookCategory().equals("Old"))
						{%>
						Categories: <%=b.getBookCategory()%></p>
							<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>
						<%}
						else
						{%>
						Categories: <%=b.getBookCategory()%></p>
						<div class="row">
						
						<%if(u == null)
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%}else{
						%>
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%
						}
						%>
						
						<a href="view_books.jsp?bid=<%=b.getBookid() %>" 
						class="btn btn-success btn-sm ml-1">View Details</a>
						<a href=" " class="btn btn-danger btn-sm "><%=b.getPrice() %><i 
						class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%}
						%>
						
					</div>
				</div>
			</div>
		<%}
		%>	
		</div>
		<div class="text-center mt-1">
				<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
<!-- End Recent Book -->
<hr>

<!-- Start New Book -->	
	
	<div class="container">
	<h3 class="text-center">New Book</h3>
	<div class="row">
	
			<%
			BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list)
			{%>
			
			<div class="col-md-3">
				<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt=" " src="book/<%=b.getPhotoname()%>" 
					style="width: 150px; height: 200px" class="img-thumblin">
					<p><%=b.getBookname() %></p>
					<p><%=b.getAuthor() %></p>
					<p>
						Categories: <%=b.getBookCategory() %></p>
					<div class="row">
					
					<%if(u == null)
					{%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
					<%}else{
					%>
						<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
					<%
					}
					%>
					
					
					<a href="view_books.jsp?bid=<%=b.getBookid()%>" 
						class="btn btn-success btn-sm ml-1">View Details</a>
						
					<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>
					<i class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
			</div>
			</div>
			<%}
			%>
		
		
		
		
		
		
	</div>
	
	<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
<!-- End New Book -->
<hr>

<!-- Start Old Book -->	
	
	<div class="container">
	<h3 class="text-center">Old Book</h3>
	<div class="row">
	<%
	BookDAOImpl dao3= new BookDAOImpl(DBConnect.getConn());
	List<BookDtls> list3=dao2.getOldBooks();
	for(BookDtls b:list3)
	{%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt=" " src="book/<%=b.getPhotoname() %>" style="width: 150px; height: 200px" class="img-thumblin">
					<p><%=b.getBookname() %></p>
					<p><%=b.getAuthor() %></p>
					<p><%=b.getBookCategory() %></p>
					<div class="row">
					<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details</a>
					<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>
					<i class="fa-solid fa-indian-rupee-sign"></i>
					</a>
					</div>
					
				</div>
			</div>
		</div>
	<%}
	%>	
	
		
		
	</div>
	
	<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
<!-- End Old Book -->

<%@include file="all_component/footer.jsp" %>	
</body>
</html>
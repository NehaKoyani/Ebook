<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DAO.BookDAOImpl" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.BookDtls" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover
{
	background-color: #fcf7f7; 
}
</style>
</head>
<body>

	<%@include file="all_component/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-3">
				<%
				String ch=request.getParameter("ch");
				BookDAOImpl dao2= new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list2 = dao2.getBookBySerch(ch);
				for(BookDtls b:list2)
				{%>
					<div class="col-md-3">
						<div class="card crd-ho mt-2">
							<div class="card-body text-center">
								<img alt=" " src="book/<%=b.getPhotoname() %>" style="width: 100px; height: 150px" class="img-thumblin">
								<p><%=b.getBookname() %></p>
								<p><%=b.getAuthor() %></p>
								<p>
								<%
								if(b.getBookCategory().equals("Old"))
								{%>
								Categories: <%=b.getBookCategory() %></p>
									<div class="row">
									<a href=" " class="btn btn-success btn-sm ml-5">View Details</a>
									<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
									</div>
								<%}
								else
								{%>
								Categories: <%=b.getBookCategory() %></p>
								<div class="row">
								<a href=" " class="btn btn-danger btn-sm ml-1">Add Cart</a>
								<a href=" " class="btn btn-success btn-sm ml-1">View Details</a>
								<a href=" " class="btn btn-danger btn-sm "><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
								</div>
								<%}
								%>
								
							</div>
						</div>
					</div>
				<%}
				%>	
			</div>
		</div>
</body>
</html>
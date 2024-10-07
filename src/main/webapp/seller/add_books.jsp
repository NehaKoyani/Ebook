<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp" %>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4"> 	
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Add Books</h4>
					
					<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session" />
					</c:if>
					
					<c:if test="${not empty failedMsg }">
					<p class="text-center text-danger">${failedMsg }</p>
					<c:remove var="failedMsg" scope="session" />
					</c:if>
					
					
						<form action="../add_books" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label>
								<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label>
								<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label>
								<input name="price" type="number" class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label>
								<select id="inputState" name="categories" class="form-control">
								<option selected>--select--</option>
								<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Type Categories</label>
								<select id="inputState" name="tcategories" class="form-control">
								<option selected>--select--</option>
								<option value="educational">Educational Book</option>
								<option value="comic">Comic Book</option>
								<option value="historical">Historical Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label>
								<select id="inputState" name="status" class="form-control">
								<option selected>--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label>
								<input name="bimg" type="file" class="form-control-file" 
								id="exampleFormControlFile1">
							</div>
							
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 180px;">
<%@include file="footer.jsp"%></div>
</body>
</html>
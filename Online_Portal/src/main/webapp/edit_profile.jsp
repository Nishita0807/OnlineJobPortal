<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Jobs"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile page</title>
<%@include file="/all_component/all_css.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>

	<%@include file="/all_component/navbar.jsp"%>
	<div class="container-fluid">
	<div class="row p-4">

		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
						<i class="fa-solid fa-user-group"></i>
			
					
					<h5>Edit Profile</h5>
					</div>
					<form action="update_profile" method="post">
					<input type="hidden" value="${userobj.id }" name="id">
						<div class="form-group">
							<label>Enter Full Name</label><input type="text" name="name"
								required ="required" class="form-control" id="exampleInputEmail" aria-describeby="emailHelp" value="${userobj.name }">
						</div>
						<div class="form-group">
							<label>Enter Qualification</label><input type="text" name="qua"
								required ="required" class="form-control" id="exampleInputEmail" aria-describeby="emailHelp" value="${userobj.qualification }">
						</div>
								<div class="form-group">
							<label>Enter Email</label><input type="email" name="email"
								required ="required" class="form-control" id="exampleInputEmail" aria-describeby="emailHelp" value="${userobj.email }">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Enter Password</label><input type="password" name="ps"
								required ="required" class="form-control" id="exampleInputPassword1" aria-describeby="emailHelp" value="${userobj.password}">
						</div>
				<button type="submit" class="btn btn-primary badge-pill btn-block">Update</button>
				</form>
				</div>
				</div>
				</div>
				</div>
				</div>
				<div style="margin-top:50px;">
				<%@include file="all_component/footer.jsp" %>
				</div>
				


</body>
</html>
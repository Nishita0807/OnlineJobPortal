<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: View Jobs</title>
<%@include file="/all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>

	<%@include file="/all_component/navbar.jsp"%>
	<div class="conatiner">
	<div class="row">

		<div class="col-md-12">
		<h5 class="text-center text-primary">All Jobs</h5>
	<c:if test="${not empty succMsg}">
		<h4 class="text-center text-danger">${succMsg}</h4>
		<c:remove var="succMsg"/>
		</c:if> 
			<div class="card">
				<div class="card-body">
				
				
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
							<h5>Location</h5>
							</div>
							<div class="form-group col-md-4 mt-1">
							<h5>Category</h5>
							</div>
							<div class="form-group col-md-5">
								 <select name="loc"
									class="custom-select" id="inlineFormCustomSelectPref">
									<option selected value="lo">Choose...</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Andaman and Nicobar Islands">Andaman
										and Nicobar Islands</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadar and Nagar Haveli">Dadar and Nagar
										Haveli</option>
									<option value="Daman and Diu">Daman and Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu and Kashmir">Jammu and Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>
								</div>
								<div class="form-group col-md-5">
									<select name="cat"
										class="custom-select" id="inlineFormCustomSelectPref">
										<option value="ca" selected>Choose...</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
										<option value="Teacher">Teacher</option>
										<option value="Pharmacist">Pharmacist</option>
									</select>

								</div>
								<button class="btn btn-success">Submit</button>
								</form>
								</div>
								</div>
							
								<%
								JobDAO dao=new JobDAO(DBConnect.getConn());
								List<Jobs> list=dao.getAllJobsForUser();
								for(Jobs j:list){
									%>
									<div class="card mt-2">
									<div class="card-body">
									<div class="text-center text-primary">
										<i class="fa-solid fa-user-group"></i>
										</div>
										<h6><%=j.getTitle()%></h6>
										<%
										if(j.getDescription().length()>0 && j.getDescription().length()<120){
											%>
											<p><%=j.getDescription() %>.</p>
											<%
											}
											else{
												%>
												
												<p><%=j.getDescription().substring(0,120) %>...
												</p>
											
								<%
								}
								%>
								<br>
								<div class="form-row">
								<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm" value="location:<%=j.getLocation()%>" readonly>
								</div>
								
								<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory() %>" readonly>
								</div>
								</div>
								<h6>
								Publish Date:
								<%=j.getPdate().toString() %></h6>
								<div class="text-center">
								
								<a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View More</a>
								</div>
								</div>
								</div>
								<%
								}
								%>
								
				
</div>
</div>
</div>

</body>
</html>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Job</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<c:if test="${userobj.role ne 'admin' && userobj.role ne 'employer'}">  
   <c:redirect>url="login.jsp"</c:redirect>
</c:if>
<%@include file="all_components/navbar.jsp" %>
<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
					<i class="fa-solid fa-user-group"></i>
					<% int id=Integer.parseInt(request.getParameter("id"));
					JobDAO dao=new JobDAO(DBconnect.getCon());
					     Jobs j=dao.getJobById(id);
					
					%>
					
					<h5>Edit Jobs</h5>
					</div>
					
					<form action="update" method="post">
					 <input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
						 <label>Enter title</label>
                         <input type="text" required="required" class="form-control" name="title" value="<%=j.getTitle() %>">
						</div>
						<div class="form-row">
						<div class="form-group col-md-4">
						 <label>Location</label>
						 <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
						 <option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
						 <option value="kurnool">kurnool</option>
						 <option value="Hyderabad">Hyderabad</option>
						 <option value="Tirupathi">Tirupathi</option>
						 <option value="Channi">Channi</option>
						 <option value="Delhi">Delhi</option>
						 <option value="Banglore">Banglore</option>
						 </select>
                         
						</div><div class="form-group col-md-4">
						 <label>Catagory</label>
						 <select name="catagory" class="custom-select" id="inlineFormCustomSelectPref">
						 <option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
						 <option value="IT">IT</option>
						 <option value="Devloper">Devloper</option>
						 <option value="Banking">Banking</option>
						 <option value="Engineer">Engineer</option>
						 <option value="Teacher">Teacher</option>
						 
						 </select>
                         
						</div>
					    <div class="form-group col-md-4">
						 <label>Status</label>
						 <select name="status" class="custom-select">
						 <option class="Active" value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
						 <option class="Active" value="Active">Active</option>
						 <option class="Inactive" value="Inactive">Inactive</option>
						 
						 </select>
						 </div>
						 </div>
                       					
						<div class="form-group" >
						 <label>Enter Description</label>
						 <textarea required rows="6" cols="" name="desc" class="form-control"><%=j.getDescription() %></textarea>
						 
						 
                         
						</div>
					    <button class="btn btn-success">
					    Update Job</button>
					    <button type="reset" class="btn btn-success">
					    Reset</button>
					</form>
				</div>
			</div>
		
	</div>
</div>
</body>
</html>
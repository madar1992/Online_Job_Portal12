<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.UserDao"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: view users</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${userobj.role ne 'admin' && userobj.role ne 'user'}">
		<c:redirect>url="login.jsp"</c:redirect>
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-5">
		 
		<div class="card">
			 
			<div class="card-body">
				 
				<p class="text-center"><h1>All users Data</h1></p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Password</th>
							<th scope="col">Qualification</th>
						</tr>
					</thead>
					<tbody>
						<% UserDao dao = new UserDao(DBconnect.getCon());
                          List<User> list=dao.getAllUsers();
                          for(User e:list){
                        	  %><tr>
							<th scope="row"><%=e.getId() %>  </th>
							<td>  <%=e.getName() %>  
							</td>
							<td>  <%=e.getEmail() %>  
							</td>
							<td>  <%=e.getPassword() %>  
							</td>
							<td>  <%=e.getQualification() %>  
							</td>
							<td>
							
							
						</tr>
						<% }%>
                  </tbody>
				</table>
				 
			</div>
			 
		</div>
		 
	</div>
</body>
</html>
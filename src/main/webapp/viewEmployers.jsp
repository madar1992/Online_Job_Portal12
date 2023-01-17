<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.EmployerDAO"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: view employers</title>
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
				 
				<p class="text-center"><h1>All Employers Data</h1></p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Employer Name</th>
							<th scope="col">Company Name</th>
							<th scope="col">Company Email</th>
							
						</tr>
					</thead>
					<tbody>
						<% EmployerDAO dao = new EmployerDAO(DBconnect.getCon());
                          List<Employer> list=dao.getAllEmployers();
                          for(Employer e:list){
                        	  %><tr>
							<th scope="row"><%=e.getId() %>  </th>
							<td>  <%=e.getEmployeerName() %>  
							</td>
							<td>  <%=e.getCompanyName() %>  
							</td>
							<td>  <%=e.getCompanyEmail() %>  
							</td>
							
							
							
							
						</tr>
						<% }%>
                  </tbody>
				</table>
				 
			</div>
			 
		</div>
		 
	</div>
</body>
</html>
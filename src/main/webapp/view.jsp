<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: view jobs</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<c:if test="${userobj.role ne 'admin' && userobj.role ne 'employer'}">  
   <c:redirect>url="login.jsp"</c:redirect>
</c:if>
<%@include file="all_components/navbar.jsp" %>
<div class="container">
		<div class="row">
               <div class="col-md-12">
                    <h5 class="text-center text-primary">All Jobs</h5>
                    <c:if test="${not empty succMsg }">
					   <div class="alert alert-danger" role="alert">
                           ${ succMsg}
                        </div>
                        <c:remove var="succMsg"/>
					</c:if>
                    <% JobDAO dao=new JobDAO(DBconnect.getCon()); 
					          List<Jobs> ls=dao.getAllJobs();
					       
					          for(Jobs x : ls){
					          %>
					     <div class="card mt-2">
                           <div class="card-body">
					       <div class="text-center text-success">
					       <i class="fa-regular fa-clipboard"></i>
					       </div>
					       <div>
					       
					       <h6><%=x.getTitle() %></h6>
					       <p><%=x.getDescription()%></p>
					       <br>
					       <div class="form-row">
					        	<div class="form-group col-md-3">
					        		<input type="text" class="form-control form-control-sm" value="Location:<%=x.getLocation() %>" readonly>
					        	</div>
					        	<div class="form-group col-md-3">
					        		<input type="text" class="form-control form-control-sm" value="Category:<%=x.getCategory() %>" readonly>
					        	</div>
					        	<div class="form-group col-md-3">
					        		<input type="text" class="form-control form-control-sm" value="Status:<%=x.getStatus() %>" readonly>
					        	</div>
					       </div>
					       <h6>Publish Date:<%=x.getPdate() %></h6>
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=x.getId() %>" class="btn btn-sm bg-success text-white">Edit</a>
							<a href="delete?id=<%=x.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
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
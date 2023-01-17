<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employer Registration</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>
<div class="container-fluid">
	<div class="row p-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
					<c:if test="${not empty succMsg }"><div class="alert alert-danger" role="alert">
                           ${ succMsg}</div><c:remove var="succMsg"/></c:if>
					<i class="fa-solid fa-user-plus"></i>
					<h5>Employer Registration</h5>
					
					</div>
					<form action="EmployeerRegister" method="post">
						<div class="form-group">
						 <label>Employer Name</label>
                         <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
						</div>
						<div class="form-group">
						 <label>Company Name</label>
                         <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="cname">
						</div>
						<div class="form-group">
						 <label>Company Email</label>
                         <input type="email" required="required" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" name="cemail">
						</div>
						<div class="form-group">
						 <label for="exampleInputPassword1">Enter password</label>
                         <input type="password" required="required" class="form-control" id="exampleInputPassword1" name="ps">
						</div>
					    <button type="submit" class="btn btn-primary badge-pill btn-block">
					    Register</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
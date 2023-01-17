<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Page</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_components/navbar.jsp" %>
<div class="container-fluid">
	<div class="row p-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<div class="text-center">
					<c:if test="${not empty succMsg }">
					<div class="alert alert-danger" role="alert">
                           ${ succMsg}</div><c:remove var="succMsg"/>
                    </c:if>
					<i class="fa-solid fa-user-plus"></i>
					<h5>Login page</h5>
					</div>
					<form action="login" method="post">
						<div class="form-group">
						 <label>Enter Email</label>
                         <input type="email" required="required" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" name="em">
						</div>
						<div class="form-group">
						 <label for="exampleInputPassword1">Enter password</label>
                         <input type="password" required="required" class="form-control" id="exampleInputPassword1" name="ps">
						</div>
					    <button type="submit" class="btn btn-primary badge-pill btn-block">
					    Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>

</html>
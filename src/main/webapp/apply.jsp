<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply for Job</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_components/navbar.jsp" %>
<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
					<i class="fa-solid fa-user-group"></i>
					<c:if test="${not empty succMsg }">
					   <div class="alert alert-danger" role="alert">
                           ${ succMsg}
                        </div>
                        <c:remove var="succMsg"/>
					</c:if>
					<h5>Apply for this Job</h5>
					</div>
					<form action="applyForJob" method="post">
						<div class="form-group">
						 <label>Enter Name</label>
                         <input type="text" required="required" class="form-control" name="name">
						</div>
						<div class="form-group">
						 <label>Email</label>
                         <input type="text" required="required" class="form-control" name="email">
						</div>
						<div class="form-group">
						 <label>Qualification</label>
                         <input type="text" required="required" class="form-control" name="qua">
						</div>
						<div class="form-group">
						 <label>Experience</label>
                         <input type="text" required="required" class="form-control" placeholder="EX :0 to 5 years" name="ex">
						</div>
						<div class="form-row">
						<div class="form-group col-md-4">
						 <label>Location</label>
						 <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
						 <option selected>Choose...</option>
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
						 <option selected>Choose...</option>
						 <option value="IT">IT</option>
						 <option value="Devloper">Devloper</option>
						 <option value="Banking">Banking</option>
						 <option value="Engineer">Engineer</option>
						 <option value="Teacher">Teacher</option>
						 
						 </select>
                         
						</div>
				
						 </div>
                       					
						<div class="form-group" >
						 <label>Enter Description</label>
						 <textarea required rows="6" cols="" name="desc" class="form-control"></textarea>
						 
						 
                         
						</div>
					    <button class="btn btn-success">
					    Submit Application</button>
					    <button type="reset" class="btn btn-success">
					    Reset</button>
					</form>
				</div>
			</div>
		
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_components/all_css.jsp" %>
<style type="text/css">
.back-img{
   background: url("img/job-portal1.jpg");
   width: 100%;
   height: 85vh;
   background-repeat: no-repeat;
   background-size: cover;
}
</style>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>
<div class="container-fluid back-img">
   <div class="text-center p-4" style="color: white;">
  <h1><i class="fa-solid fa-book"></i> Online Job Portal</h1>
   
   </div>
  
					
			<div style="float:right;
                background:orange;
                width:25%;
                height:60px;">		
					
					
					 <label>If you are an Employer and you want give a chance to unemployed youth.Register below and post jobs</label>
						<a href="EmployeeRegi.jsp" class="btn btn-light">Sign up</a>
						
						 
					
				
			</div>
		
	
</div>

<%@include file="all_components/footer.jsp" %>
</body>
</html>
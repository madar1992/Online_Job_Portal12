<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="all_components/all_css.jsp" %>
<style type="text/css">
.back-img{
   background: url("img/welcome.jpg");
   width: 100%;
   height: 90vh;
   background-repeat: no-repeat;
   background-size: cover;
}
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin'}">  
   <c:redirect>url="login.jsp"</c:redirect>
</c:if>
<%@include file="all_components/navbar.jsp" %>
<div class="container-fluid back-img">
   <div class="text-center p-4" style="color: white;">
  <h1><i class="fa-solid fa-book"></i> Welcome Admin to your Job Portal</h1>
   
   </div>
</div>
</body>
</html>
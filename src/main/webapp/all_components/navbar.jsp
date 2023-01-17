<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">My Job Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <c:if test="${userobj.role eq 'admin'}">
      <li class="nav-item">
        <a class="nav-link" href="viewUsers.jsp"><i class="fa-solid fa-eye"></i>View users</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewEmployers.jsp"><i class="fa-solid fa-eye"></i>View Employers</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="user_view.jsp"><i class="fa-solid fa-eye"></i>View Jobs</a>
      </li>
      </c:if>
      
      <c:if test="${userobj.role eq 'employer'}">
      <li class="nav-item">
        <a class="nav-link" href="add_job.jsp"><i class="fa-solid fa-plus"></i></i>Post Job</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="view.jsp"><i class="fa-solid fa-eye"></i>View Job</a>
      </li>
      </c:if>
      
      <c:if test="${userobj != null && userobj.role eq 'user'}">
  <li class="nav-item">
    <a class="nav-link" href="user_view.jsp"><i class="fa-solid fa-eye"></i>View All Jobs</a>
  </li>
</c:if>

      
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
       <c:if test="${userobj.role eq 'admin' }">
       <a href="#" class="btn btn-light mr-1"><i class="fa-solid fa-user"></i>Admin</a>
       <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Logout</a>
       </c:if>
        <c:if test="${userobj.role eq 'user' }">
       <a href="#" class="btn btn-light mr-1"><i class="fa-solid fa-user"></i>${userobj.name}</a>
       <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Logout</a>
       </c:if>
       <c:if test="${userobj.role eq 'employer' }">
       <a href="#" class="btn btn-light mr-1"><i class="fa-solid fa-user"></i>Employer</a>
       <a href="logout" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Logout</a>
       </c:if>
       
       <c:if test="${ empty userobj }">
       <a href="login.jsp" class="btn btn-light mr-1"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
      <a href="sign_up.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i>Sign up</a>
       </c:if>
       
      
    </form>
  </div>
</nav>
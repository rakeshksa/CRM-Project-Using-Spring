<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Employee</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

<!-- HEADER SECTION -->
<div class="container-fluid bg-primary py-2">
  <div class="container d-flex justify-content-between align-items-center">
    <a href="profileAdmin" class="navbar-brand text-light fs-4">CRM Application</a>
    <div class="d-flex align-items-center">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s" 
           alt="Admin" class="rounded-pill me-2" style="width:40px;">
      <span class="text-light">Welcome Admin</span>
      <a href="logout" class="btn btn-danger btn-sm ms-2 " >Logout</a>
    </div>
  </div>
</div>

<!-- NAVBAR INCLUDE -->
<jsp:include page="header-admin.jsp"/>

<!-- MAIN CONTENT -->
<div class="container-fluid">
<div class="container mt-4">

<c:if test="${not empty model_success}">
    <div class="row">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${model_success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>

<c:if test="${not empty model_error}">
    <div class="row">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${model_error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>


  <div class="row justify-content-center">
    <div class="col-md-6 bg-light p-4 rounded shadow-sm">
      <h3 class="mb-4">Register Here</h3>
      <form:form action="addEmpForm" method="post" modelAttribute="modelEmpAttr">
        <div class="mb-3">
          <label class="form-label">Enter Your Name</label>
          <form:input path="name" cssClass="form-control"/>
          <form:errors path="name" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Enter Your Email</label>
          <form:input path="email" cssClass="form-control"/>
          <form:errors path="email" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Enter Your Mobile No.</label>
          <form:input path="phoneno" cssClass="form-control"/>
          <form:errors path="phoneno" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Enter Your Password</label>
          <form:password path="password" cssClass="form-control"/>
          <form:errors path="password" cssClass="error_message_design"/>
        </div>
        <input type="submit" value="Register" class="btn btn-primary"/>
      </form:form>
    </div>
  </div>
</div>
</div>

</body>
</html>

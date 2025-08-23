<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Employees List</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Bundle JS (includes Popper.js) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  <!-- Optional Custom CSS -->
  <style>
    .header_design {
      padding: 10px 0;
    }
    .navbar {
      margin-top: 10px;
    }
    .navbar-brand img {
      width: 40px;
    }
  </style>
  
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  
  <script>
  function confirmEmpDelete(empEmail) {
	//alert("hii : "+empEmail);
	$('#deleteEmpConfirmationModal').modal('show');
	$('#deleteButton').attr('href','/deleteEmployee?empEmail='+empEmail)
}
  function editEmployee(empEmail) {
	window.location.href="/editEmployee?empEmail="+encodeURIComponent(empEmail);
}
  </script>
</head>
<body>

  <!-- HEADER SECTION -->
  <div class="container-fluid bg-primary header_design">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-3">
          <a href="profileAdmin" class="navbar-brand text-light fs-4">CRM Application</a>
        </div>
        <div class="col-6"></div>
        <div class="col-3 text-end">
          <a class="navbar-brand d-flex align-items-center text-light" href="#">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s" alt="Welcome Admin" class="rounded-pill me-2">
            <span>Welcome Admin</span>
          </a>
          <a href="logout" class="btn btn-danger btn-sm ms-2 " style="margin-top: -80px">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="header-admin.jsp"/>
  
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
  

  <!-- MAIN CONTENT -->
  <div class="container mt-4">
    <h2>Employees List</h2>
    <p>Below table display only 5 employees list </p>

    <table class="table table-light table-bordered table-striped">
      <thead class="table-dark">
        <tr>
          <th>FullName</th>
          <th>Email</th>
          <th>PhoneNo</th>
          <th style="text-align: center;">	Update</th>
          <th style="text-align: center;">Delete</th>
          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="employee" items="${model_list_emp}">
        <tr>
        <td>${employee.getName()}</td>
        <td>${employee.getEmail()}</td>
        <td>${employee.getPhoneno()}</td>        
        <td style="text-align: center;">
       
        <button class="btn btn-secondary" onclick="editEmployee('${employee.getEmail()}')"><i class="bi bi-pencil-square"></i></button>
        </td>
        
        <td style="text-align: center;">
        <button class="btn btn-danger" onclick="confirmEmpDelete('${employee.getEmail()}')"><i class="bi bi-trash3-fill"></i></button>
        
        </td>
        </tr>
        </c:forEach>
        
      </tbody>
    </table>
    
    <ul class="pagination">
    
    <c:choose>
    <c:when test="${model_current_page>1}">
   <li class="page-item"> 
   <a class="page-link" href="/emplist?page=${model_current_page-1}">Previous</a>
  </li>
    </c:when>
    
    <c:when test="${model_current_page==1}">
   <li class="page-item disabled"> 
   <a class="page-link" href="/emplist?page=${model_current_page-1}">Previous</a>
  </li>
    </c:when>
    </c:choose>
    
     
    
    <c:forEach begin="1" end="${model_total_pages}" var="pageNumber">
    <c:choose>
    <c:when test="${model_current_page==pageNumber}">
    <li class="page-item active"> 
     <a class="page-link" href="/emplist?page=${pageNumber}">${pageNumber}</a>
     </li>
    </c:when>
    
    <c:when test="${model_current_page!=pageNumber}">
    <li class="page-item"> 
     <a class="page-link" href="/emplist?page=${pageNumber}">${pageNumber}</a>
     </li>
    </c:when>
    
    </c:choose>
    
    </c:forEach>
  
<c:choose>
  <c:when test="${model_current_page<model_total_pages}">
    <li class="page-item">
    <a class="page-link" href="/emplist?page=${model_current_page+1}">Next</a>
    </li>
    </c:when>
    
    <c:when test="${model_current_page==model_total_pages}">
    <li class="page-item disabled">
    <a class="page-link" href="/emplist?page=${model_current_page+1}">Next</a>
    </li>
    </c:when>

</c:choose>  
</ul>
   
    
    <!-- The Modal -->
<div class="modal" id="deleteEmpConfirmationModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Delete Employee</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Are you sure you want to delete this Employee?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-bs-dismiss="modal">No</button>
        <a type="button" class="btn btn-danger" id="deleteButton">Yes</a>
      </div>

    </div>
  </div>
</div>
    
    
    
    
  </div>

</body>
</html>

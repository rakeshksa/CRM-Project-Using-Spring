<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome Employee</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Bundle JS (includes Popper.js) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

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
</head>
<body>

  <!-- HEADER SECTION -->
  <div class="container-fluid bg-primary header_design">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-3">
          <a href="homeEmployee" class="navbar-brand text-light fs-4">CRM Application</a>
        </div>
        <div class="col-6"></div>
        <div class="col-3 text-end">
          <a class="navbar-brand d-flex align-items-center text-light" href="profileEmployee">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s" alt="Admin" class="rounded-pill me-2">
            <span>${session_employee.getName()}</span>
          </a>
          <a href="logout" class="btn btn-danger btn-sm ms-2 " style="margin-top: -80px">Logout</a>
        </div>
      </div>
    </div>
  </div>

	<jsp:include page="header-employee.jsp"/>
 
  <!-- MAIN CONTENT -->
  <div class="container mt-4">
    <h2>Hello :${session_employee.getName()}</h2>
    <h4 class="text-secondry">Email :${session_employee.getEmail()}</h4>
    <h4 class="text-secondry">Phone no. :${session_employee.getPhoneno()}</h4>
    
    <!-- You can add dashboard cards or features here -->
  </div>

</body>
</html>

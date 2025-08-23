<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sale Course</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="css/style.css" type="text/css">
  
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script type="text/javascript">
  function getSelectedCourse() {
	    var selectedcourse = document.getElementById('coursename').value;
	    if (selectedcourse !== "") {
	        var xhr = new XMLHttpRequest();
	        xhr.open("GET", "/getCoursePrice?selectedcourse=" + selectedcourse, true);
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState === 4 && xhr.status === 200) {
	                var response = JSON.parse(xhr.responseText);
	                
	                var discountedprice = response.discountedprice;
	                var originalprice = response.originalprice;

	                document.getElementById('orignalpriceid').textContent = originalprice;
	                document.getElementById('discountedpriceid').textContent = discountedprice;

	                $('#priceDivId').css("visibility", "visible");
	            }
	        };
	        xhr.send();
	    } else {
	        $('#priceDivId').css("visibility", "hidden");
	    }
	}

  </script>
</head>
<body>

<!-- HEADER SECTION -->
<div class="container-fluid bg-primary py-2">
  <div class="container d-flex justify-content-between align-items-center">
    <a href="profileEmployee" class="navbar-brand text-light fs-4">CRM Application</a>
    <div class="d-flex align-items-center">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s" 
           alt="Admin" class="rounded-pill me-2" style="width:40px;">
      <span class="text-light">${session_employee.getName()}</span>
      <a href="logout" class="btn btn-danger btn-sm ms-2 " >Logout</a>
    </div>
  </div>
</div>

<!-- NAVBAR INCLUDE -->
<jsp:include page="header-employee.jsp"/>

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
      <h3 class="mb-4">Sale Course </h3>
      <form:form action="saleCourseForm" method="post" modelAttribute="modelSaleCourseAttr">
        <div class="mb-3">
          <label class="form-label">Customer Phone No.</label>
          <form:input path="custphoneno" cssClass="form-control"/>
          <form:errors path="custphoneno" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
        <label class="form-label">Interested Course</label>
          <form:select path="coursename" id="coursename" cssClass="form-select" onchange="getSelectedCourse()">
          			<form:option value="">Selected Course</form:option>
          			<form:options  items="${model_coursename_list}"/>
          </form:select>
          <form:errors path="coursename" cssClass="error_message_design"/>	
        </div>
         <div class="mb-3" id="priceDivId" style="visibility: hidden;">
         price to pay : <strong><del>Rs.<span id="orignalpriceid" style="color: red"></span> </del></strong> &nbsp;&nbsp; Rs.<span id="discountedpriceid" class="text-primary"></span>
         </div>
       
       
        <input type="submit" value="Sale Course" class="btn btn-primary"/>
      </form:form>
    </div>
  </div>
</div>
</div>

</body>
</html>

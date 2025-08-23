<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Enquiry</title>

<!-- Bootstrap 5 CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Bootstrap Bundle JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
    function getSelectedDate() {
		var selectedDate=$('#datePickerId').val();
		$.ajax({
		    type:"GET",
		    url:"/customerFolloupPage",
		    data:{selectedDate:selectedDate},
		    success:function(data){
		        var tableBody=$(data).find("tbody");
		        $('#followupTable tbody').html(tableBody.html());
		    },
		    error:function(xhr,status,error){
		        alert("Error: " + error);
		    }
		});

	}
    
    function cusEnquiryHistory(phoneNumber) {
		if (phoneNumber!=='') {
			window.location.href="custEnquiryHistoryPage?phno="+encodeURIComponent(phoneNumber);
		}
	}
    </script>

<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

    <!-- HEADER SECTION -->
    <div class="container-fluid bg-primary py-2">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="profileEmployee" class="navbar-brand text-light fs-4">CRM
                Application</a>
            <div class="d-flex align-items-center">
                <img
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s"
                    alt="Admin" class="rounded-pill me-2" style="width: 40px;"> 
                <span class="text-light">${session_employee.getName()}</span> 
                <a href="logout" class="btn btn-danger btn-sm ms-2">Logout</a>
            </div>
        </div>
    </div>

    <!-- NAVBAR INCLUDE -->
    <jsp:include page="header-employee.jsp" />

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

            <!-- Customer Enquiry Section -->
            <div class="row justify-content-center">
                <div class="col-md-6 bg-light p-4 rounded shadow-sm">
                    <h3 class="mb-4">Customer Enquiry</h3>
                    
                    <p>Bellow are the details of Customer's to be called </p>
                    <p>Or You Can Choose Any Date : <input type="date" class="form-control"  id="datePickerId" onchange="getSelectedDate()"/>  </p>
                    
                    
   <table id="followupTable" class="table table-light table-bordered table-striped">
      <thead class="table-dark">
        <tr>
          <th>Sr. No.</th>
          <th>PhoneNo</th>
          <th style="text-align: center;">Get History</th>
          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="followup" items="${model_followups}" varStatus="loop">
        <tr>
       
        <td>${loop.index+1}</td>
        <td>${followup.phoneno}</td>        
        <td style="text-align: center;">
        <button class="btn btn-success" onclick="cusEnquiryHistory('${followup.phoneno}')">Get History</button>
        </td>
        
       
        </tr>
        </c:forEach>
        
      </tbody>
    </table>
                    
                </div>
            </div>

        </div> <!-- closes container mt-4 -->
    </div> <!-- closes container-fluid -->

</body>
</html>

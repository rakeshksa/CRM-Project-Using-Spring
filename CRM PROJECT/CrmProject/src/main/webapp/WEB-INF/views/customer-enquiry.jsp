<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer Enquiry</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Bootstrap Bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="css/style.css" type="text/css">
  
  
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function name() {
	$('#phonenoInput').keyup(function name() {
			var phoneNumber= $(this).val();
			$.ajax({
				url:"/checkPhoneNumberAvailability",
				data:{phoneNumber : phoneNumber},
				success:function(response){
					if(response === "exits"){
						$('#phonenoInput').addClass("is-Invalid");
						$('#nameInput').prop('readonly',true);
						
						$('#interestedcourseInput').prop('disabled',true);
						$('#discussionInput').prop('readonly',true);
						$('#enquirytypeInput').prop('disabled',true);
						$('#statusInput').prop('disabled',true);
						$('#followupdateInput').prop('readonly',true);
						$('#calltoInput').prop('disabled',true);
						$('#submitBtnId').prop('disabled',true);
						
						
						$('#getHistoryBtn').show();
					}
					else{
						$('#phonenoInput').removeClass("is-Invalid");
						$('#nameInput').prop('readonly',false);
						
						$('#interestedcourseInput').prop('disabled',false);
						$('#discussionInput').prop('readonly',false);
						$('#enquirytypeInput').prop('disabled',false);
						$('#statusInput').prop('disabled',false);
						$('#followupdateInput').prop('readonly',false);
						$('#calltoInput').prop('disabled',false);
						$('#submitBtnId').prop('disabled',false);
						
						$('#getHistoryBtn').hide();
						
					}
				}
			});
	});
});
  
  function customerEnquiryHistory() {
	  var phoneNumber= $('#phonenoInput').val();
	  if (phoneNumber != '') {
		window.location.href="/custEnquiryHistoryPage?phno="+encodeURIComponent(phoneNumber);
	} 
}
  
    function handelOption() {
		var statusOption=document.getElementById('statusInput').value;
		
		if (statusOption==="1") {
			$('#followupdateInput').prop('readonly',false);
		} else {
			$('#followupdateInput').prop('readonly',true);

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
      <h3 class="mb-4">Customer Enquiry</h3>
      <form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
        <div class="mb-3">
          <label class="form-label">Phone No.</label>
          <form:input path="phoneno" cssClass="form-control" id="phonenoInput"/>
          <br>
          <button type="button" id="getHistoryBtn" class="btn btn-success" style="display: none;" onclick="customerEnquiryHistory()" >Get History	</button>
          <form:errors path="phoneno" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Name</label>
          <form:input path="customerEnquiry.name" id="nameInput" cssClass="form-control"/>
          <form:errors path="customerEnquiry.name" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Interested Course</label>
          <form:select path="customerEnquiry.interestedcourse" id="interestedcourseInput" cssClass="form-select">
          			<form:option value="">Selected Course</form:option>
          			<form:options  items="${model_coursename_list}"/>
          </form:select>
          <form:errors path="customerEnquiry.interestedcourse" cssClass="error_message_design"/>
        </div>
         <div class="mb-3">
          <label class="form-label">Discussion</label>
          <form:textarea path="customerEnquiry.discussion" id="discussionInput" cssClass="form-control"/>
          <form:errors path="customerEnquiry.discussion" cssClass="error_message_design"/>
        </div>
        
        <div class="mb-3">
          <label class="form-label">Enquiry Type</label>
          <form:select path="customerEnquiry.enquirytype" id="enquirytypeInput" cssClass="form-select">
          			<form:option value="">Selected Course</form:option>
          			<form:option value="Call">Call</form:option>
          			<form:option value="Mail">Mail</form:option>
          			<form:option value="Website">Website</form:option>
          			<form:option value="Social Networking">Social Networking</form:option>
          </form:select>
          <form:errors path="customerEnquiry.enquirytype" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Status</label>
          <form:select path="customerEnquiry.status" id="statusInput" cssClass="form-select" onchange="handelOption()">
          			<form:option value="">Selected Status</form:option>
          			<form:option value="1">Open(1)</form:option>
          			<form:option value="2">Interested - Closed(2)</form:option>
          			<form:option value="3">NOT-Interested - Closed(3)</form:option>
          			<form:option value="4">Purchased - closed(4)</form:option>
          </form:select>
          <form:errors path="customerEnquiry.status" cssClass="error_message_design"/>
        </div>
        <div class="mb-3">
          <label class="form-label">Follow up Date</label>
          <form:input type="date" path="custFollowup.followupdate" id="followupdateInput" cssClass="form-control"/>
          <form:errors path="custFollowup.followupdate" cssClass="error_message_design"/>
        </div>
         <div class="mb-3">
          <label class="form-label">Call To</label>
          <form:select path="customerEnquiry.callto" id="calltoInput" cssClass="form-select">
          			<form:option value="">Call To</form:option>
          			<form:option value="Customer to Company">Customer to Company</form:option>
          			<form:option value="Company to Customer">Company to Customer</form:option>
          			
          </form:select>
          <form:errors path="customerEnquiry.callto" cssClass="error_message_design"/>
        </div>
        
        
        
        <input type="submit" value="Add Enquiry" id="submitBtnId" class="btn btn-primary"/>
      </form:form>
    </div>
  </div>
</div>
</div>

</body>
</html>

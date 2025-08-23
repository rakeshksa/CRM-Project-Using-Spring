<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product's List</title>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Bundle JS (includes Popper.js) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
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
	
	function courseDetails(courseName) {
		window.location.href = "/courseDetails?courseName="
				+ encodeURIComponent(courseName);
	}
</script>
</head>
<body>

	<!-- HEADER SECTION -->
	<div class="container-fluid bg-primary header_design">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-3">
					<a href="profileAdmin" class="navbar-brand text-light fs-4">CRM
						Application</a>
				</div>
				<div class="col-6"></div>
				<div class="col-3 text-end">
					<a class="navbar-brand d-flex align-items-center text-light"
						href="#"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s"
						alt="Welcome Admin" class="rounded-pill me-2"> <span>Welcome
							Admin</span>
					</a> <a href="logout" class="btn btn-danger btn-sm ms-2 "
						style="margin-top: -80px">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="header-admin.jsp" />

	<c:if test="${not empty model_success}">
		<div class="row">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				${model_success}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty model_error}">
		<div class="row">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				${model_error}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>
	</c:if>


	<!-- MAIN CONTENT -->
	<div class="container mt-4">
		<h2>Product's List</h2>
		<p>Below table display only 5 Product list</p>

		<table class="table table-light table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>Course Image</th>
					<th>Course Name</th>
					<th>Course Validity</th>
					<th>Course Price</th>
					<th>Trainer Name</th>
					<th style="text-align: center;">Full Detail</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${model_products_list}">
					<tr>
						<td style="text-align: center;"> <img alt="Course Image" src="${product.getCourseimage()}"  height="120" width="120"> </td>
						<td>${product.getCoursename()}</td>
						<td>${product.getCoursevalidity()}</td>
						<td> <del style="color: red">Rs.${product.getOriginalprice()}</del>&nbsp;<b>Rs.${product.getDiscountedprice()}</b> </td>
						<td>${product.getTrainersname()}</td>
						
						
						<td style="text-align: center;">
							<button class="btn btn-secondary"
								onclick="courseDetails('${product.getCoursename()}')">
							<i class="bi bi-arrow-right-square-fill"></i>
							</button>
						</td>

						
					</tr>
				</c:forEach>

			</tbody>
		</table>

	
	</div>

</body>
</html>

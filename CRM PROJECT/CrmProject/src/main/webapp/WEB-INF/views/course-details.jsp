<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Details</title>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Bundle JS (includes Popper.js) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<!-- Optional Custom CSS -->
<style>
.header_design {
	padding: 5px 0;
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
					<a href="profileAdmin" class="navbar-brand text-light fs-4">CRM
						Application</a>
				</div>
				<div class="col-6"></div>
				<div class="col-3 text-end">
					<a class="navbar-brand d-flex align-items-center text-light"
						href="#"> <img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6rVX2wBmpOg9wwUOTRq5zgtYKDKhzGvBOAA&s"
						alt="Admin" class="rounded-pill me-2"> <span>Welcome
							Admin</span>
					</a> <a href="logout" class="btn btn-danger btn-sm ms-2 "
						style="margin-top: -80px">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="header-admin.jsp" />

	<!-- MAIN CONTENT -->
	<div class="container mt-4 bg-light ">
		<h4>Course Details</h4>
		<div class="row">

			<div class="col-4">
				<img alt="Course Image" src="${model_product.getCourseimage()}"
					height="120" width="120">

			</div>
			<div class="col-8">
				<p>
					<strong>Course Name : ${model_product.getCoursename()}</strong>
				</p>
				<p>
					<strong>Course Price : <del style="color: red">Rs.${model_product.getOriginalprice()}</del>&nbsp;Rs.${model_product.getDiscountedprice()}
					</strong>
				</p>
				<p>
					<strong>Course Validity :
						${model_product.getCoursevalidity()}</strong>
				</p>
				<p>
					<strong>Course Syllabus : ${model_product.getSyllabus()}</strong>
				</p>

			</div>
		</div>
		
		<div class="row">
		<h6>Trainer's Details</h6>

			<div class="col-4">
				<img alt="Course Image" src="${model_product.getTrainersimage()}"
					height="120" width="120">

			</div>
			<div class="col-8">
				<p>
					<strong>Trainer Name : ${model_product.getTrainersname()}</strong>
				</p>
				<p>
					<strong>Trainer Details : ${model_product.getTrainersdetails()}</strong>
				</p>
			</div>
		</div>
		<br>
		<br>
		
		<div class="row">
		<h6>Important Instruction</h6>

			
			<div class="col-8">
				<p class="text-danger">
					<strong> ${model_product.getOtherdetails()}</strong>
				</p>
				
			</div>
		</div>
		

		<!-- You can add dashboard cards or features here -->
	</div>

</body>
</html>

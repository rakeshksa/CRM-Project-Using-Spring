
<!--  
<!-- page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title> 
  <!-- Bootstrap 5 CSS 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Bootstrap Bundle JS (includes Popper.js) 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="css/style.css" type="text/css" >
</head>
<body>
  <jsp:include page="header-crm.jsp"/>
  
  
 String login_error=(String)request.getAttribute("model_error");
  %>
  
  <div class="container-fluid " >
    <div class="container  "  >
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4 bg-light login_div_design mt-3">
            
            if(login_error!=null){
            %>
            	<h5 style="color: red;">login_error %> </h5>	
		 
            }
		%>            	
            <form action="loginForm" method="post">
            
            <h3>Login Here</h3><br>
                <div class="mb-3">
                    <label for="" class="form-lable">Enter Your Email</label>
                    <input type="email" name="email1" class="form-control" >
                </div>
                 <div class="mb-3">
                    <label for="" class="form-lable">Enter Your Password</label>
                    <input type="password" name="pass1" class="form-control" >
                    <div class="form-text">we will not share your Email and password With AnyOne</div>
                </div>
                <input type="submit" value="Login" class="btn btn-primary">
            
            </form>
            </div>
            <div class="col-4"></div>
           
           
        </div>
    </div>
  </div>

</body>
</html>
-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title> 
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Bootstrap Bundle JS (includes Popper.js) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="css/style.css" type="text/css" >
</head>
<body>
  <jsp:include page="header-crm.jsp"/>
  
 
  
  <div class="container-fluid " >
    <div class="container  "  >
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4 bg-light login_div_design mt-3">
            <c:if test="${not empty model_error}">
            <h5 style="color: red;">${model_error} </h5>
            </c:if>
                       	
            <form action="loginForm" method="post">
            
            <h3>Login Here</h3><br>
                <div class="mb-3">
                    <label for="" class="form-lable">Enter Your Email</label>
                    <input type="email" name="email1" class="form-control" >
                </div>
                 <div class="mb-3">
                    <label for="" class="form-lable">Enter Your Password</label>
                    <input type="password" name="pass1" class="form-control" >
                    <div class="form-text">we will not share your Email and password With AnyOne</div>
                </div>
                <input type="submit" value="Login" class="btn btn-primary">
            
            </form>
            </div>
            <div class="col-4"></div>
           
           
        </div>
    </div>
  </div>

</body>
</html>





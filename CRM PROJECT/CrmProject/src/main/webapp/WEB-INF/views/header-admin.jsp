<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- NAVBAR SECTION -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="profileAdmin">Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="profileAdmin">Home</a>
        </li>

        <!-- Employees -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Employees</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="addEmployee">Add Employees</a></li>
            <li><a class="dropdown-item" href="emplist">Employees List</a></li>
          </ul>
        </li>

        <!-- Products -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Products</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="addProducts">Add Products</a></li>
            <li><a class="dropdown-item" href="productsList">Products List</a></li>
          </ul>
        </li>

        <!-- Complaints -->
        <li class="nav-item">
          <a class="nav-link" href="#">Sale Course</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

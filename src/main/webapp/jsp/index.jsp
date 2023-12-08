<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<title>Dashboard - PesPrint Plc</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	
	<!-- Favicons -->
	<link  href="assets/img/presprint.jpg" rel="icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
	
	<!-- Template Main CSS File -->
	<link href="assets/css/style.css"  rel="stylesheet">
	<link href="assets/css/smartsheet.css" rel="stylesheet">
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index" class="logo d-flex align-items-center"> <img src="assets/img/presprint.jpg" alt=""> 
			  <span class="d-none d-lg-block">SmartSheet</span>
			</a>
		  <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST" action="#">
				<input type="text" name="query" placeholder="Search" title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item d-block d-lg-none">
				  <a class="nav-link nav-icon search-bar-toggle " href="#">
				    <i class="bi bi-search"></i>
				  </a>
				</li>
				<!-- End Search Icon-->

				</li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3">
				  <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown"> 
				    <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle"> 
				    <span class="d-none d-md-block dropdown-toggle ps-2">Vincent</span>
				  </a>
				<!-- End Profile Iamge Icon -->

					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
						  <h6>Djama Vincent</h6> <span>Web Designer</span>
						</li>					
						<li>
						  <hr class="dropdown-divider">
						</li>
						<li>
						  <a class="dropdown-item d-flex align-items-center" onclick="loadPage('/find/{email}/{username}')" href="#">
						   <i class="bi bi-person"></i> <span>MyProfile</span>
						  </a>
						</li>
						<li>
						  <hr class="dropdown-divider">
						</li>
						<li>
						  <a class="dropdown-item d-flex align-items-center" href="#"> 
							<i class="bi bi-box-arrow-right"></i> <span>SignOut</span>
						  </a>
						</li>
					</ul>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

	
		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="pp-module"><i class="bi bi-grid">
			  </i> <span>Printing Press</span>
			</li><!-- End Printing Press Nav -->

			<li class="nav-item">
			   <a class="nav-link collapsed"data-bs-target="#user-management-nav" data-bs-toggle="collapse" href="#">
			     <i class="fas fa-user"></i><h6>Users Management</h6> <i class="bi bi-chevron-down ms-auto"></i>
			   </a>

				<ul id="user-management-nav" class="nav-content collapse "data-bs-parent="#sidebar-nav">
					<p> Users </p>
					
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="loadPage('list-users')" href="#"> <i class="bi bi-person"></i> <span>List users</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="loadPage('/create-user')" href="#"> <i class="fas fa-user"></i><span>Create user</span> </a>
					</li><!-- End Register Page Nav -->

					<p>Groups and Roles</p>

					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="loadPage('create-group')" href="#"><i class="bi bi-card-list"></i><span>Create group</span></a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="loadPage('list-groups')"  href="#" ><i class="bi bi-person"></i> <span>List groups</span></a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="loadPage('create-role')" href="#"><i class="bi bi-card-list"></i> <span>Create role</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="loadPage('list-roles')"  href="#"><i class="bi bi-card-list"></i> <span>List roles</span> </a>
					</li> <!-- End list Role Page Nav -->					
				</ul> 
				<!-- End of user management Nav -->
				
				<!-- start of job sheet management Nav -->
				<li class="nav-item">
			    <a class="nav-link collapsed"data-bs-target="#jobsheet-management-nav" data-bs-toggle="collapse" href="#">
			      <i class="fas fa-users-cog"></i><h6>Job Sheet Management</h6> <i class="bi bi-chevron-down ms-auto"></i>
			    </a>
				<ul id="jobsheet-management-nav" class="nav-content collapse "data-bs-parent="#sidebar-nav">
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="getListOfUser()" href="#"> <i class="bi bi-person"></i> <span>List job sheets</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" href="user-pages-register"> <i class="fas fa-user"></i><span>Create job Sheet</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" href="#"> <i class="bi bi-person"></i> <span>Search job Sheet</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" href="list-groupes.jsp"><i class="bi bi-card-list"></i><span>List control Sheets</span></a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed"  href="#" ><i class="bi bi-person"></i> <span>Search control Sheet</span></a>
					</li><!-- End search control sheet Nav -->				
				</ul> 
				<!-- End of job sheet management Nav -->
				
				<!-- start of bill management Nav -->
				<li class="nav-item">
			    <a class="nav-link collapsed"data-bs-target="#bill-management-nav" data-bs-toggle="collapse" href="#">
			      <i class="fas fa-receipt"></i><h6>Bill Management</h6> <i class="bi bi-chevron-down ms-auto"></i>
			    </a>
				<ul id="bill-management-nav" class="nav-content collapse "data-bs-parent="#sidebar-nav">					
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="getListOfUser()" href="#"> <i class="bi bi-person"></i> <span>List of bill</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" href="user-pages-register"> <i class="fas fa-user"></i><span>Search bill</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" href="#"> <i class="bi bi-person"></i> <span>List of proforma</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed"  href="#" ><i class="bi bi-person"></i> <span>Search proforma</span></a>
					</li>			
				</ul> 
				<!-- End of bill management Nav -->
				
				<!-- Start of production management Nav -->
				<li class="nav-item">
			    <a class="nav-link collapsed"data-bs-target="#production-management-nav" data-bs-toggle="collapse" href="#">
			      <i class="fas fa-cogs"></i><h6>Production Management</h6> <i class="bi bi-chevron-down ms-auto"></i>
			    </a>
				<ul id="production-management-nav" class="nav-content collapse "data-bs-parent="#sidebar-nav">
					<li class="nav-item">
					  <a class="nav-link collapsed" onclick="getListOfUser()" href="#"> <i class="bi bi-person"></i> <span>List jobs</span> </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link collapsed" href="user-pages-register"> <i class="fas fa-user"></i><span>Search job</span> </a>
					</li>
				</ul> 
				<!-- End of production management Nav -->
				
			<li class="pp-module"><i class="bi bi-grid">
			  </i> <span>Fabric Printing</span>
			</li>
			<li class="pp-module"><i class="bi bi-grid">
			  </i> <span>Screen Printing</span>
			</li>
		   </ul>
		</aside><!-- End Sidebar-->

		<main id="main" class="main">
			<div class="pagetitle">
				<h1>Dashboard</h1>
				<nav>
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="index">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				  </ol>
				</nav>
			</div>
			<section  class="section dashboard">
			  <div class="row">
			    <!-- Left side columns -->
				  <div id="main-content" class="row"></div>
			  </div>
			</section>
	</main>
	 <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
	<footer id="footer" class="footer">
	  <div class="copyright">  &copy; Copyright <strong><span>SmartSheet</span></strong>. All Rights Reserved </div>
	  <div class="credits"> Designed by <a href="https://bootstrapmade.com/">PresPrint Plc</a> </div>
	</footer><!-- End Footer -->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/app.js"></script>
  <script src="assets/js/users.js"></script>
  <script src="assets/js/role.js"></script>
  

</body>

</html>
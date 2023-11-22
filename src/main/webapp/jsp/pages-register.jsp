<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="ISO-8859-1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Pages / Register - PrePrint Pcl</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<main>
		<div class="container">

			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div
							class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

							<div class="d-flex justify-content-center py-4">
								<a href="index.html"
									class="logo d-flex align-items-center w-auto"> <img
									src="assets/img/logo.png" alt=""> <span
									class="d-none d-lg-block">SmartSheet</span>
								</a>
							</div>
							<!-- End Logo -->

							<div class="card mb-3">

								<div class="card-body">

									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Create an
											Account</h5>
										<p class="text-center small">Enter the personal details to
											create the user account</p>
									</div>

									<c:url var="add_user_url" value="user-pages-register/save"></c:url>
									<form:form class="row g-3 needs-validation"
										action="${add_user_url}" method="POST" modelAttribute="user">

										<div class="col-12">
											<form:label path="firstName" class="form-label">First name</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text"><i class="fas fa-user"></i></span>
												<form:input path="firstName" class="form-control" />
												<div class="invalid-feedback">Please, enter your first
													name!</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="lastName" class="form-label">Last name</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text"><i class="fas fa-user"></i></span>
												<form:input path="lastName" class="form-control" />
												<div class="invalid-feedback">Please, enter your last
													name!</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="Email" class="form-label">Email</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text"><i
													class="fas fa-envelope"></i></span>
												<form:input path="email" class="form-control" />
												<div class="invalid-feedback">Please enter a valid
													Email address!</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="Username" class="form-label">Username</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text" id="inputGroupPrepend">@</span>
												<form:input path="username" class="form-control" />
												<div class="invalid-feedback">Please choose a
													username.</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="Password" class="form-label">Password</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text"><i class="fas fa-lock"></i></span>
												<form:password path="password" class="form-control" />
												<div class="invalid-feedback">Please choose a
													username.</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="mobile" class="form-label">Mobile</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text"><i
													class="fas fa-phone"></i></span>
												<form:input path="mobile" pattern="[0-9]{10}"
													class="form-control" />
												<div class="invalid-feedback">Please enter your
													address!</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="address" class="form-label">Address</form:label>
											<div class="input-group has-validation">
												<span class="input-group-text"><i
													class="fas fa-map-marker-alt"></i></span>
												<form:input path="address" class="form-control" />
												<div class="invalid-feedback">Please enter your
													address!</div>
											</div>
										</div>

										<div class="col-12">
											<form:label path="groupe" id="groupeSelect"
												class="form-label">Select group</form:label>
											<div class="input-group has-validation">
												<form:select path="groupe" class="form-control"  name="groupe">
													<c:forEach items="${groups}" var="group">
														<option value="${group.id}">${group.name}</option>
													</c:forEach>
												</form:select>
												<form:errors path="groupe" class="invalid-feedback">Please sect the group !</form:errors>
											</div>
										</div>

										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" name="terms" type="checkbox"
													value="" id="acceptTerms" required> <label
													class="form-check-label" for="acceptTerms">I agree
													and accept the <a href="#">terms and conditions</a>
												</label>
												<div class="invalid-feedback">You must agree before
													submitting.</div>
											</div>
										</div>

										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Create
												Account</button>
										</div>
										<div class="col-12">
											<p class="small mb-0">
												Already have an account? <a href="user/pages-login">Log
													in</a>
											</p>
										</div>
									</form:form>

								</div>
							</div>

							<div class="credits">
								<!-- All the links in the footer should remain intact. -->
								<!-- You can delete the links only if you purchased the pro version. -->
								<!-- Licensing information: https://bootstrapmade.com/license/ -->
								<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
								Designed by <a href="https://bootstrapmade.com/">PresPrint
									Pcl</a>
							</div>

						</div>
					</div>
				</div>

			</section>

		</div>
	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>
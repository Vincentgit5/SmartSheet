<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="assets/css/add-user.css" rel="stylesheet">

<main id="add-user">
	<div class="container">
		<div class="pagetitle">
			<nav>
				<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/"> <fmt:message key="breadcrumbs.home"/></a></li>
		            <li class="breadcrumb-item"> <fmt:message key="breadcrumbs.form"/></li>
		            <li class="breadcrumb-item active"><fmt:message key="breadcrumbs.user"/></li>
				</ol>
			</nav>
		</div>

		<section>
			<div class="card">
				<div class="card-body">
					<h5 class="card-title text-center pb-0 fs-4"><fmt:message key="user.create.acount"/></h5>
					<p class="text-center small"><fmt:message key="user.personal.information"/></p>

					<form class="row g-3 needs-validation"
						onsubmit="event.preventDefault(); addUser()">
						<div class="col-md-6">
							<label for="firstName" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
								<input type="text" id="firstName" name="firstName"
									class="form-control" placeholder="<fmt:message key="user.firstname"/>"
									required="required" />
							</div>
							<div id="emptyNameAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="Email" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"><i class="fas fa-envelope"></i></span>
								<input type="email" id="email" name="email" class="form-control"
									placeholder="<fmt:message key="user.email"/>" required="required" />
							</div>
							<div id="emptyEmailAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="lastName" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
								<input type="text" id="lastName" name="lastName"
									class="form-control" placeholder="<fmt:message key="user.lastname"/>"
									required="required" />
							</div>
							<div id="emptyLastNameAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="mobile" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"><i class="fas fa-phone"></i></span>
								<input type="text" id="mobile" name="mobile"
									class="form-control" placeholder="<fmt:message key="user.mobile"/> " required="required" />
							</div>
							<div id="emptyNameAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="username" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text" id="inputGroupPrepend">@</span> <input
									type="text" id="username" name="username" class="form-control"
									placeholder="<fmt:message key="user.username"/>" required="required" />
							</div>
							<div id="emptyUserameAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="address" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"> <i
									class="fas fa-map-marker-alt"></i></span> <input type="text"
									id="address" name="address" class="form-control"
									placeholder="<fmt:message key="user.adress"/>" required="required" />
							</div>
							<div id="emptyAddressAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="Password" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"><i class="fas fa-lock"></i></span>
								<input type="password" id="password" name="password"
									class="form-control" placeholder="<fmt:message key="user.password"/>" required="required" />
							</div>
							<div id="emptyPasswordAlert"
								class="alert alert-danger alert-dismissible fade show"
								role="alert" style="display: none;"></div>
						</div>
						<div class="col-md-6">
							<label for="ImageFile" class="form-label"></label>
							<div class="input-group has-validation">
								<input type="file" id="imageFile" name="imageFile"
									class="form-control" accept="image/*">
							</div>
						</div>
						<div class="col-md-6">
							<label for="groupe" id="groupeLabel" class="form-label"></label>
							<div class="input-group has-validation">
								<span class="input-group-text"> <i class="fas fa-users"></i>
								</span> <select id="groupe" name="groupe" class="form-select">
									<c:forEach items="${groups}" var="group">
										<option value="${group.name}">${group.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<input type="button" data-bs-toggle="modal" id="create-btn"
								onclick="loadPage('/user/list-users'); addUser()"
								class="btn btn-primary w-100" value="<fmt:message key="bnt.save"/>">
						</div>

						<!--------------User created successfully modal ------------->
						<div class="modal fade" id="verticalycentered" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" onclick="loadPage('/user/list-users')"
											class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										<img src="assets/img/success_icon.png" alt="">
										<p><fmt:message key="modal.created" /></p>
									</div>
								</div>
							</div>
						</div>
						<!--------------Email already exist modal ------------->
						<div class="modal fade" id="emailAlreadyExist" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" onclick="loadPage('/user/list-users')"
											class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										<img src="assets/img/error.png" alt="">
										<p><fmt:message key="modal.error"/></p>
									</div>
								</div>
							</div>
						</div>
						<!-------------- Something when wrong Modal ------------->
						<div class="modal fade" id="somethingWhenWrong" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
										<img src="assets/img/success_icon.png" alt="">
										<p><fmt:message key="" /></p>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
</main>
<!-- End #main -->
<script src="assets/js/users.js"></script>

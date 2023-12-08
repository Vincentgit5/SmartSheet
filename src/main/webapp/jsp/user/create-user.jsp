<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<main id="create-user">
		<div class="container">

			<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

							<div class="card mb-3">
							  	<div class="card-body">
							  	
									<div class="pt-4 pb-2">
									  <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
									  <p class="text-center small">Enter the personal details to create the user account</p>
									</div>

									<c:url var="add_user_url" value="user-pages-register"></c:url>
									<form class="row g-3 needs-validation" action="${add_user_url}" method="POST" modelAttribute="user">
										<div class="col-12">
										  <label for="firstName" class="form-label">First name</label>
										  <div class="input-group has-validation"> 
										    <span class="input-group-text"><i class="fas fa-user"></i></span>
											<input type="text"  id="firstName" name="firstName" class="form-control" />
											<div class="invalid-feedback">Please, enter the first name!</div>
										  </div>
										</div>
										<div class="col-12">
										  <label for="lastName" class="form-label">Last name</label>
										  <div class="input-group has-validation">
											<span class="input-group-text"><i class="fas fa-user"></i></span>
											<input type="text" id="lastName" name="lastName" class="form-control" />
										    <div class="invalid-feedback">Please, enter the last name!</div>
										  </div>
										</div>
										<div class="col-12">
										  <label for="Email" class="form-label">Email</label>
										  <div class="input-group has-validation">
										    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
											<input type="email" id="email" name="email" class="form-control" />
										    <div class="invalid-feedback">Please enter a valid Email address!</div>
										  </div>
										</div>
										<div class="col-12">
										  <label for="username" class="form-label">Username</label>
										  <div class="input-group has-validation">
										    <span class="input-group-text" id="inputGroupPrepend">@</span>
											<input type="text" id="username" name="username" class="form-control" />
											<div class="invalid-feedback">Please choose the username.</div>
										  </div>
										</div>
										<div class="col-12">
										  <label for="Password" class="form-label">Password</label>
										  <div class="input-group has-validation">
											<span class="input-group-text"><i class="fas fa-lock"></i></span>
											<input type="password" id="password" name="password" class="form-control"></input>
										    <div class="invalid-feedback">Please enter the password !</div>
										  </div>
										</div>
										<div class="col-12">
										  <label for="mobile" class="form-label">Mobile</label>
										  <div class="input-group has-validation">
										     <span class="input-group-text"><i class="fas fa-phone"></i></span>
											 <input type="text" id="mobile" name="mobile" class="form-control" />
											 <div class="invalid-feedback">Please enter the mobile!</div>
										  </div>
										</div>
								    	<div class="col-12">
								 		   <label for="address" class="form-label">Address</label>
								 		   <div class="input-group has-validation"> <span class="input-group-text">
								 			  <i class="fas fa-map-marker-alt"></i></span>
								 			  <input type="text"  id="address" name="address" class="form-control" />
								 			  <div class="invalid-feedback">Please enter your address!</div>
								 		   </div>
								 		 </div>
										 <div class="col-12">
										   <label for="groupe" id="groupeSelect" class="form-label">Select group</label>
										   <div class="input-group has-validation">
										     <select id="groupe" class="form-control" name="groupe">
										 	  <c:forEach items="${groups}" var="group"> <option value="${group.id}">${group.name}</option></c:forEach>
										 	</select>
										 	<div class="invalid-feedback">Please sect the group !</div>
										   </div>
										 </div>
									 	<div class="col-12">
									 	  <div class="form-check">
									 		<input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
									 		  <label class="form-check-label" for="acceptTerms">I agree and accept the 
									 			<a href="#">terms and conditions</a>
									 		  </label>
									 		  <div class="invalid-feedback">You must agree before submitting.</div>
									 	  </div>
									 	</div>
										<div class="col-12">
										  <button class="btn btn-primary w-100" type="submit">Create Account</button>
										</div>
									
										<div class="col-12">
										  <p class="small mb-0">Already have an account? <a href="user/pages-login">Login</a></p>
										</div>
										
								 	 </form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
		</div>
	</main>
	<!-- End #main -->

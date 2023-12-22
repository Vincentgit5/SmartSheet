<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link href="assets/css/add-user.css"  rel="stylesheet">

	<main id="add-user">
		<div class="container" >
		<div class="pagetitle">
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Form</li>
          <li class="breadcrumb-item active">User</li>
        </ol>
      </nav>
    </div>

			<section >
				<div class="card">
	            <div class="card-body">
	              <h5 class="card-title text-center pb-0 fs-4">Create an Account
					<p class="text-center small">Enter the personal details to create the user account</p>
				  </h5>

              		<form id="myForm" class="row g-3 needs-validation" onsubmit="event.preventDefault(); addUser()">
					  <div class="col-md-6">
					   <label for="firstName" class="form-label"></label>
					   <div class="input-group has-validation">
						 <span class="input-group-text"><i class="fas fa-user"></i></span>
						 <input type="text" id="firstName" name="firstName" class="form-control" placeholder="First name" required="required" />
					   </div>
					   <div id="emptyNameAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
					 </div>
					 <div class="col-md-6">
					   <label for="Email" class="form-label"></label>
					   <div class="input-group has-validation">
					     <span class="input-group-text"><i class="fas fa-envelope"></i></span>
						 <input type="email" id="email" name="email" class="form-control" placeholder="Email" required="required" />
					  </div>
					   <div id="emptyEmailAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
					 </div>
					 <div class="col-md-6">
					   <label for="lastName" class="form-label"></label>
					   <div class="input-group has-validation">
						 <span class="input-group-text"><i class="fas fa-user"></i></span>
						 <input type="text" id="lastName" name="lastName" class="form-control" placeholder="Last name" required="required" />
					   </div>
					   <div id="emptyLastNameAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
					 </div>
					 <div class="col-md-6">
					   <label for="mobile" class="form-label"></label>
					   <div class="input-group has-validation">
						 <span class="input-group-text"><i class="fas fa-phone"></i></span>
						 <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Mobile" required="required" />
					   </div>
					   <div id="emptyNameAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
					 </div>
					  <div class="col-md-6">
					   <label for="username" class="form-label"></label>
					   <div class="input-group has-validation">
					     <span class="input-group-text" id="inputGroupPrepend">@</span>
						 <input type="text" id="username" name="username" class="form-control" placeholder="User name" required="required"/>
					   </div>
					   <div id="emptyUserameAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
					 </div>
					 <div class="col-md-6">
			            <label for="address" class="form-label"></label>
			            <div class="input-group has-validation"> <span class="input-group-text">
					      <i class="fas fa-map-marker-alt"></i></span>
					      <input type="text"  id="address" name="address" class="form-control" placeholder="Address" required="required"/>
					    </div>
				        <div id="emptyAddressAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
				      </div>
				      <div class="col-md-6">
					   <label for="Password" class="form-label"></label>
					   <div class="input-group has-validation">
						 <span class="input-group-text"><i class="fas fa-lock"></i></span>
						 <input type="password" id="password" name="password" class="form-control" placeholder="Password" required="required"/>
					   </div>
					   <div id="emptyPasswordAlert" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;"></div>
					 </div>
					  <div class="col-md-6">
					   <label for="groupe" id="groupeLabel" class="form-label"></label>
						<div class="input-group has-validation">
						  <span class="input-group-text">
						    <i class="fas fa-users"></i>
						  </span>
						  <select id="groupe" name="groupe" class="form-select">
        				    <c:forEach items="${groups}" var="group">
           				      <option value="${group.name}">${group.name}</option>
        				    </c:forEach>
    					  </select>
						</div>
						</div>
					 <div class="col-md-3">
			           <p class="small mb-0">Already have an account? <a href="user/pages-login">Login</a></p>
			         </div>
                     <div class="col-md-6">
                       <input data-bs-toggle="modal"  onclick="addUser()" id="create-btn"  class="btn btn-primary" type="button" value="Save">
                   	 </div>
                  <!--------------User created successfully modal ------------->
                   	 <div class="modal fade" id="verticalycentered" tabindex="-1">
	                 <div class="modal-dialog modal-dialog-centered">
	                   <div class="modal-content">
	                     <div class="modal-header">
	                       <h5 class="modal-title">Success</h5>
	                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                     </div>
	                     <div class="modal-body">
	                       <img src="assets/img/success_icon.png" alt="">
	                       <p>User created successfully</p>
	                     </div>
	                   </div>
	                 </div>
	               </div>
	               <!--------------Email already exist modal ------------->
                   <div class="modal fade" id="verticalycentered1" tabindex="-1">
	                 <div class="modal-dialog modal-dialog-centered">
	                     <div class="alert alert-danger alert-dismissible fade show" role="alert">
			                <i class="bi bi-exclamation-octagon me-1"></i>
			                <p> Email already exist : please check another Email address</p>
			                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		                 </div>
	                 </div>
	               </div>
	               <!-------------- Something when wrong Modal ------------->
                   <div class="modal fade" id="verticalycentered2" tabindex="-1">
	                 <div class="modal-dialog modal-dialog-centered">
	                   <div class="modal-content">
	                     <div class="modal-header">
	                       <h5 class="modal-title">Error</h5>
	                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                     </div>
	                     <div class="modal-body">
	                       <img src="assets/img/success_icon.png" alt="">
	                       <p>Something when wrong with the server</p>
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

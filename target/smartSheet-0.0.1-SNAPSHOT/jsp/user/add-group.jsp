<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="assets/css/groups.css"  rel="stylesheet">
 <main id="create-group" class="main">
 	<div class="pagetitle">
         <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/">Home</a></li>
          <li class="breadcrumb-item">Form</li>
          <li class="breadcrumb-item active">Group</li>
        </ol>
      </nav>
    </div>
 
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Add Group</h5>
                    <p class="text-center small">Group informations</p>
                  </div>
                  <form  class="row g-3 needs-validation">
                    <div class="col-12">
                        <label for="name" class="form-label">Name</label>
                     	 <div class="input-group has-validation">
                        <input type="text" id="name" name="name" class="form-control" />
                      <div class="invalid-feedback">Please, enter the role name!</div>
                      </div>
                    </div>
                    <div class="col-12">
                       <label for="description" class="form-label">Description</label>
                      <div class="input-group has-validation">
                         <textarea  id="description" name="description" class="form-control">...</textarea>
                      </div>
                    </div>
                   <div class="col-12">
					  <label class="ids">Select Role</label>
					    <div class="input-group has-validation border p-3">
					    <c:forEach items="${roles}" var="role">
					      <input class="check-box" type="checkbox" value="${role.name}" id="role_${role.name}" name="ids" class="form-check-input">
					      <label for="role_${role.name}">${role.name}</label><br>
					    </c:forEach>
					    <form:errors path="ids" class="invalid-feedback">Please select at least one role!</form:errors>
					  </div>
					</div>
                    <div class="col-12">
                      <input type="button" data-bs-toggle="modal" id="create-btn" onclick="addGroupe()" class="btn btn-primary w-100"  value="Save"/>
                     </div>
                      <!-------------- User created successfully modal ------------->
                   	 <div class="modal fade" id="groupCreatedSuccessfuly" tabindex="-1">
	                 <div class="modal-dialog modal-dialog-centered">
	                   <div class="modal-content">
	                     <div class="modal-header">
	                       <h5 class="modal-title">Success</h5>
	                       <button type="button" onclick="loadPage('/group/list-groups')" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                     </div>
	                     <div class="modal-body">
	                       <img src="assets/img/success_icon.png" alt="">
	                       <p>User created successfully</p>
	                     </div>
	                   </div>
	                 </div>
	               </div>
	                <div class="modal fade" id="verticalycentered1" tabindex="-1">
	                 <div class="modal-dialog somethinWhenWrog">
	                     <div class="alert alert-danger alert-dismissible fade show" role="alert">
			                <i class="bi bi-exclamation-octagon me-1"></i>
			                <p> Something when wrong </p>
			                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		                 </div>
	                 </div>
	               </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
  </main><!-- End #main -->
  
 <script src="assets/js/groups.js"></script>
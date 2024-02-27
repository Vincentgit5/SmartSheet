
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/profile.css" rel="stylesheet">

  <main id="users-list" class="main">
		<div class="pagetitle">
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="/"><fmt:message key="breadcrumbs.home"/></a></li>
	          <li class="breadcrumb-item"><fmt:message key="breadcrumbs.user"/></li>
	          <li class="breadcrumb-item active"><fmt:message key="breadcrumbs.profile"/></li>
	        </ol>
	      </nav>
	    </div>
  

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
              <img src="/download/${userFind.imagePath}" alt="Profile" class="rounded-circle">
              <h2>${userFind.firstName} ${userFind.username}</h2>
              <h3>${userFind.groupe.name}</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-telephone"></i> ${userFind.mobile}</a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-8">
          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">
                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview"><fmt:message key="details.overview"/></button>
                </li>
                <li class="nav-item">
                  <button class="nav-link"  data-bs-toggle="tab" data-bs-target="#profile-edit"><fmt:message key="edit.profile"/></button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password"><fmt:message key="user.change.password"/></button>
                </li>
              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                 
                  <h5 class="card-title"><fmt:message key="user.profile.details"/></h5>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label "><fmt:message key="user.name"/> :</div>
                    <div class="col-lg-9 col-md-8">${userFind.lastName} ${userFind.firstName}</div>
                  </div>
                   <div class="row">
                    <div class="col-lg-3 col-md-4 label "> <fmt:message key="useser.usernamer.name"/> :</div>
                    <div class="col-lg-9 col-md-8">${userFind.username}</div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Group :</div>
                    <div class="col-lg-9 col-md-8">${userFind.groupe.name}</div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="user.adress"/> :</div>
                    <div class="col-lg-9 col-md-8">${userFind.address}</div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="user.mobile"/> :</div>
                    <div class="col-lg-9 col-md-8">${userFind.mobile}</div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="user.email"/> :</div>
                    <div class="col-lg-9 col-md-8">${userFind.email}</div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="group.createtad"/> :</div>
                    <div class="col-lg-9 col-md-8">${userFind.createdAt}</div>
                  </div>
                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form>
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.profile.image"/></label>
                      <div class="col-md-8 col-lg-9">
                        <img src="/download/${userFind.imagePath}" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div> 
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="firstName" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.firstname"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="firstName" type="text" class="form-control" id="firstName" value="${userFind.firstName}">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="lastName" class="col-md-4 col-lg-3 col-form-label"> <fmt:message key="user.lastname"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="lastName" type="text" class="form-control" id="lastName" value="${userFind.lastName}">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="username" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.username"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="username" type="text" class="form-control" id="username" value="${userFind.username}">
                      </div>
                    </div>
                     <div class="row mb-3">
                      <label for="email" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.email"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="email" class="form-control" id="email" value="${userFind.email}">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="address" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.adress"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address" type="text" class="form-control" id="address" value="${userFind.address}">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="mobile" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.mobile"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="mobile" type="text" class="form-control" id="mobile" value="${userFind.mobile}">
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="mobile" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.date"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="mobile" type="text" class="form-control" id="mobile" value="${userFind.createdAt}" readonly="readonly">
                      </div>
                    </div>
                    <div class="text-center">
                      <input data-bs-toggle="modal" type="button"  onclick="updateUserById('${userFind.id}')" class="btn btn-primary" value="Save Changes"/>
                    </div>
                  <!--------------User updated successfully modal ------------->
	              <div class="modal fade" id="userUdatedSuccessfully" tabindex="-1">
		            <div class="modal-dialog modal-dialog-centered">
		              <div class="modal-content">
		                  <button onclick="loadPage('/user/list-users')" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                <div class="modal-body">
		                  <img src="assets/img/success_icon.png" alt="">
		                  <p><fmt:message key="modal.updeted"/></p>
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="modal fade" id="userNotDeleted" tabindex="-1">
		            <div class="modal-dialog modal-dialog-centered">
		              <div class="alert alert-danger alert-dismissible fade show" role="alert">
				        <i class="bi bi-exclamation-octagon me-1"></i>
				        <p> <fmt:message key="modal.server.error"/></p>
				        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			          </div>
		            </div>
		          </div>
                  </form><!-- End Profile Edit Form -->
                </div>				
                <div class="tab-pane fade pt-3" id="profile-change-password">
                
                  <!-- Change Password Form -->
                  <form>
                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.curent.password"/></label>
                      <div class="col-md-8 col-lg-9">
                        <input name="currentPassword" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.new.password"/></label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newPassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="confirmPassword" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="user.confirm.password"/></label>
                      <div class="col-md-8 col-lg-9">
                        <input name="confirmPassword" type="password" class="form-control" id="confirmPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <input type="button" onclick="updatePassword()" class="btn btn-primary" value="<fmt:message key="user.change.password"/>">
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
  
  <script src="assets/js/users.js"></script>
  
  
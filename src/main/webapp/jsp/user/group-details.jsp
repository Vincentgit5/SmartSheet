<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/css/profile.css" rel="stylesheet">

  <main id="group-details">
		<div class="pagetitle">
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="/"><fmt:message key="breadcrumbs.home" /></a></li>
	          <li class="breadcrumb-item"><fmt:message key="breadcrumbs.group" /></li>
	          <li class="breadcrumb-item active"><fmt:message key="breadcrumbs.details" /></li>
	        </ol>
	      </nav>
	    </div>
  

   <section class="section profile">

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview"><fmt:message key="details.overview" /></button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit"><fmt:message key="edit.details" /></button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">

                  <h5 class="card-title"><fmt:message key="group.details"/></h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="group.name"/> :</div>
                    <div class="col-lg-9 col-md-8">${existingGroupe.name}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="group.description"/> :</div>
                    <div class="col-lg-9 col-md-8">${existingGroupe.description}</div>
                  </div>

                  <div class="row">
				  <div class="col-lg-3 col-md-4 label "><fmt:message key="group.role"/> :</div>
				  <div class="col-lg-9 col-md-8">
				    <div class="row">
				      <c:forEach var="role" items="${existingGroupe.groupRoles}">
				        <div class="col-lg-6 col-md-6" style="font-size: 13px;">${role.role.name}</div>
				      </c:forEach>
				    </div>
				  </div>
				</div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label"><fmt:message key="group.createdat"/> :</div>
                    <div class="col-lg-9 col-md-8">${existingGroupe.createdAt}</div>
                  </div>
                  
                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form>
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="group.name"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="fullName" type="text" class="form-control" id="name" value="${existingGroupe.name}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="about" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="group.description"/> :</label>
                      <div class="col-md-8 col-lg-9">
                        <textarea name="about" class="form-control" id="description" style="height: 100px">${existingGroupe.description}</textarea>
                      </div>
                    </div>
                    
                    <div class="col-md-10">
					  <div class="row mb-3">
					    <label class="about col-md-4 col-lg-3 col-form-label"><fmt:message key="group.role"/> :</label>
					<div class="col-md-6 ml-md-n20">
						  <div class="input-group has-validation border p-3 d-flex flex-column">
						    <div class="scrollable-div">
						      <c:forEach items="${roles}" var="role" varStatus="loop">
						        <div class="role-column-${loop.index % 2}">
						          <input class="check-box" type="checkbox" value="${role.name}" id="role_${role.name}" name="ids" class="form-check-input"
						            <c:forEach var="rolechecked" items="${existingGroupe.groupRoles}">
						              <c:if test="${rolechecked.role.name == role.name}">checked</c:if>
						            </c:forEach>
						          >
						          <label for="role_${role.id}" style="color: black; font-weight: normal; font-size: 13px;">${role.name}</label>
						        </div>
						      </c:forEach>
						    </div>
						  </div>
						</div>
					  </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="company" class="col-md-4 col-lg-3 col-form-label"><fmt:message key="group.createtad"/> </label>
                      <div class="col-md-8 col-lg-9">
                        <input name="company" type="text" class="form-control" id="company" value="${existingGroupe.createdAt}" readonly="readonly">
                      </div>
                    </div>       
                    
                    <div class="text-center">
                      <input type="button" data-bs-dismiss="modal" onclick="updateGroupe('${existingGroupe.name}')" class="btn btn-primary" value="Save Changes">
                    </div>
                    
                    <!-------------- Group updated successfully modal ------------->
	              <div class="modal fade" id="groupUdatedSuccessfully" tabindex="-1">
		            <div class="modal-dialog modal-dialog-centered">
		              <div class="modal-content">
		                  <input onclick="loadPage('/group/list-groups')" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
		                <div class="modal-body">
		                  <img src="assets/img/success_icon.png" alt="">
		                  <p><fmt:message key="modal.group.updated"/></p>
		                </div>
		              </div>
		            </div>
		          </div>
		          <!-------------- Something when wrong modal ------------->
		           <div class="modal fade" id="userNotDeleted" tabindex="-1">
		            <div class="modal-dialog modal-dialog-centered">
		              <div class="alert alert-danger alert-dismissible fade show" role="alert">
				        <i class="bi bi-exclamation-octagon me-1"></i>
				        <p><fmt:message key="modal.group.notupdated"/></p>
				        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			          </div>
		            </div>
		          </div>
                  </form><!-- End Profile Edit Form -->
                </div>              
              </div><!-- End Bordered Tabs -->
            </div>
          </div>
        </div>
    </section>
  </main><!-- End #main -->
  <link href="assets/css/group-details.css" rel="stylesheet">
  <script src="assets/js/users.js"></script>
  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main id="create-role" class="main">

     <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
            
              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Create Role</h5>
                    <p class="text-center small">Role informations</p>
                  </div>

				  <c:url var="add_groupe_url" value="role-pages-register"></c:url>
                  <form:form class="row g-3 needs-validation" action="${add_role_url}" method="POST" modelAttribute="role"  >
                    
                    <div class="col-12">
                        <form:label path="name" class="form-label">Name</form:label>
                      <div class="input-group has-validation">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                          <form:input path="name" class="form-control" />
                      <div class="invalid-feedback">Please, enter the role name!</div>
                      </div>
                    </div>
                    <div class="col-12">
                       <form:label path="description" class="form-label">Description</form:label>
                      <div class="input-group has-validation">
                         <form:textarea path="description" class="form-control" />
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Create Role</button>
                     </div>
                     <div class="col-12">
                    </div>
                                 
                  </form:form>

                </div>
              </div>
            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->
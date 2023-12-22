<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <link href="assets/css/list-users.css" rel="stylesheet">
 
  <main id="users-list" class="main">
  <div class="pagetitle">
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">User</li>
          <li class="breadcrumb-item active">List</li>
        </ol>
      </nav>
    </div>
    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Users list</h5>
			   <div class="create-buton-div">
			    <button onclick="loadPage('/user/add-user')" type="button" class="btn btn-primary">Add User</button>
              </div>
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">N°</th>
                    <th scope="col">Name(s)</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Group</th>
                    <th scope="col">Mobile</th>
                    <th scope="col">Date</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}" varStatus="loop">
                  <tr class="${loop.index % 2 == 0 ? 'even-row' : 'odd-row'}">
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.address}</td>
                    <td>${user.groupe.name}</td>
                    <td>${user.mobile}</td>
                    <td>${user.createdAt}</td>
                    <td>
                      <button class="button-see" onclick="loadPage('user/viewUser/${user.username}')"><i class="fas fa-eye"></i></button>
                      <button class="button-edite" onclick="loadPage('user/update/${user.username}')"><i class="fas fa-pencil-alt"></i></button>
				      <button class="button-delete" onclick="getUserByUsername('${user.username}')" data-bs-toggle="modal"><i class="fas fa-trash-alt"></i></button>
                    </td>
                  </tr>
                 </c:forEach>          
                 </tbody>  
              </table>
              <!--------------Are you sure you want t delete this user? modal ------------->
              <div class="modal fade" id="areyouSureYouWantToDetele" tabindex="-1">
	           <div class="modal-dialog modal-dialog-centered">
	             <div class="modal-content">
	               <div class="modal-heade">
	                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	               </div>
	               <div class="modal-body">
	                 <img src="assets/img/delete_icon.jpg" alt="">
	                 <h5>Are you sure ?</h5>
	                	<p>This action will delete all the user informations. You won't be able to revert this.</p>
	               </div>
	               <div class="modal-foote">
                      <button type="button" id="cancelButton" class="btn btn-primary" data-bs-dismiss="modal">Cancel</button>
                      <button type="button" id="yesButton" onclick="removeUser('${user.username}')" data-bs-toggle="modal" class="btn btn-danger">Yes</button>
                    </div>
	             </div>
	           </div>
	          </div>
	          <!--------------User deleted successfully modal ------------->
              <div class="modal fade" id="userDeleteSuccessfully" tabindex="-1">
	            <div class="modal-dialog modal-dialog-centered">
	              <div class="modal-content">
	                <div class="modal-header">
	                  <h5 class="modal-title">Success</h5>
	                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                  <img src="assets/img/success_icon.png" alt="">
	                  <p>User deleted successfully</p>
	                </div>
	              </div>
	            </div>
	          </div>
			 <!------------------Deleted error------------------------------>
	          <div class="modal fade" id="somthingwhenwrong" tabindex="-1">
	            <div class="modal-dialog modal-dialog-centered">
	              <div class="alert alert-danger alert-dismissible fade show" role="alert">
			        <i class="bi bi-exclamation-octagon me-1"></i>
			        <p> Something when wrong User did not deleted ! Please try again</p>
			        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		          </div>
	            </div>
	          </div>
              <!-- End Table with stripped rows -->
               <!-- Right/End Aligned Pagination -->
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </ul>
              </nav><!-- End Right/End Aligned Pagination -->
            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
  
<script src="assets/js/users.js"></script>
  
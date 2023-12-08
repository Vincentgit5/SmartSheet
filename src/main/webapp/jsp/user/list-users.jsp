<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <link href="assets/css/list-users.css" rel="stylesheet"> 
 
  <main id="users-list" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Users list</h5>
			   <div class="create-buton-div">
              	<a onclick="loadPage('/create-user')" href="#"><input class=" create-button" type="button" value="Create"></a>
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
                <c:forEach var="user" items="${users}">
                  <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.address}</td>
                    <td>${user.groupe.name}</td>
                    <td>${user.mobile}</td>
                    <td>${user.createdAt}</td>
                    <td>
                      <button class="button-icon" onclick="loadPage('user-profile')"><i class="fas fa-pen-alt"></i></button>
				      <button class="button-delete"onclick="document.getElementById('user').style.display='block'"><i class="fas fa-trash-alt"></i></button>
				        <div id="user" class="modal">
  						  <span onclick="document.getElementById('user').style.display='none'" class="close" title="Close Modal">&times;</span>
  						  <form:form method="post" action="/delete-user?username=${user.username}" modelAttribute="user">
	    					  <div class="container">
	     						<h1>Delete Account</h1>
	     						<p>Are you sure you want to delete <b> ${user.username} </b> ?</p>
	      						<div class="clearfix">
	      						  <button type="button" class="cancelbtn">Cancel</button>
	       						  <button class="deletebtn" onclick="deleteUserByUsername()">Delete</button>
	      						</div>
	   					 	  </div>
  							</form:form>
  						 </div>
                    </td>
                  </tr>
                 </c:forEach>          
                 </tbody>  
              </table>
              
              <!-- End Table with stripped rows -->

            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
  
  
<script src="assets/js/users.js"></script>
  
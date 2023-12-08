<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <main id="list-groups" class="main">

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Users groups</h5>
              
               <div class="create-buton-div">
              	<a onclick="loadPage('/create-group')" href="#"><input class=" create-button" type="button" value="Create"></a>
              </div>
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">N°</th>
                    <th scope="col">Name(s)</th>
                    <th scope="col">Description</th>
                    <th scope="col">Date</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody> 
	                <c:forEach items="${groups}" var="group">
	                  <tr>
	                    <th scope="row">${group.id}</th>
	                    <td>${group.name}</td>
	                    <td>${group.description}</td>
	                    <td>${group.createdAt}</td>
	                    <td>
	                      <button class="button-icon" onclick="window.location.href='edit?username=${group.name}'"><i class="fas fa-pen-alt"></i></button>
						  <button class="button-delete" onclick="confirm_decision('${group.name}')"><i class="fas fa-trash-alt"></i></button>
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
  
  
<link href="assets/css/groups.css" rel="stylesheet">
  
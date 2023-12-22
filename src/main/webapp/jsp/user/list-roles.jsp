<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
							pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <meta charset="utf-8">

  <main id="list-roles" class="main">
  <div class="pagetitle">
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Roles</li>
          <li class="breadcrumb-item active">List</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">List Roles</h5>
                            <table class="table datatable datatable-table striped-rows">
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
                <c:forEach items="${roles}" var="role" varStatus="loop">
                  <tr class="${loop.index % 2 == 0 ? 'even-row' : 'odd-row'}">
                    <th scope="row">${role.id}</th>
                    <td>${role.name}</td>
                    <td>${role.description}</td>
                    <td>${role.createdAt}</td>
                    <td>
                      <button class="button-see" onclick="loadPage('role/view-role-details/${role.name}')"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                 </c:forEach>
               </tbody>
              </table>
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
  
<link href="assets/css/list-role.css" rel="stylesheet">
  
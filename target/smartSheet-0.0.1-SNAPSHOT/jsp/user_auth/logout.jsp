
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	<main>
		<div class="container">

			<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div
							class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4">
								<a href="index.html"
									class="logo d-flex align-items-center w-auto"> <img
									src="assets/img/logo.png" alt=""> <span
									class="d-none d-lg-block">Smart Sheet</span>
								</a>
							</div>
							<!-- End Logo -->
							<div class="card mb-3">
								<div class="card-body">
									<c:url var="logoutUrl" value="/logout" />
									<form:form action="${logoutUrl}" method="post">
										<input type="submit" value="Log out" />
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</form:form>

								</div>
							</div>
						</div>
					</div>
					</div>
			</section>
		</div>
	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
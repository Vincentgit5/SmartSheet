<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
	<html>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	  <head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	  </head>
	  <body>
	  <fieldset>
		<form:form modelAttribute="user">
		  	<table>
		  		<tr>
		  			<td> First name </td>
		  			<td><form:input path="firstName"/></td>
		  		</tr>
		  		<tr>
		  			<td> Last name </td>
		  			<td><form:input path="lastName"/></td>
		  		</tr>
		  		<tr>
		  			<td> Email </td>
		  			<td><form:input path="email"/></td>
		  		</tr>
		  		<tr>
		  			<td>Password</td>
		  			<td><form:password path="password" /></td>
		  		</tr>
		  		<h1>Page 1</h1>
    <a href="bonjour.jsp">Aller à la page 2</a>
		  	</table>
		</form:form>
		</fieldset>
	  </body>
	</html>
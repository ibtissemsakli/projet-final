<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Listes de tout les ordinateurs</title>
	<!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
   <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
    <body>
    <nav><ul class="nav masthead-nav"> <li class="active"><a href="/">Home</a></li></ul></nav><br><br>
    	<div class="container">
    	<div class="jumbotron">
    	<h2> Ordinateurs </h2>
    	</div>
    	<table class="table">
		  <thead class="thead-inverse">
		    <tr>
		      <th>Identifiant</th>
		      <th>Nom de l'ordinateur</th>
		      <th>Marque de l'ordinateur</th>
		    </tr>
		  </thead>
		  <tbody>
		   <c:forEach items="${laptops }" var="laptop"> 
		    <tr>
		      <td>${laptop.id }</td>
		      <th>${laptop.name }</th>
		      <th>${laptop.brand }</th>
		      <th><a href="/laptops/delete?id=${laptop.id}">Supprimer</a></th>
		      <th><a href="/laptops/updateLaptop?id=${laptop.id}">Modifier</a></th>
		    </tr>
		    </c:forEach>
		   </tbody>
        </table>
        </div>
        
        <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
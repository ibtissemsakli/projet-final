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
    <title>Ajouter les salles</title>
	<!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
   <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
  </head>
	<body>
	<nav><ul class="nav masthead-nav"> <li class="active"><a href="/laptops">Listes des Ordinateurs</a></li></ul></nav><br><br> 
		
			<!--<form class="form-inline" action="/laptops/update">
				 <input type="text" name="id" placeholder="Identifiant de l'ordinateur" /> 
				<input type="text" name="name" placeholder="Nom de l'ordinateur" />
				<input type="text" name="brand" placeholder="Marque de l'ordinateur" />
				<input type="submit" value="Modifier" />
			</form> -->
			<h1>Modifier un ordinateur</h1>
			<form action="/laptops/update">
			<input type="hidden" name="id" value="${laptop.id }"/>
			<label for="inputname" class="sr-only">Nom de l'ordinateur</label>
              <input type="text" name="name" id="name" class="form-control" value="${laptop.name }" required autofocus><br><br>
        <label for="inputbrand" class="sr-only">Marque de l'ordinateur</label>
             <input type="text" name="brand" id="brand" class="form-control" value="${laptop.brand }" required autofocus><br><br>
        
			<button class="btn btn-lg btn-success btn-block" type="submit" >Modifier</button>
		</form>  <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
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
    <title>Ajouter Salles</title>
	<!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
   <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
  </head>
	<body>
  <nav><ul class="nav masthead-nav"> <li class="active"><a href="/">Home</a></li></ul></nav><br><br> 
		<h1>Ajouter un ordinateur</h1>
			<form class="form-inline" action="/laptops/add">
				<label for="text" class="sr-only">Nom de l'ordinateur</label>
                 <input type="text" name="name" id="name" class="form-control" placeholder="Nom de l'ordinateur" required autofocus><br><br>
			<label for="text" class="sr-only">Marque de l'ordinateur</label>
                 <input type="text" name="brand" id="brand" class="form-control" placeholder="Marque l'ordinateur" required autofocus><br><br>
				
				<input type="submit" value="Ajouter" />
			</form>
		<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
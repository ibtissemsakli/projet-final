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
<nav><ul class="nav masthead-nav"> <li class="active"><a href="/classroom">Listes des Salles</a></li></ul></nav><br><br>                  
 <h1>Modifier une salle</h1>
	
	<form action="/classroom/update">
			<input type="hidden" name="id" value="${classroom.id }"/>
			
     <label for="inputnam" class="sr-only">Nom de la Salle</label>
        <input type="text" name="name" id="name" class="form-control" value="${classroom.name }" required autofocus><br><br>
    <label for="inputcapacity" class="sr-only">Capacitéde la Salle</label>
        <input type="text" name="capacity" id="capacity" class="form-control" value="${classroom.capacity }" required autofocus><br><br>
        
			<button class="btn btn-lg btn-success btn-block" type="submit" >Modifier</button>
		</form> 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
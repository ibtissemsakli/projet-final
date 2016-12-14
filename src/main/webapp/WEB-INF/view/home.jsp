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

    <title>Home Page</title>
	
	<!-- Bootstrap core CSS -->
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
   <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
       
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">LOGO HERE</h3>

              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a href="/">Home</a></li>
                  
        <!-- Menu Tache ADMIN -->
         <security:authorize access="hasAuthority('ADMIN')">
			    
			      <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestion des ressources <b class="caret"></b> </a>
			        <ul class="dropdown-menu">
			          <li class="dropdown-submenu"> <a tabindex="-1" href="#">Gestion des Salles</a>
			            <ul class="dropdown-menu"> 
			              <li><a href="/classroom/formAdd/">Ajouter Salle</a></li>
			              <li><a href="/classroom">Modifier Salle</a></li>
			              </ul>
			           </li>
			          <li class="dropdown-submenu"> <a tabindex="-1" href="#">Gestion des Ordinateurs</a>
			            <ul class="dropdown-menu"> 
			              <li><a href="/laptops/formAdd">Ajouter Ordinateur</a></li>
			              <li><a href="/laptops">Modifier Ordinateur</a></li>
			            </ul>
			          </li>
			          </ul>
			          </li>
			          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestion des Reservations <b class="caret"></b> </a>
			            <ul class="dropdown-menu"> 
			              <li><a href="">Ajouter Reservation</a></li>
			              <li><a href="/reservations">Modifier Reservation</a></li>
			              </ul>
			          </li>
			         
			             <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestion des utilisateurs <b class="caret"></b> </a>
			            <ul class="dropdown-menu"> 
			              <li><a href="/users">Ajouter un utilisateur</a></li>
			              <li><a href="/users">Modifier un utilisateur</a></li>
			              </ul>
			          </li>
       </security:authorize> 
   <!-- Menu Tache USER -->
         <security:authorize access="hasAuthority('USER')">
			          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestion des Reservations <b class="caret"></b> </a>
			            <ul class="dropdown-menu"> 
			              <li><a href="">Ajouter Reservation</a></li>
			              <li><a href="/reservations">Modifier Reservation</a></li>
			              </ul>
			          </li>
       </security:authorize>    
                  
                  <security:authorize access="isAuthenticated()">
                        <li><a href="/users/profil">
                        <!-- <span class="glyphicon glyphicon-user" aria-hidden="true"> Username<span class="caret dropdown-toggle"></span>
                           </span>--> 
	                            <%--<security:authorize access="isAuthenticated()">--%>
	                                        <%--<security:authentication property="principal.username" />--%>
	                            <%--</security:authorize>--%>
                        </a></li>
	                         <li><a href="/logout" class="btn btn-lg btn-danger">Logout</a></li>
	                         <li><a href="/renitialmpForm" class="btn btn-lg btn-danger">Change password</a></li>
	                  </security:authorize>

      
                  <security:authorize access="!isAuthenticated()">
                      <li><a href="/users/form/adduser"   class="btn btn-lg btn-success">Sign up</a></li>
                      <li><a href="/login" class="btn btn-lg btn-info login">Login</a></li>
                      <li><a href="#">Consulter reservations</a></li>
                  </security:authorize>
              </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><c:out value="${message }"></c:out></h1>
            <p class="lead">Bienvenue dans l'outil de gestion des ressources de Simplon</p>
            <!--  p class="lead">
             <a href="#" class="btn btn-lg btn-default">Réserver une salle</a>
	         <a href="/reservations/laptop/formAdd" class="btn btn-lg btn-default">Réserver ordinateur</a>
            </p>-->
          
          </div> 
          <div class="mastfoot">
            <div class="inner">
              
            </div>
          </div>
        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
</html>

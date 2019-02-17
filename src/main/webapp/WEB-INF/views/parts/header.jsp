<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rental Car Company</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap-grid.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap-reboot.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/js/bootstrap.js" />" rel="script">
    <link href="<c:url value="/resources/js/bootstrap.bundle.js" />" rel="script">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body class="m-auto">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <a href="#" class="navbar-brand"><img src="/resources/img/white.jpg" alt="logo" width="30px" height="30px"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/main">Main <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/cars">Cars</a>
                </li>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/profile/${pageContext.request.userPrincipal.name}">Profile</a>
                    </li>
                </c:if>
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/users">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/orders">Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/cars">Cars</a>
                    </li>
                </security:authorize>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <c:if test="${empty pageContext.request.userPrincipal.name}">
                    <a href="/login">
                        <button class="btn btn-outline-success mr-sm-2" >Sign in</button>
                    </a>
                    <a href="/registration">
                        <button class="btn btn-outline-success my-2 my-sm-0" >Registration</button>
                    </a>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <div class="nav-item mx-2" style="color: white;">
                            ${pageContext.request.userPrincipal.name}
                    </div>
                <a href="/j_spring_security_logout">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign out</button>
                </a>
                </c:if>
            </div>
        </div>
    </nav>
</header>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.navbar-nav .nav-item').click(function(){
            $('.navbar-nav .nav-item').removeClass('active');
            $(this).addClass('active');
        })
    });
</script>


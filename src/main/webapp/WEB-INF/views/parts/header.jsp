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
</head>
<style>
    body{
        max-width: 60%;
        margin: auto;
    }
    .error {
        color: red;
    }
    .loginContainer {
        max-width: 60%;
        margin: auto;
    }
</style>

<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/main">Main</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="/cars">Cars<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Rental</a>
                </li>
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link disabled" href="/admin/users">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="/admin/orders">Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="/admin/cars">Cars</a>
                    </li>
                </security:authorize>
            </ul>
            <c:if test="${empty pageContext.request.userPrincipal.name}">
                <a href="/registration">
                    <button class="btn btn-outline-success my-2 my-sm-0">Registration</button>
                </a>
                <a href="/login">
                    <button class="btn btn-outline-success my-2 my-sm-0">Sign in</button>
                </a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="nav-item">
                        ${pageContext.request.userPrincipal.name}
                </li>
                <a href="/j_spring_security_logout">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign out</button>
                </a>
            </c:if>
        </div>
    </nav>
</header>

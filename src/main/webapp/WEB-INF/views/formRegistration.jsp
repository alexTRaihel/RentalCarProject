<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:import url="parts/header.jsp" />
<div class="loginContainer my-2">
    <form:form method="POST" modelAttribute="user" action="/registration">
        <div class="form-group">
            <form:label path="username" for="name">Name:</form:label>
            <form:input path="username" class="form-control" id="name" placeholder="Enter Name"/>
            <form:errors path="username" class="error"/>
        </div>
        <div class="form-group">
            <form:label path="email" for="email">Email:</form:label>
            <form:input path="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"/>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <form:label path="password" for="exampleInputPassword1">Password:</form:label>
            <form:password path="password" class="form-control" id="exampleInputPassword1" placeholder="Password"/>
            <form:errors path="password" class="error"/>
        </div>
        <div class="form-group">
            <form:label path="confirmPassword" for="exampleInputPassword1">Confirm password:</form:label>
            <form:password path="confirmPassword" class="form-control" id="exampleInputPassword1" placeholder="Confirm your password"/>
            <form:errors path="confirmPassword" class="error"/>
        </div>
        <%--<div class="form-check">--%>
            <%--<input type="checkbox" class="form-check-input" id="exampleCheck1"/>--%>
            <%--<label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
        <%--</div>--%>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
<c:import url="parts/footer.jsp" />
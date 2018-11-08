<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
<div class="loginContainer my-2">
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
        ${error}
        </div>
    </c:if>
    <form:form method="POST" action="j_spring_security_check">
        <div class="form-group">
            <label for="InputName">Name:</label>
            <input name="user_name" id="InputName" class="form-control" placeholder="Enter Name"/>
        </div>
        <div class="form-group">
            <label for="InputPassword">Password:</label>
            <input type="password" class="form-control" id="InputPassword" name="user_password" placeholder="Password">
        </div>
        <%--<div class="form-check">--%>
            <%--<input type="checkbox" name="_spring_security_remember_me" class="form-check-input" id="exampleCheck1"/>--%>
            <%--<label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
        <%--</div>--%>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>
<c:import url="parts/footer.jsp" />
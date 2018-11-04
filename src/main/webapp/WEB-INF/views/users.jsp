<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
<section>
    <h3>Persons List</h3>
    <c:if test="${!empty listUsers}">
        <table class="tg">
            <tr>
                <th width="80">Person ID</th>
                <th width="120">Person Name</th>

                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>

                    <td><a href="<c:url value='/edit/${user.id}' />" >Edit</a></td>
                    <td><a href="<c:url value='/remove/${user.id}' />" >Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</section>
<c:import url="parts/footer.jsp" />
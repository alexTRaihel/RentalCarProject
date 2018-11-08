<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="parts/header.jsp" />
<section>
    ${pageContext.request.userPrincipal.name}
    <div class="car_description col-sm">
        <h4 class="text-lg-center m-2">Profile</h4>
        <table class="table table-bordered">
            <tr>
                <th scope="row">Username</th>
                <td class="col-sm-8">${user.username}</td>
            </tr>
            <tr>
                <th scope="row">Email</th>
                <td class="col-sm-8">${user.email}</td>
            </tr>
            <tr>
                <th scope="row">Account</th>
                <td class="col-sm-8">${user.account}</td>
            </tr>
            <tr>
                <th scope="row">Edit</th>
                <td><a href="<c:url value='#/edit/${user.username}'/>">Edit</a></td>
            </tr>
            <tr>
                <th scope="row">Delete</th>
                <td><a href="<c:url value='#/remove/${user.username}'/>">Delete</a></td>
            </tr>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <tr>
                    <th scope="row">Role</th>
                    <td><a href="<c:url value='#/edit/${user.username}'/>">${user.role.role}</a></td>
                </tr>
                <tr>
                    <th scope="row">Enabled</th>
                    <td><a href="<c:url value='#/remove/${user.username}'/>">${user.enabled}</a></td>
                </tr>
            </security:authorize>
        </table>
        <table class="table table-bordered">
            <tr>
                <th scope="row">Number</th>
                <th scope="row">Username</th>
                <th scope="row">Car</th>
                <th scope="row">Data Open</th>
                <th scope="row">Data Close</th>
                <th scope="row">Status</th>
                <th scope="row">Go to</th>
            </tr>
            <c:forEach items="${user.orders}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.user.username}</td>
                    <td>${order.car.model}</td>
                    <td>${order.dataOpen}</td>
                    <td>${order.dataClose}</td>
                    <td>${order.status}</td>
                    <td>
                        <a href="<c:url value='/order/${order.id}'/>">go to</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</section>
<c:import url="parts/footer.jsp" />

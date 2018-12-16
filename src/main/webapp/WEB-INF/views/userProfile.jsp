<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="parts/header.jsp" />
<section>
    <div class="mx-auto">
        <div class="car_description col-sm" >
            <h4 class="text-lg-center m-2">Profile</h4>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <div class="container">
                    <div class="row">
                        <div class="col-6 col-md-4 text-center">
                            <form:form modelAttribute="user" cssClass="m-auto" method="POST" action="/admin/user/enabled">
                                <div class="m-2">
                                    <input type="hidden" name="name" value="${user.username}" />
                                    <button type="submit" class="btn btn-primary">
                                            ${user.enabled ? "Lock": "Unlock"}
                                    </button>
                                </div>
                            </form:form>
                        </div>
                        <div class="col-6 col-md-4">
                            <form:form modelAttribute="user" method="POST" cssClass="m-auto" action="/admin/user/topUpAccount">
                                <div class="form-inline m-2">
                                    <div class="form-group">
                                        <input type="hidden" name="name" value="${user.username}" />
                                        <input type="number" name="count" class="form-control" id="inputAccount" placeholder="Count">
                                        <button type="submit" class="btn btn-primary">Add</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </security:authorize>
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
                        <td><a href="<c:url value='#/remove/${user.username}'/>">Enabled: ${user.enabled}</a></td>
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
    </div>
</section>
<c:import url="parts/footer.jsp" />

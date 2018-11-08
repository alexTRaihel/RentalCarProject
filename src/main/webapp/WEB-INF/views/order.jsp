<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="parts/header.jsp" />
<section>
    <div class="container">
        <table class="table table-bordered">
            <tr>
                <th scope="row">Id</th>
                <td class="col-sm-8">${order.id}</td>
            </tr>
            <tr>
                <th scope="row">User</th>
                <td class="col-sm-8">${order.user.username}</td>
            </tr>
            <tr>
                <th scope="row">Car</th>
                <td class="col-sm-8">${order.car.model}</td>
            </tr>
            <tr>
                <th scope="row">Passport ID</th>
                <td class="col-sm-8">${order.passportID}</td>
            </tr>
            <tr>
                <th scope="row">Status</th>
                <td class="col-sm-8">${order.status}</td>
            </tr>
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <tr>
                    <th scope="row">Bill</th>
                    <td class="col-sm-8">${order.bill}</td>
                </tr>
                <tr>
                    <th scope="row">Enabled</th>
                    <td class="col-sm-8">${order.dataClose}</td>
                </tr>
            </security:authorize>
        </table>
    </div>
</section>
<c:import url="parts/footer.jsp" />

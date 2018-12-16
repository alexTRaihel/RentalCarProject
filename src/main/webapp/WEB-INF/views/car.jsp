<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp" />
<section>
    <div class="mx-auto mt-2">
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <div class="container m-3">
                <div class="row">
                    <form:form modelAttribute="car" method="POST" action="/admin/car/enabled">
                        <input type="hidden" name="id" id="id" value="${car.id}" />
                        <button type="submit" class="btn btn-primary" onclick="disabled()">
                                ${car.enabled ? "Lock Car": "Unlock Car"}
                        </button>
                    </form:form>
                </div>
            </div>
        </security:authorize>
        <div class="container m-3">
            <div class="row">
                <div class="img_car col-sm">
                    <img src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}" class="img-thumbnail">
                </div>
                <div class="car_description col-sm">
                    <h4 class="text-lg-center m-2">Car description</h4>
                    <table class="table table-bordered">
                        <tr>
                            <th scope="row">Model</th>
                            <td class="col-sm-8">${car.model}</td>
                        </tr>
                        <tr>
                            <th scope="row">Description</th>
                            <td class="col-sm-8">${car.description}</td>
                        </tr>
                        <tr>
                            <th scope="row">Price</th>
                            <td class="col-sm-8">${car.price}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp" />

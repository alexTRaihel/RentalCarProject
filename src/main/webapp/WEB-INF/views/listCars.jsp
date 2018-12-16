<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp"/>
<section>
    <div class="m-auto">
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <a href="/admin/add/car" class="btn btn-primary m-4">Add Car</a>
        </security:authorize>
        <div class="container">
            <div class="card-columns justify-content-center align-items-center">
                <c:if test="${!empty listCars}">
                    <c:forEach var="car" items="${listCars}">
                        <div class="card border-info my-3" style="width: 18rem;" data-id="${car.id}">
                            <a href="/car/${car.id}">
                                <img class="card-img-top img-thumbnail" src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">${car.model}</h5>
                                <p class="card-text">${car.price}</p>
                                <a href="/rent/${car.id}" class="btn btn-primary">To rent</a>
                                <security:authorize access="hasRole('ROLE_ADMIN')">
                                    <a href="/admin/edit/${car.id}" class="btn btn-primary">Edit</a>
                                </security:authorize>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp"/>

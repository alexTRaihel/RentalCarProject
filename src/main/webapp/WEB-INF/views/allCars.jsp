<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
    <div class="mx-auto mt-2 w-50">
        <div class="container">
            <div class="text-center">
                <h3 class="m-2">List of cars</h3>
            </div>
        </div>
        <c:if test="${!empty listCars}">
            <table class="table table-bordered">
                <tr>
                    <th width="80">ID</th>
                    <th width="80">Model</th>
                    <th width="120">Enabled</th>
                    <th width="120">View</th>
                </tr>
                <c:forEach items="${listCars}" var="car">
                    <tr>
                        <td>${car.id}</td>
                        <td>${car.model}</td>
                        <td>${car.enabled}</td>
                        <td>
                            <a href="<c:url value='/car/${car.id}'/>" >
                                View car
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
<c:import url="parts/footer.jsp" />
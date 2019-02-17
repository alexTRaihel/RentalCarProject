<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp"/>
<section>
    <div class="container-fluid" style="background-color: #eee;">
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <div style="display: flex; justify-content: center;">
            <a class="btn btn-outline-primary mt-3" href="/admin/add/car">Add car</a>
        </div>
        </security:authorize>
        <div class="container p-4">
            <div class="card-deck" style="justify-content: space-evenly;">
                <c:if test="${!empty listCars}">
                    <c:forEach var="car" items="${listCars}">
                        <div class="card my-2" style="min-width: 20rem; max-width: 20rem;">
                            <a href="/car/${car.id}">
                                <img class="card-img-top" src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">${car.model}</h5>
                                <p class="card-text">${car.price}</p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">${car.description}</li>
                            </ul>
                            <div class="card-body">
                                <a class="btn btn-primary my-2 my-sm-0" href="/rent/${car.id}">To rent</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        <div style="display: flex; justify-content: center; margin-top: 10px;">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:url value="/cars" var="prev">
                        <c:param name="page" value="${page-1}"/>
                    </c:url>
                    <c:if test="${page-1 > 0}">
                        <li class="page-item"><a class="page-link" href="<c:out value="${prev}"/>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    </c:if>
                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${page == i.index}">
                                <li class="page-item"><a class="page-link" href="<c:out value="${url}"/>"><b>${i.index}</b></a></li>
                            </c:when>
                            <c:otherwise>
                                <c:url value="/cars" var="url">
                                    <c:param name="page" value="${i.index}"/>
                                </c:url>
                                <li class="page-item"><a class="page-link" href="<c:out value="${url}"/>">${i.index}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:url value="/cars" var="next">
                        <c:param name="page" value="${page+1}"/>
                    </c:url>
                    <c:if test="${page+1 <= maxPages}">
                        <li class="page-item">
                           <a class="page-link" aria-label="Next" href="<c:out value="${next}"/>"><span aria-hidden="true">&raquo;</span></a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp"/>

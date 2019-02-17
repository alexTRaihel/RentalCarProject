<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp" />
<section>
    <div style="background-color: #fdfdfd; min-height: 700px;">
        <security:authorize access="hasRole('ROLE_ADMIN')">
         <div style="display: flex; justify-content: center;">
                <form:form modelAttribute="car" method="POST" action="/admin/car/enabled">
                    <input type="hidden" name="id" id="id" value="${car.id}" />
                    <button type="submit" class="btn btn-outline-primary mt-3">${car.enabled ? "Lock Car": "Unlock Car"}</button>
                </form:form>
                    <button class="btn btn-outline-primary mx-2 m-3" onclick="location.href='/admin/edit/${car.id}'">Edit</button>
         </div>
        </security:authorize>
        <div class="mx-auto my-3 py-2 container-fluid mt-2" style="max-width: 65%; background-color: #eee;">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <img src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}" class="rounded mx-auto d-block" width="400" height="270">
                    </div>
                    <div class="col-sm">
                        <div class="pt-3">
                            <table class="table table-borderless">
                                <thead>
                                <tr>
                                    <th scope="col">Name:</th>
                                    <td scope="col">${car.model}</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">Price:</th>
                                    <td>${car.price}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Description:</th>
                                    <td>${car.description}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Add functions:</th>
                                    <td colspan="2">${car.enabled}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp" />

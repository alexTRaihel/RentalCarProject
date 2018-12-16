<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
<section>
    <div class="mx-auto">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <h4 class="m-2">Orders</h4>
                </div>
                <div class="col-md-5">
                    <div class="container m-2">
                        <div class="row">
                            <div class="col-md-2">
                                <button onclick="find()" class="btn btn-primary">New</button>
                            </div>
                            <div class="col-md-4">
                                <button onclick="find()" class="btn btn-primary">Current</button>
                            </div>
                            <div class="col-md-2">
                                <button onclick="find()" class="btn btn-primary">All</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-inline m-2">
                        <div class="form-group">
                            <input type="number" class="form-control" id="inputIDForSearch" placeholder="ID of order">
                        </div>
                        <button onclick="find()" class="btn btn-primary ml-2">Search</button>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${!empty listOrders}">
            <table class="table table-bordered">
                <tr>
                    <th width="80">Order ID</th>
                    <th width="120">Car Model</th>
                    <th width="120">Person Name</th>
                    <th width="60">Passport ID</th>
                    <th width="60">Data Open</th>
                    <th width="120">Period</th>
                    <th width="120">Data Close</th>
                    <th width="120">Order Status</th>
                    <th width="120">Go to</th>
                </tr>
                <c:forEach items="${listOrders}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.car.model}</td>
                        <td>
                            <a href="<c:url value='/profile/${order.user.username}'/>" >
                                    ${order.user.username}
                            </a>
                        </td>
                        <td>${order.passport}</td>
                        <td>${order.dataOpen}</td>
                        <td> - </td>
                        <td>${order.dataClose}</td>
                        <td>${order.status.name()}</td>
                        <td>
                            <a href="<c:url value='/order/${order.id}'/>" >
                                Go to
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</section>
<c:import url="parts/footer.jsp" />
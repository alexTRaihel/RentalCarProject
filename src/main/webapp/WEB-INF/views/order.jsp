<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
<section>
    <div class="container m-3">
        <div class="row">
            <div class="img_car col-sm">
                <img src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}" class="img-thumbnail">
            </div>
            <div class="car_description col-sm">
                <h4 class="text-lg-center m-2">Car description</h4>
                <table class="table table-bordered ">
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
    <div class="container m-3">
        <h3 class="text-lg-center m-2">Please fill in the order form</h3>
        <form:form method="POST" modelAttribute="order" action="/rent/${car.id}">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">First Name</label>
                    <input type="text" class="form-control" id="inputEmail4" placeholder="First Name">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Last Name</label>
                    <input type="text" class="form-control" id="inputPassword4" placeholder="Last Name">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputPassportID">Passport ID</label>
                    <form:input path="passportID" type="text" class="form-control" id="inputPassportID" placeholder="Passport ID" />
                </div>
                <div class="form-group col-md-6">
                    <label for="inputCity">City</label>
                    <input type="text" class="form-control" id="inputCity" placeholder="City">
                </div>
            </div>
            <div class="form-group">
                <label for="inputAddress">Address</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="Address">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputFrom">From</label>
                    <form:input path="dataOpen" type="date" class="form-control" id="inputFrom"/>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputTo">To</label>
                    <form:input path="dataClose" type="date" class="form-control" id="inputTo"/>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Make a reservation</button>
        </form:form>
    </div>
</section>
<c:import url="parts/footer.jsp" />

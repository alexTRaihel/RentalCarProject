<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
<section class="m-3">
    <div class="m-auto">
        <div class="container m-5">
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
        <div class="container m-3">
            <h3 class="text-lg-center m-4">Please fill in the order form</h3>
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
                        <form:label path="passport" for="inputPassport">Passport ID</form:label>
                        <form:input path="passport" type="text" class="form-control" id="inputPassport" placeholder="Passport ID" />
                        <form:errors path="passport" class="error"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCity">City</label>
                        <input type="text" class="form-control" id="inputCity" placeholder="City">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" id="inputAddress" placeholder="Address">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputAddress">Phone</label>
                        <input type="text" class="form-control" id="inputPhone" placeholder="Phone">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <form:label path="dataOpen" for="inputFrom">From</form:label>
                        <form:input path="dataOpen" type="date" class="form-control" id="inputFrom"/>
                        <form:errors path="dataOpen" class="error"/>
                    </div>
                    <div class="form-group col-md-6">
                        <form:label path="dataClose" for="inputTo">To</form:label>
                        <form:input path="dataClose" type="date" class="form-control" id="inputTo"/>
                        <form:errors path="dataClose" class="error"/>
                    </div>
                </div>
                <div class="form-row mx-3">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" name="selected" type="checkbox" id="inlineCheckbox1" value="option1">
                        <label class="form-check-label" for="inlineCheckbox1">Deliver to airport</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" name="selected" type="checkbox" id="inlineCheckbox2" value="option1">
                        <label class="form-check-label" for="inlineCheckbox2">Chair for child</label>
                    </div>
                </div>
                <div class="form-row my-4">
                    <div class="form-inline">
                        <div class="form-group">
                            <input class="form-control" type="number" placeholder="Amount: 0" readonly>
                            <button onclick="show()" class="mx-3 btn btn-primary hid">Make a reservation</button>
                            <button type="submit" class=" mx-3 btn btn-primary sub" hidden>Make a reservation</button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
    function show() {

    }
</script>
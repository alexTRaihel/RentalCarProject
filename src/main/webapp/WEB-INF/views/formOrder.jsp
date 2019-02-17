<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp" />
<div class="mx-auto my-3 py-2 container-fluid" style="max-width: 65%; background-color: #eee;">
    <div class="d-flex justify-content-center my-2">
        <h3>Form of order</h3>
    </div>
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
                            <td colspan="2">This car have some additional functionality</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center my-2">
        <h4>Please fill the form</h4>
    </div>
    <form:form method="POST" modelAttribute="order" action="/rent/${car.id}">
    <div class="mx-5">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputFName">First Name</label>
                    <input type="text" class="form-control" id="inputFName" placeholder="First Name">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputLName">Last Name</label>
                    <input type="text" class="form-control" id="inputLName" placeholder="Last Name">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Address">
                </div>
                <div class="form-group col-md-6">
                    <form:label path="passport" for="inputPassport">Passport ID</form:label>
                    <form:input path="passport" type="text" class="form-control" id="inputPassport" placeholder="Passport ID"/>
                    <form:errors path="passport" class="error"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputCity">City</label>
                    <input type="text" class="form-control" id="inputCity">
                </div>
                <div class="form-group col-md-6">
                    <label for="inputState">Country</label>
                    <select id="inputState" class="form-control">
                        <option selected>Choose...</option>
                        <option>Belarus</option>
                    </select>
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
            <div class="form-row" style="display: flex;">
                <div class="form-check col-ms-4 ml-auto mr-3" style="justify-content: left;">
                    <input class="form-check-input" type="checkbox" id="gridCheck1">
                    <label class="form-check-label" for="gridCheck1">
                        Chair for child
                    </label>
                </div>
                <div class="form-check col-ms-4 mr-auto ml-3" style="justify-content: right;">
                    <input class="form-check-input" type="checkbox" id="gridCheck2">
                    <label class="form-check-label" for="gridCheck2">
                        Whole tank
                    </label>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-5">
                <button type="submit" class="btn btn-primary">Do order</button>
            </div>
        </form>
    </div>
    </form:form>
</div>
<c:import url="parts/footer.jsp" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
    function show() {

    }
</script>
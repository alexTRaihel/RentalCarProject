<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp"/>
<button class="btn btn-primary mt-3" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    Cars Editor
</button>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form:form method="POST" action="multipart/form-data">
            <div class="form-group">
                <label for="formGroupExampleInput1">Car model</label>
                <input type="text" class="form-control" id="formGroupExampleInput1" placeholder="Car model">
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">Price</label>
                <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Price">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile"/>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form:form>
    </div>
</div>
<div class="card-columns mt-3" id="car_list">
    <c:if test="${!empty listCars}">
        <c:forEach var="car" items="${listCars}">
            <div class="card border-info" style="width: 18rem;" data-id="${car.id}">
                <img class="card-img-top img-thumbnail" src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}">
                <div class="card-body">
                    <h5 class="card-title">${car.model}</h5>
                    <p class="card-text">${car.price}</p>
                    <a href="/rent/${car.id}" class="btn btn-primary">To rent</a>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
<c:import url="parts/footer.jsp"/>

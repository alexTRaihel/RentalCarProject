<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="parts/header.jsp"/>
<section>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Car editor
    </a>
    <div class="collapse show" id="collapseExample">
        <div class="card card-body">
            <form:form method="POST" action="multipart/form-data">
                <div class="form-group">
                    <label for="formGroupExampleInput1">Example label</label>
                    <input type="text" class="form-control" id="formGroupExampleInput1" placeholder="Example input">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Example label</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Example input">
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
</section>
<section>
    <c:if test="${!empty listCars}">
        <c:forEach var="car" items="${listCars}">
            <div class="card-columns" id="${car.id}">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top img-thumbnail" src="data:image/jpeg;base64,${car.imgUtility}" alt="${car.model}">
                    <div class="card-body">
                        <h5 class="card-title">${car.model}</h5>
                        <p class="card-text">${car.price}</p>
                        <a href="/rent/${car.id}" class="btn btn-primary">To rent</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</section>
<c:import url="parts/footer.jsp"/>
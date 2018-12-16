<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp" />
<section>
        <div class="container m-auto">
            <c:if test="${car.picture !=null}">
                <div class="row mx-auto justify-content-center">
                    <div class="m-auto">
                        <div class="col-sm w-75">
                            <img src="data:image/jpeg;base64,${car.imgUtility}" class="img-thumbnail m-auto">
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <form:form method="POST" cssClass="mx-auto" action="/admin/add/car" modelAttribute="car" enctype="multipart/form-data">
                    <form:input path="id" type="hidden" name="id" value="${car.id}" />
                    <div class="form-group">
                        <label for="exampleInputFile">File input</label>
                        <input type="file" name="image" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
                        <small id="fileHelp" class="form-text text-muted">Choose image car, image can not be more 200kb.</small>
                    </div>
                    <div class="form-group">
                        <form:label path="model" for="formGroupExampleInput1">Car model</form:label>
                        <form:input path="model" type="text" class="form-control" id="formGroupExampleInput1" placeholder="Car model"/>
                        <form:errors path="model" />
                    </div>
                    <div class="form-group">
                        <form:label path="description" for="formGroup">Car description</form:label>
                        <form:textarea path="description" type="text" class="form-control" id="formGroup" placeholder="Description" rows="3"/>
                        <form:errors path="description" />
                    </div>
                    <div class="form-group">
                        <form:label path="price" for="formGroupExampleInput2">Price</form:label>
                        <form:input path="price" type="number" class="form-control" id="formGroupExampleInput2" placeholder="Price"/>
                        <form:errors path="price" />
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">
                            Default checkbox
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
                        <label class="form-check-label" for="defaultCheck2">
                            Disabled checkbox
                        </label>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form:form>
            </div>
        </div>
</section>
<c:import url="parts/footer.jsp" />

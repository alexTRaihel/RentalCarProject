<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<c:import url="parts/header.jsp" />
<section>
    <div class="container mx-auto w-50" style="min-height: 700px">
        <div class="alert my-2 alert-secondary" role="alert">
            ${order.status}
        </div>
        <table class="table table-bordered">
            <tr>
                <th scope="row">Id</th>
                <td class="col-sm-8">${order.id}</td>
            </tr>
            <tr>
                <th scope="row">User</th>
                <td class="col-sm-8">
                    <a href="/profile/${order.user.username}">
                        ${order.user.username}
                    </a>
                </td>
            </tr>
            <tr>
                <th scope="row">Car</th>
                <td class="col-sm-8">
                    <a href="/car/${order.car.id}">
                        ${order.car.model}
                    </a>
                </td>
            </tr>
            <tr>
                <th scope="row">Passport ID</th>
                <td class="col-sm-8">${order.passport}</td>
            </tr>
            <tr>
                <th scope="row">Bill</th>
                <td class="col-sm-8">${order.bill}</td>
            </tr>
            <tr>
                <th scope="row">Data close</th>
                <td class="col-sm-8">${order.dataClose}</td>
            </tr>
        </table>
        <c:if test="${!empty order.message}">
        <div class="alert m-4 alert-info" role="alert">
            Message: ${order.message}
        </div>
        </c:if>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <table class="table table-bordered">
            <tr>
                <th scope="row">Bill</th>
                <td class="col-sm-8">${order.bill}</td>
            </tr>
            <tr>
                <th scope="row">Data close</th>
                <td class="col-sm-8">${order.dataClose}</td>
            </tr>
        </table>
        <div class="container">
            <c:if test="${order.status == 'NEW'}">
                <div style="display: none;" id="close_form">
                    <div class="form-group mt-3">
                        <form:form action="/reject" method="POST" modelAttribute="order">
                            <div class="form-group">
                                <input name="id" type="hidden" value="${order.id}"/>
                                <form:label path="message" for="message">Message</form:label>
                                <form:input path="message" type="text" class="form-control" placeholder="Message"/>
                            </div>
                            <div class="form-group">
                                <form:button type="submit" class="btn btn-primary">Reject</form:button>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="d-inline">
                    <div style="display: flex; justify-content: center;" class="mb-3">
                        <button class="btn btn-primary button_show">Reject</button>
                    </div>
                    <div class="form-group">
                        <form:form action="/approve" method="POST" modelAttribute="order">
                            <input name="id" type="hidden" value="${order.id}"/>
                            <button type="submit" class="btn btn-primary">Approve</button>
                        </form:form>
                    </div>
                </div>
            </c:if>
            <c:if test="${order.status == 'CURRENT'}">
                <div style="display: flex; justify-content: center;" class="mb-3">
                    <button class="btn btn-primary button_show">Close</button>
                </div>
                <div style="display: none;" id="close_form">
                    <div class="form-group w-50 m-auto">
                        <label for="inputAdditionalAccount">Additional account</label>
                        <input type="number" class="form-control" id="inputAdditionalAccount" placeholder="Additional account">
                    </div>
                    <div class="form-group mt-3">
                        <div class="form-group">
                            <label for="messageBeforeClose">Message</label>
                            <textarea class="form-control" id="messageBeforeClose">

                            </textarea>
                        </div>
                        <div style="display: flex; justify-content: center;">
                            <button type="submit" class="btn btn-primary" onclick="closed()">Close</button>
                        </div>
                    </div>
                </div>
            </c:if>
            </security:authorize>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
   function closed() {
        $.ajax({
            method: 'POST',
            url: '/order/close',
            data: ({id : ${order.id}, message : $('#messageBeforeClose').val()}),
            success: function(){
                location.reload();
            }
        });
    }
   $(".button_show").click(function() {
       $("#close_form").toggle();
       $(".button_show").hide();
   });
</script>


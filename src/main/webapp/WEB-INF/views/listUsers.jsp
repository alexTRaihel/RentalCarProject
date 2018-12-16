<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp" />
<section>
    <div class="mx-auto">
        <div class="container m-auto">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-12 col-sm-6 col-md-8 text-center">
                        <h3 class="m-2">Persons List</h3>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="form-inline m-2">
                            <div class="form-group">
                                <input type="text" class="form-control" id="inputNameForSearch" placeholder="Find profile">
                                <button onclick="find()" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${!empty listUsers}">
                <table class="table table-bordered m-2 flex-grow-1">
                    <tr>
                        <th>Person ID</th>
                        <th>Username</th>
                        <th>Account</th>
                        <th>Enabled</th>
                        <th>Role</th>
                    </tr>
                    <c:forEach items="${listUsers}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>
                                <a href="<c:url value='/profile/${user.username}'/>" >
                                        ${user.username}
                                </a>
                            </td>
                            <td>${user.account}</td>
                            <td>
                                <a href="#" >
                                        ${user.enabled}
                                </a>
                            </td>
                            <td>
                                <a href="#" >
                                        ${user.role.role}
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
</section>
<c:import url="parts/footer.jsp" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
    function find() {
        $.ajax({
            method: 'POST',
            url: '/admin/user/find',
            data: ({name : $('#inputNameForSearch').val()}),
            dataType: "json",
            success: function(data){
                display(data);
            }
        });
    }
    function display(data) {
        var json = "<h4>Ajax Response</h4><pre>"
            + JSON.stringify(data, null, 4) + "</pre>";
        $('#userFrom').html(json);
    }
    function showUsers(data) {
        $('#table').clearAll();
        $('#table').append(data);
    }
</script>
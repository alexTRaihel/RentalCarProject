<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="parts/header.jsp" />
<div class="listUsers">
    <div class="mx-auto w-75 mt-3">
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
                                <button onclick="find()" class="btn btn-primary mx-1">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${!empty listUsers}">
                <table id="user_table" class="table table-bordered m-2 flex-grow-1">
                    <tr>
                        <th>Person ID</th>
                        <th>Username</th>
                        <th>Account</th>
                        <th>Enabled</th>
                        <th>Role</th>
                    </tr>
                    <c:forEach items="${listUsers}" var="user">
                        <tr >
                            <td>${user.id}</td>
                            <td>
                                <a href="<c:url value='/profile/${user.username}'/>" >
                                        ${user.username}
                                </a>
                            </td>
                            <td>${user.account}</td>
                            <td>${user.enabled}</td>
                            <td>${user.role.role}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
</div>
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
        var table = $("#user_table");
        $("#user_table tr").remove();
        var row = '<tr>';
        row += '<th>Person ID</th>';
        row += '<th>Username</th>';
        row += '<th>Account</th>';
        row += '<th>Enabled</th>';
        row += '<th>Role</th>';
        row += '</tr>';
        table.append(row);
        $.each( data, function( index, user){
            var date_row = '<tr>';
            date_row += '<td>'+user.id+'</td>';
            date_row += '<td><a href=/profile/'+user.username+'>'+user.username+'</a></td>';
            date_row += '<td>'+user.account+'</td>';
            date_row += '<td>'+user.enabled+'</td>';
            date_row += '<td>'+user.role+'</td>';
            date_row += '</tr>';
            table.append(date_row);
        });
    }
</script>
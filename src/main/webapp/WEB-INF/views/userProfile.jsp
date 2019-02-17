<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="parts/header.jsp" />
<div class="container profile" >
    <security:authorize access="hasRole('ROLE_ADMIN')">
         <div class="mt-3" style="display: flex; justify-content: center;">
             <form:form modelAttribute="user" cssClass="m-auto" method="POST" action="/admin/user/enabled">
                 <div>
                     <input type="hidden" name="name" value="${user.username}" />
                     <button type="submit" class="btn btn-outline-primary">
                             ${user.enabled ? "Lock": "Unlock"}
                     </button>
                 </div>
             </form:form>
             <div class="form-inline mx-2">
                 <form:form modelAttribute="user" method="POST" cssClass="m-auto" action="/admin/user/topUpAccount">
                     <div class="form-group">
                         <input type="hidden" name="name" value="${user.username}" />
                         <input type="number" name="count" class="form-control" id="inputAccount" placeholder="Count">
                         <button type="submit" class="btn btn-primary mx-1">+</button>
                         <button type="submit" class="btn btn-primary mx-1">-</button>
                     </div
                 </form:form>
             </div>
         </div>
    </security:authorize>
    <div class="row my-2 mt-3">
        <div class="col-lg-8 order-lg-2">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#orders" data-toggle="tab" class="nav-link">Orders</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <form role="form">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">First name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="${user.username}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="${user.username}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="${user.email}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Address</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="" placeholder="City" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-6">
                                <input class="form-control" type="text" value="" placeholder="Street" readonly>
                            </div>
                            <div class="col-lg-3">
                                <input class="form-control" type="text" value="" placeholder="Home" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Username</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="${user.username}" readonly>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane" id="orders">
                    <table class="table table-hover table-striped">
                        <tbody>
                         <c:forEach items="${user.orders}" var="order">
                             <tr>
                                 <td>
                                     <span class="float-right font-weight-light">${order.id}</span> From ${order.dataOpen} to ${order.dataClose}; Status: ${order.status}
                                     <a href="<c:url value='/order/${order.id}'/>">show</a>
                                 </td>
                             </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane" id="edit">
                    <form role="form">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">First name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="Jane" >
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="Bishop">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="email" value="email@gmail.com">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Address</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="" placeholder="City">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-6">
                                <input class="form-control" type="text" value="" placeholder="Street">
                            </div>
                            <div class="col-lg-3">
                                <input class="form-control" type="text" value="" placeholder="Home">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Username</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="janeuser">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Password</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="password" value="11111122333">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="password" value="11111122333">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input type="reset" class="btn btn-secondary" value="Cancel">
                                <input type="button" class="btn btn-primary" value="Save Changes">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 order-lg-1 text-center">
            <img src="/resources/img/150.png" class="mx-auto img-fluid img-circle d-block" alt="avatar">
            <h6 class="mt-2">Upload a different photo</h6>
            <label class="custom-file">
                <input type="file" id="file" class="custom-file-input">
                <span class="custom-file-control border-dark">Choose file</span>
            </label>
            <div style="width: 150px;" class="mx-auto my-5">
                <input class="form-control" type="number" placeholder="Account: ${user.account}" readonly>
            </div>
        </div>
    </div>
</div>
<c:import url="parts/footer.jsp" />

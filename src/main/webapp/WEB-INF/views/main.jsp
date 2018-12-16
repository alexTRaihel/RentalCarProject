<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="parts/header.jsp" />
<section>
    <div class="main mx-auto text-center">
        <div class="my-4">
            <img src="/resources/img/6496_700x350.jpg">
        </div>
        <h1 class="my-4">Hello, it is a Car Rental, Please choose car</h1>
        <input type="button" class="btn btn-primary" value="View" onclick="location.href = '/cars';">
    </div>
</section>
<c:import url="parts/footer.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="parts/header.jsp" />
    <div class="container-fluid p-0" style="min-height: 600px">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/resources/img/21.jpg" class="d-block w-100" style="height: 700px" alt="1">
                    <div class="carousel-caption d-none d-md-block m-auto">
                        <h1 style="color: #28a745">Hello, please choose car</h1>
                        <button class="btn btn-success my-2 my-sm-0" type="button" onclick="location.href = '/cars';">Choose car</button>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="/resources/img/186.jpg" class="d-block w-100" style="height: 700px" alt="2">
                    <div class="carousel-caption d-none d-md-block my-auto" >
                        <h1 style="color: #28a745">Hello, please choose car</h1>
                        <button class="btn btn-success my-2 my-sm-0" type="button" onclick="location.href = '/cars';">Choose car</button>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="/resources/img/renta-car-Greece5.jpg" class="d-block w-100" style="height: 700px" alt="3">
                    <div class="carousel-caption d-none d-md-block m-auto">
                        <h1 style="color: #28a745">Hello, please choose car</h1>
                        <button class="btn btn-success my-2 my-sm-0" type="button" onclick="location.href = '/cars';">Choose car</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<c:import url="parts/footer.jsp" />

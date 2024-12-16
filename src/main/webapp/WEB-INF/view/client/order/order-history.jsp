<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Laptopshop - Dinh Luong IT</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <!-- Navbar start-->
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Modal Search Start -->
                    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content rounded-0">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body d-flex align-items-center">
                                    <div class="input-group w-75 mx-auto d-flex">
                                        <input type="search" class="form-control p-3" placeholder="keywords"
                                            aria-describedby="search-icon-1">
                                        <span id="search-icon-1" class="input-group-text p-3"><i
                                                class="fa fa-search"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Search End -->

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5 mt-4">
                            <div class="row g-4 mb-5">

                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                                            <li class="breadcrumb-item" aria-current="page">Lịch sử mua hàng</li>
                                        </ol>
                                    </nav>
                                </div>

                                <!-- Cart Page Start -->
                                <div class="container-fluid py-2">
                                    <div class="container">
                                        <c:choose>
                                            <c:when test="${empty orders}">
                                                <p class="text-center">Không có đơn hàng nào được tạo!</p>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Sản phẩm</th>
                                                                <th scope="col">Tên</th>
                                                                <th scope="col">Gía cả</th>
                                                                <th scope="col">Số lượng</th>
                                                                <th scope="col">Thành tiền</th>
                                                                <th scope="col">Trạng thái</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="order" items="${orders}">
                                                                <tr>
                                                                    <td colspan="2">Order id = ${order.id}</td>
                                                                    <td colspan="1">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${order.totalPrice}" /> đ
                                                                    </td>
                                                                    <td colspan="2"></td>
                                                                    <td colspan="1">${order.status}</td>
                                                                </tr>

                                                                <c:forEach var="orderDetail"
                                                                    items="${order.orderDetails}">
                                                                    <tr>
                                                                        <th scope="row">
                                                                            <div class="d-flex align-items-center">
                                                                                <img src="/images/product/${orderDetail.product.image}"
                                                                                    class="img-fluid me-5 rounded-circle"
                                                                                    style="width: 80px; height: 80px;"
                                                                                    alt="">
                                                                            </div>
                                                                        </th>
                                                                        <td>
                                                                            <p class="mb-0 mt-4">
                                                                                <a href="/product/${orderDetail.product.id}"
                                                                                    target="_blank">
                                                                                    ${orderDetail.product.name}
                                                                                </a>
                                                                            </p>
                                                                        </td>
                                                                        <td>
                                                                            <p class="mb-0 mt-4">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${orderDetail.product.price}" />
                                                                                đ
                                                                            </p>
                                                                        </td>
                                                                        <td>
                                                                            <div class="input-group quantity mt-4"
                                                                                style="width: 100px;">

                                                                                <input type="text"
                                                                                    class="form-control form-control-sm text-center border-0"
                                                                                    value="${orderDetail.quantity}">
                                                                            </div>
                                                                        </td>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>


                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Single Product End -->


                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>

                </body>

                </html>
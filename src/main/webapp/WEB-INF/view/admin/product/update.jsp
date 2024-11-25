<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Update product</title>
                <!-- latest compiled and minified cs -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">

                <!-- javascript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${newProduct.image}";

                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <!-- Header -->
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">

                    <!-- Sidebar -->
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Update Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>
                                </ol>

                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a product ${id}</h3>
                                            <hr />

                                            <form:form action="/admin/product/update" class="row" method="post"
                                                modelAttribute="newProduct" enctype="multipart/form-data">

                                                <c:set var="errorsName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>

                                                <c:set var="errorsPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>

                                                <c:set var="errorsDetailDesc">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>

                                                <c:set var="errorsDetailShort">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>

                                                <c:set var="errorsQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>

                                                <div class="form-group" style="display: none;">
                                                    <label for="Inputuser1">Id</label>
                                                    <form:input type="text" class="form-control " path="id"
                                                        placeholder="id" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Name: </label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorsName ? 'is-invalid' : ''}"
                                                        path="name" />
                                                    ${errorsName}
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price: </label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorsPrice ? 'is-invalid' : ''}"
                                                        path="price" />
                                                    ${errorsPrice}
                                                </div>
                                                <div class="mb-3 col-12 ">
                                                    <label class="form-label">Detail description: </label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty errorsDetailDesc ? 'is-invalid' : ''}"
                                                        path="detailDesc" row="3" />
                                                    ${errorsDetailDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Short description: </label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorsDetailShort ? 'is-invalid' : ''}"
                                                        path="shortDesc" />
                                                    ${errorsDetailShort}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Quantity: </label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorsQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorsQuantity}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory: </label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">Apple (MacBook)</form:option>
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Target: </label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="SINHVIEN-VANPHONG">Sinh Viên - Văn Phòng
                                                        </form:option>
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label" for="avatarFile">Image: </label>
                                                    <input type="file" class="form-control" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="dinhluongitFile" />
                                                </div>

                                                <div class="mb-3 col-12">
                                                    <img style="display: none; max-height: 250px;"
                                                        alt="img Product preview" id="avatarPreview">
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>

                        </main>
                        <!-- footer -->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>
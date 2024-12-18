<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Create User - Dinh Luong</title>
                <!-- latest compiled and minified cs -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">

                <!-- javascript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
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
                                <h1 class="mt-4">Manage Create</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Create user</li>
                                </ol>

                                <!--Login form starts-->
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 col-md-6 mx-auto">
                                            <h3 class="font-weight-bold mb-3"> Đăng ký tài khoản </h3>
                                            <hr />
                                            <form:form class="row" action="/admin/user/create" method="post"
                                                modelAttribute="newUser" enctype="multipart/form-data">

                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorsEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>

                                                    <label class="form-label">Email</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorsEmail ? 'is-invalid' : ''}"
                                                        path="email" placeholder="Email" />

                                                    ${errorsEmail}
                                                </div>
                                                <!--Binding the label and input together-->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorsPassword">
                                                        <form:errors path="password" />
                                                    </c:set>
                                                    <label class="form-label">Password</label>
                                                    <form:input type="password"
                                                        class="form-control ${not empty errorsPassword ? 'is-invalid' : ''}"
                                                        path="password" placeholder="Password" />
                                                    <form:errors cssClass="invalid-feedback" path="password" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Phone</label>
                                                    <form:input type="text" class="form-control" path="phone"
                                                        placeholder="Phone" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorsFullname">
                                                        <form:errors path="fullname" />
                                                    </c:set>

                                                    <label class="form-label">fullName</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorsFullname ? 'is-invalid' : ''}"
                                                        path="fullname" placeholder="fullName" />
                                                    <form:errors class="invalid-feedback" path="fullname" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-12">
                                                    <label class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" path="address"
                                                        placeholder="Address" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">ROLE: </label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar: </label>
                                                    <input type="file" class="form-control" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="dinhluongitFile">
                                                </div>

                                                <div class="mb-3 col-12 col-md-3">
                                                    <img alt="avatar preview" style="max-height: 250px; display: none;"
                                                        id="avatarPreview">
                                                </div>


                                                <div class="mb-3 col-12">
                                                    <button type="submit"
                                                        class="btn btn-primary btn-block mt-3">Create</button>
                                                </div>
                                                <div>
                                                    <a href="/admin/user">Danh sách</a>
                                                </div>
                                            </form:form>
                                        </div>
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Register - SB Admin</title>
                    <link href="css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="bg-primary">
                    <div id="layoutAuthentication">
                        <div id="layoutAuthentication_content">
                            <main>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-7">
                                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                <div class="card-header">
                                                    <h3 class="text-center font-weight-light my-4">Đăng ký tài khoản
                                                    </h3>
                                                </div>
                                                <div class="card-body">
                                                    <form:form method="post" action="/register"
                                                        modelAttribute="registerUser">
                                                        <c:set var="errorsPassword">
                                                            <form:errors path="confirmPassword"
                                                                cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <c:set var="errorsEmail">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <c:set var="errorsFirstName">
                                                            <form:errors path="firstName" cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <div class="row mb-3">
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input
                                                                        class="form-control ${not empty errorsFirstName ? 'is-invalid' : ''}"
                                                                        id="inputFirstName" type="text"
                                                                        placeholder="Enter your first name"
                                                                        path="firstName" />
                                                                    <label for="inputFirstName">Họ</label>
                                                                    ${errorsFirstName}
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-floating">
                                                                    <form:input class="form-control " id="inputLastName"
                                                                        type="text" placeholder="Enter your last name"
                                                                        path="lastName" />
                                                                    <label for="inputLastName">Tên</label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                            <form:input
                                                                class="form-control ${not empty errorsEmail ? 'is-invalid' : ''}"
                                                                id="inputEmail" type="email"
                                                                placeholder="name@example.com" path="email" />
                                                            <label for="inputEmail">Email</label>
                                                            ${errorsEmail}
                                                        </div>
                                                        <div class="row mb-3">
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input
                                                                        class="form-control ${not empty errorsPassword ? 'is-invalid' : ''}"
                                                                        id="inputPassword" type="password"
                                                                        placeholder="Create a password"
                                                                        path="password" />
                                                                    <label>Mật Khẩu</label>
                                                                    ${errorsPassword}
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-floating mb-3 mb-md-0">
                                                                    <form:input class="form-control"
                                                                        id="inputPasswordConfirm" type="password"
                                                                        placeholder="Confirm password"
                                                                        path="confirmPassword" />
                                                                    <label for="inputPasswordConfirm">Nhập Lại Mật
                                                                        Khẩu</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mt-4 mb-0">
                                                            <div class="d-grid">
                                                                <button class="btn btn-primary btn-block">
                                                                    Đăng Ký
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form:form>
                                                </div>
                                                <div class="card-footer text-center py-3">
                                                    <div class="small"><a href="/login">Bạn đã có tài khoản rồi? Đăng
                                                            nhập</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                </body>

                </html>
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

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                    <li class="breadcrumb-item active">Create</li>
                                </ol>

                                <!--Login form starts-->
                                <section class="container-fluid mt-5">
                                    <section class="row justify-content-center">
                                        <section class="col-12 col-sm-6 col-md-6">
                                            <form:form class="form-container" action="/admin/user/create" method="post"
                                                modelAttribute="newUser">

                                                <div class="form-group mb-3">
                                                    <h4 class="text-center font-weight-bold"> Create a user </h4>
                                                    <label for="Inputuser1">Email</label>
                                                    <form:input type="text" class="form-control" path="email"
                                                        aria-describeby="Email" placeholder="Email" />
                                                </div>
                                                <!--Binding the label and input together-->
                                                <div class="form-group mb-3">
                                                    <label for="InputPassword1">Password</label>
                                                    <form:input type="password" class="form-control" path="password"
                                                        placeholder="Password" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="InputPassword1">fullName</label>
                                                    <form:input type="text" class="form-control" path="fullname"
                                                        placeholder="fullName" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="InputPassword1">Address</label>
                                                    <form:input type="text" class="form-control" path="address"
                                                        placeholder="Address" />
                                                </div>

                                                <div class="form-group mb-3">
                                                    <label for="InputPassword1">Phone</label>
                                                    <form:input type="text" class="form-control" path="phone"
                                                        placeholder="Phone" />
                                                </div>

                                                <button type="submit"
                                                    class="btn btn-primary btn-block mt-3">Create</button>
                                                <div>
                                                    <a href="/admin/user">Danh sách</a>
                                                </div>
                                            </form:form>
                                        </section>
                                    </section>
                                </section>

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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
                    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
                    crossorigin="anonymous">
            </head>

            <body>
                <!--Login form starts-->
                <section class="container-fluid mt-5">
                    <section class="row justify-content-center">
                        <section class="col-12 col-sm-6 col-md-4">
                            <form:form class="form-container" action="/admin/user/create" method="post"
                                modelAttribute="newUser">

                                <div class="form-group">
                                    <h4 class="text-center font-weight-bold"> Create a user </h4>
                                    <label for="Inputuser1">Email</label>
                                    <form:input type="text" class="form-control" path="email" aria-describeby="Email"
                                        placeholder="Email" />
                                </div>
                                <!--Binding the label and input together-->
                                <div class="form-group">
                                    <label for="InputPassword1">Password</label>
                                    <form:input type="password" class="form-control" path="password"
                                        placeholder="Password" />
                                </div>

                                <div class="form-group">
                                    <label for="InputPassword1">fullName</label>
                                    <form:input type="text" class="form-control" path="fullname"
                                        placeholder="fullName" />
                                </div>

                                <div class="form-group">
                                    <label for="InputPassword1">Address</label>
                                    <form:input type="text" class="form-control" path="address" placeholder="Address" />
                                </div>

                                <div class="form-group">
                                    <label for="InputPassword1">Phone</label>
                                    <form:input type="text" class="form-control" path="phone" placeholder="Phone" />
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">Create</button>

                            </form:form>
                        </section>
                    </section>
                </section>

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                    crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
                    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                    crossorigin="anonymous"></script>
            </body>

            </html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>User detail ${id}</title>
                <!-- latest compiled and minified cs -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">

                <!-- javascript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <!-- <link rel="stylesheet" href="/css/demo.css"> -->
            </head>

            <body>

                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>User detail with id= ${id}</h3>

                            </div>

                            <hr />

                            <div class="card" style="width: 60%;">
                                <div class="card-header">
                                    User information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">id: ${user1.id}</li>
                                    <li class="list-group-item">Email: ${user1.email}</li>
                                    <li class="list-group-item">Password: ${user1.password}</li>
                                    <li class="list-group-item">fullName: ${user1.fullname}</li>
                                    <li class="list-group-item">address: ${user1.address}</li>
                                    <li class="list-group-item">Phone: ${user1.phone}</li>
                                </ul>
                            </div>


                        </div>
                    </div>
                </div>


            </body>

            </html>
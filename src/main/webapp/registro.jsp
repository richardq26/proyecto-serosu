<%-- 
    Document   : registro
    Created on : 26 set. 2020, 20:03:51
    Author     : Richard
--%>
<%
    boolean hayrespuesta = false;

    String respuesta = request.getParameter("respuesta");

    if (respuesta != null) {
        hayrespuesta = true;
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="cssTrabajo/registro.css">
        <link rel="stylesheet" href="cssTrabajo/menu.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>


        <main class="p-5 m-10" >

            <nav class="navbar navbar-expand-lg menu fixed-top ">
                <div class="container">
                    <a class="navbar-brand text-white font-weight-bold" href="index.html">Patrones</a>
                    <button class="navbar-toggler boton-hamburguesa" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </button>

                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto ">

                            <li class="nav-item">
                                <a class="nav-link" href="registro.jsp">Registro</a>
                            </li>
                            <li class="nav-item active ingreso">
                                <a class="nav-link " href="login.html">Ingreso</a>
                            </li>
                        </ul> 
                    </div>
                </div>
            </nav> 
            <% if (hayrespuesta == true) {
                    if (respuesta.equalsIgnoreCase("yaexiste")) {


            %>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <center><strong>Error al registrarte!</strong> Ya existe alguien registrado con ese username.</center>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%                        }
                }
            %>

            <div class="row m-10">
                <div class="col-md-4 mx-auto">
                    <div class="card">
                        <div class="card-header text-center h4">Registro</div>
                        <div class="card-body">
                            <form action="ServletRegistro" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="usuario" placeholder="usuario">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" placeholder="email">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="password" placeholder="password">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="confirm_password" placeholder="Confirm password">
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">REGISTRAR!</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>

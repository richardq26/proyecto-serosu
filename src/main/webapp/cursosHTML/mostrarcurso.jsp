<%-- 
    Document   : mostrarcurso.jsp
    Created on : 28 set. 2020, 05:32:51
    Author     : Richard
--%>

<%@page import="factory.Curso"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="factory.AccesoDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = request.getParameter("usuario");
    String cursorecibido = request.getParameter("curso");
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!--ICONOS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

        <!--custom css-->

        <link rel="stylesheet" href="../cssTrabajo/alumnos.css">
        <link rel="stylesheet" href="../cssTrabajo/menu-cursos.css">
        <link rel="stylesheet" href="../cssTrabajo/content-cursos-alumno.css">
        <title>Alumnos</title>
    </head>
    <body>
        <!--Navegacion-->
        <nav class="navbar navbar-expand-lg menu fixed-top ">
            <div class="container">
                <a class="navbar-brand text-white font-weight-bold" href="../index.html">Patrones</a>
                <button class="navbar-toggler boton-hamburguesa" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto ">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Estudiantes</a>
                        </li>
                        <li class="nav-item active ingreso">
                            <a class="nav-link " href="#">Profesores</a>
                        </li>
                    </ul> 
                </div>
            </div>
        </nav> 

        <main>

            <div class="contenedor container-fluid">
                <div class="row">
                    <div class="contenedor-lateral col-md-2 px-0 ">
                        <div class="list-group">
                            <div class="list-group">

                                <span class="text-center px-4 py-2" style="border-bottom: 2px solid rgb(97, 38, 38);">Su curso: <%=cursorecibido%></span> 


                                <%      AccesoDatos n = new AccesoDatos();
                                    ArrayList<Curso> cursos = n.listaCursos(usuario);
                                    Iterator<Curso> iterador = cursos.iterator();
                                    while (iterador.hasNext()) {
                                        Curso elemento = iterador.next();
                                        String curso = elemento.getNombre();
                                %>
                                <form name="form2" method="post" action="../ircurso">
                                    <input name="usuario" type="hidden" value="<%=usuario%>">
                                    <input name="curso" type="hidden" value="<%=curso%>">
                                    <button type="submit" class="list-group-item list-group-item-action"><img src="<%=elemento.getImagen()%>" width="30px" height="35px" alt=""> <%=curso%></button>

                                </form>
                                <%}
                                %>
                            </div>

                        </div>
                    </div>
                    <section class="  col-md-10 contenido-cursos w-100">

                        <div class="row">

                            <div class="col">
                                <p class="text-center subtitulo" > Introducción a <%=cursorecibido%></p>
                                <p class="h1 text-muted pt-3 pl-5">Bienvenido <%= usuario%></p>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12 d-flex justify-content-center align-items-center mt-5">
                                <%  String estecurso = "";
                                    AccesoDatos a = new AccesoDatos();
                                    ArrayList<Curso> cursos2 = a.listaCursos(usuario);
                                    Iterator<Curso> iterador2 = cursos2.iterator();
                                    while (iterador2.hasNext()) {
                                        Curso elemento = iterador2.next();
                                        if (cursorecibido.equalsIgnoreCase(elemento.getNombre())) {
                                            estecurso = elemento.getUrl();
                                        }
                                    }
                                %>    
                                <iframe width="500" height="300" src="<%=estecurso%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
                                        allowfullscreen></iframe>


                            </div>
                        </div>
                    </section>
                </div>



            </div>
        </main>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>

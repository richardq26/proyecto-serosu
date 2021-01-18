<%-- 
    Document   : respuesta
    Created on : 11 set. 2020, 23:46:24
    Author     : Richard
--%>
<%@page import="interceptingfilter.InterceptingFilterDemo"%>
<%@page import="factory.FactoryServlet"%>
<%@page import="factory.Curso"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="factory.AccesoDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = request.getParameter("usuario");
%>


<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta http-equiv="Pragma" content="no-cache"> 
        <meta http-equiv="Expires" content="-1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!--ICONOS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

        <!--custom css-->
        <link rel="stylesheet" href="estilojsp.css">
        <link rel="stylesheet" href="../cssTrabajo/alumnos.css">
        <link rel="stylesheet" href="../cssTrabajo/menu-cursos.css">
        <link rel="stylesheet" href="../cssTrabajo/estilorelleno.css">
        <link rel="stylesheet" href="../cssTrabajo/content-cursos-alumno.css">
        <title>Usuario</title>
        <script language="JavaScript">
            //Actualizar una vez al cargar página
            window.onunload = sale
            var valor;
            if (document.cookie) {
                galleta = unescape(document.cookie)
                galleta = galleta.split(';')
                for (m = 0; m < galleta.length; m++) {
                    if (galleta[m].split('=')[0] == "recarga") {
                        valor = galleta[m].split('=')[1]
                        break;
                    }
                }
                if (valor == "sip") {
                    document.cookie = "recarga=nop";
                    window.onunload = function () {}
                    document.location.reload()
                } else {
                    window.onunload = sale
                }
            }

            function sale() {
                document.cookie = "recarga=sip"
            }
        </script>
        
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


                    </ul> 
                </div>
            </div>
        </nav> 

        <main>

            <div class="contenedor container-fluid">


                <div class="row">
                    <div class="contenedor-lateral col-md-2 px-0 ">
                        <div class="list-group">



                            <span class="text-center px-4 py-2" style="border-bottom: 2px solid rgb(97, 38, 38);">Mis cursos</span> 


                            <%  AccesoDatos n = new AccesoDatos();
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
                    <section class="  col-md-10 contenido-cursos w-100">
                        <div class="row">
                            <div class="col-md-10">
                                <p class="h1 text-muted pt-3 pl-5">Bienvenido <%= usuario%></p>
                                <div class="container">
                                    <div class="row mt-5">
                                        <div class="col-6">
                                            <div class="imagen">
                                                <img class="imgpresentacion" src="https://integralatampost.s3.amazonaws.com/uploads/article/picture/19389/2019-10-24_11_342019-10-24_11_3420191025_Rethinking-the-role-of-technology-in-the-classroom.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <h3 class="text-center">Hola, nos sentimos felices de que estes con nosotros   . </h3>
                                            <span>En nuestra plataforma tendrás la oportunidad de poder aprender los cursos actualmente más demandados
                                                y que seguro te ayudarán en tu crecimiento profesional, cursos clasificados en dos partes.
                                                <hr>
                                                <strong class="subtitu">Profesores:</strong><br> Aprenderas como crear tus clases virtuales, desde las herramientas para poder crear tus conferencias
                                                hasta las herramientas que te permitan hacer una evaluación a tus alumnos. <br><br>

                                                <strong class="subtitu">Alumnos: </strong><br>
                                                Obtendras las capacidades necesarias para afrontar tu carrera universitaria como tambien poder ser el mejor en el ambito laboral
                                                te ofrecemos una manera de aprender a tu ritmo los cursos mas demandados.
                                            </span>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-2">

                                <button type="button" class="btn botonSeleccion" data-toggle="modal" 
                                        <%InterceptingFilterDemo inter = new InterceptingFilterDemo();
                                            String resp = inter.ejecutar(usuario);
                                            if (resp.equalsIgnoreCase("autorizado")) {
                                        %>data-target="#modal">Agregar Cursos
                                    <%} else {
                                    %>
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        <center><strong>Error!</strong> No está autorizado para esta acción.</center>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <%}%>

                                </button>


                            </div>
                        </div>
                        <!--Escribir mas contenido-->

                    </section>
                </div>



            </div>

            <!--Modal-->
            <div class="modal fade" id="modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title " id="staticBackdropLabel">Cursos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body contenido-modal">
                            <form name="form1" method="post">
                                <!-- Este input envía el usuario para ser procesado por servlet, es una forma de validar sesion de usuario-->
                                <input name="usuario" type="hidden" value="<%=usuario%>">
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">

                                    <img src="../img/alumnos/Ionic_Logo.svg" width="30px" height="35px" alt=""> <strong>Ionic</strong>
                                    <button class="login100-form-btn" name="agregar" value="ionic" onclick= "document.form1.action = '../FacadePorServlet';
                                            document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/Postgresql_elephant.svg" width="30px" height="35px" alt=""> <strong>Postgresql</strong>
                                    <button class="login100-form-btn" name="agregar" value="postgresql" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/linux.svg" width="30px" height="35px" alt=""> <strong>Linux</strong> 
                                    <button class="login100-form-btn" name="agregar" value="linux" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/CSS3_logo_and_wordmark.svg" width="30px" height="35px" alt=""> <strong>CSS</strong> 
                                    <button class="login100-form-btn" name="agregar" value="css" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/bootstrap4.svg" width="30px" height="35px" alt=""> <strong>Bootstrap4</strong> 
                                    <button class="login100-form-btn" name="agregar" value="bootstrap" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/github.svg" width="30px" height="35px" alt=""> <strong>Github</strong> 
                                    <button class="login100-form-btn" name="agregar" value="github" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/python.svg" width="30px" height="35px" alt=""> <strong>Python</strong>
                                    <button class="login100-form-btn" name="agregar" value="python" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/html.svg" width="30px" height="35px" alt=""> <strong>HTML</strong>
                                    <button class="login100-form-btn" name="agregar" value="html" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>
                                <li  class=" list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/vuejs.svg" width="30px" height="35px" alt=""> <strong>Vuejs</strong>
                                    <button class="login100-form-btn" name="agregar" value="vuejs" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/javascript.svg" width="30px" height="35px" alt=""> <strong>Javascript</strong>
                                    <button class="login100-form-btn" name="agregar" value="javascript" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/reactjs.svg" width="30px" height="35px" alt=""> <strong>Reactjs</strong>
                                    <button class="login100-form-btn" name="agregar" value="reactjs" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>

                                </li>
                                <li  class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/alumnos/angular.svg" width="30px" height="35px" alt=""> <strong>Angular</strong>
                                    <button class="login100-form-btn" name="agregar" value="angular" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>
                                <li href="profesoreshtml/profesores-clasroom.html" class=" list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/profesores/clasroom.svg" width="30px" height="35px" alt=""> <strong>Clasroom</strong>
                                    <button class="login100-form-btn" name="agregar" value="classroom" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li href="profesoreshtml/profesores-meet.html" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/profesores/meet.svg" width="30px" height="35px" alt=""> <strong>Meet</strong>
                                    <button class="login100-form-btn" name="agregar" value="meet" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>

                                <li href="profesoreshtml/profesores-microsof.html" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/profesores/M-team.svg" width="30px" height="35px" alt=""> <strong>M.Team</strong>
                                    <button class="login100-form-btn" name="agregar" value="mteam" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>
                                <li href="profesoreshtml/profesores-zoom.html" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/profesores/zoom.svg" width="30px" height="35px" alt=""> <strong>Zoom</strong>
                                    <button class="login100-form-btn" name="agregar" value="zoom" onclick= "document.form1.action = '../FacadePorServlet';document.form1.submit()">Agregar</button>
                                </li>
                                <li href="profesoreshtml/profesores-drive.html" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center px-4 py-2">
                                    <img src="../img/profesores/drive.svg" width="30px" height="35px" alt=""> <strong>Drive</strong>
                                    <button class="login100-form-btn" name="agregar" value="drive" onclick= "document.form1.action = '../FacadePorServlet'; document.form1.submit()">Agregar</button>
                                </li>

                            </form>
                        </div>

                    </div>
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



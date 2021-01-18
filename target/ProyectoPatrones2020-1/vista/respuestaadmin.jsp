<%-- 
    Document   : respuesta
    Created on : 11 set. 2020, 23:46:24
    Author     : Richard
--%>
<%@page import="DAO.CRUD"%>
<%@page import="DAO.PersonaDAOImpl"%>
<%@page import="DAO.Persona"%>
<%@page import="DAO.Persona"%>
<%@page import="interceptingfilter.InterceptingFilterDemo"%>
<%@page import="factory.FactoryServlet"%>
<%@page import="factory.Curso"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="factory.AccesoDatos"%>
<%@ page import="java.util.List" %>
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




                        <span class="text-center px-4 py-2" style="border-bottom: 2px solid rgb(97, 38, 38);">Lista de usuarios</span> 


                        <%  CRUD<Persona> dao = new PersonaDAOImpl();
                            Iterator<Persona> iterador = dao.listarTodos().iterator();
                            while (iterador.hasNext()) {
                                Persona elemento = iterador.next();
                                System.out.println(elemento.getUsuario());

                        %>
                        <a class="list-group-item" href="#list-home" role="tab" aria-controls="home"><%=elemento.getId()%> <%=elemento.getUsuario()%></a>

                        <% }%>



                    </div>
                    <section class="  col-md-10 contenido-cursos w-100">
                        <div class="row">
                            <div class="col-md-10">
                                <p class="h1 text-muted pt-3 pl-5">Bienvenido <%= usuario%></p>
                            </div>
                            <div class="container">
                                <div class="row mt-5">
                                    <div class="col-6">
                                        <div class="imagen">
                                            <img class="imgpresentacion" src="https://photos.demandstudios.com/getty/article/28/17/sb10069478a-001.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="col-6 mt-5">
                                        <h3 class="text-center">Hola, nos sentimos felices de tu colaboración hacia nosotros. </h3>
                                        <span>
                                            <strong class="subtitu">Estimado administrador</strong> este es un area donde usted tendrá la capacidad de poder administrar de manera remota
                                            a los usuarios que decidan unirse a la familia de las clases virtuales, aqui podrás organizar a los usuarios, desde 
                                            que preferencias tienen, para poder brindarles cursos similares, hasta tener la capacidad de poder eliminar usuarios
                                            que quiza ya no deseen contar con nuestros servicios o quiza ya esten ausentes durante mucho tiempo.
                                        </span>
                                        <h4 class="text-center">¡Comencemos!</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn botonSeleccion" data-toggle="modal" 
                                        <%InterceptingFilterDemo inter = new InterceptingFilterDemo();
                                            String resp = inter.ejecutar(usuario);
                                            if (resp.equalsIgnoreCase("autorizado")) {
                                        %>data-target="#modal">Agregar Usuarios
                                    <%} else {
                                    %>
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                        <center><strong>Error!</strong> No autorizado.</center>
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
                            <h5 class="modal-title " id="staticBackdropLabel">Agregar usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body contenido-modal">
                            <form name="form1" method="post">
                                <!-- Este input envía el usuario para ser procesado por servlet, es una forma de validar sesion de usuario-->
                                <input name="usuario" type="hidden" value="<%=usuario%>">
                                <input type="text" name="nuevous" placeholder="Nuevo usuario">
                                <input type="email" name="nuevoemail" placeholder="Nuevo email">
                                <input type="password" name="nuevopass" placeholder="Nueva contraseña">
                                <button class="login100-form-btn" name="agregar" onclick= "document.form1.action = '../commandservlet';document.form1.submit()">Agregar</button>



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



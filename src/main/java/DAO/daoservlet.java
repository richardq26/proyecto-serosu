/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DependencyInjection.ConexionMySQL;
import DependencyInjection.IConexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Richard
 */
@WebServlet(name = "daoservlet", urlPatterns = {"/daoservlet"})
public class daoservlet extends HttpServlet {

    public static final String URL = "jdbc:mysql://localhost:3306/pruebapatrones?autoReconnect=true&useSSL=true&verifyServerCertificate=false";
    public static final String usuario = "root";
    public static final String contraseña = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out2 = response.getWriter()) {
            String usu = request.getParameter("nuevous");
            String pass = request.getParameter("nuevopass");
            String ema = request.getParameter("nuevoemail");
            IConexion cx1 = new ConexionMySQL(usuario, contraseña, URL);
            PersonaDAO da = new PersonaDAOImpl();
            da.setConexion(cx1);
            CRUD<Persona> dao = new PersonaDAOImpl();
            
            String res = dao.registrar(usu, pass, ema);

            if (res.equalsIgnoreCase("agregado")) {
                PrintWriter out = response.getWriter();
                out.print("<html>");
                out.print("<head>");
                out.print("<script>");
                out.print("window.history.back()");

                out.print("</script>");

                out.print("</head>");
                out.print("</html>");
                out.close();
            } else {
                PrintWriter out = response.getWriter();
                out.print("<html>");
                out.print("<head>");
                out.print("<script>");
                out.print("alert('No se pudo agregar esta persona.')");
                out.print("</script>");
                out.print("</head>");
                out.print("</html>");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

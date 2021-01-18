/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package strategy;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Richard
 */
@WebServlet(name = "ProcesoPorServlet", urlPatterns = {"/ProcesoPorServlet"})
public class ProcesoPorServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out2 = response.getWriter()) {
            String tipo = request.getParameter("boton");
            String usuario = request.getParameter("username");
            String password = request.getParameter("pass");

            if (tipo.equalsIgnoreCase("sql")) {
                ElegirAutenticador sql = new ElegirAutenticador(new AutenticacionSQL());
                String respuestasql = sql.ejecutar(usuario, password);
                if(respuestasql.equalsIgnoreCase("valido")){
                   //request.setAttribute("owo",tipo);
                   //getServletConfig().getServletContext().getRequestDispatcher("/vista/respuestausuario.jsp").forward(request,response);
                    response.sendRedirect("vista/respuestausuario.jsp?respuesta=" + respuestasql + "&tipo=" + tipo + "&usuario=" + usuario);
                   
                }
                if(respuestasql.equalsIgnoreCase("admin")){
                    response.sendRedirect("vista/respuestaadmin.jsp?usuario="+usuario);
                }
                else{
                    PrintWriter out= response.getWriter();
                    out.print("<html>");
                    out.print("<head>");
                    out.print("<script>");
                    out.print("alert('Usuario incorrecto')");
                    out.print("</script>");
                    out.print("<script>");
                    out.print("location.href='index.html'");
                   
                    out.print("</script>");
                 
                    
                    out.print("</head>");
                    out.print("</html>");
                }
                
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

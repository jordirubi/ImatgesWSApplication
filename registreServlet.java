/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jrubiralta
 */
@WebServlet(urlPatterns = {"/registreServlet"})
public class registreServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                org.me.imatge.ImatgeWS_Service service = new org.me.imatge.ImatgeWS_Service();
                org.me.imatge.ImatgeWS port = service.getImatgeWSPort();
                 // TODO initialize WS operation arguments here

                String  rtitol = request.getParameter("titol");
                String  rdescripcio = request.getParameter("textArea");
                String  rautor = request.getParameter("autor");
                String  rkeywords = request.getParameter("clau");
                String  rdata = request.getParameter("creacio");
                 Random rand = new Random();
                 int  id = rand.nextInt(100) + 1;
                 
                org.me.imatge.Imatge imatge = null;
                // TODO process result here
                
                imatge.setId(id);
                imatge.setTitol(rtitol);
                imatge.setDescripcio(rdescripcio);
                imatge.setAutor(rautor);
                imatge.setKeywords(rkeywords);
                imatge.setDataCreacio(rdata);
                
                int result = port.registreImatge(imatge);
                
                if (result == 1) {
                    out.println("<h1>Usuari registrat amb èxit</h1>");
                } else {
                    out.println("<h1>Error al registrar l'usuari</h1>");
                }
                
            } catch (Exception ex) {
                // TODO handle custom exceptions here
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

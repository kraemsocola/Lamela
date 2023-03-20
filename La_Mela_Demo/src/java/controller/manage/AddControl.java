/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author hp
 */
@WebServlet(name = "AddControl", urlPatterns = {"/add"})
public class AddControl extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String category_raw = request.getParameter("category");
        String title = request.getParameter("title");
        String color_raw = request.getParameter("color");
        String capacity = request.getParameter("capacity");
        
        String size  = request.getParameter("size");
        String price_raw = request.getParameter("price");
        
        String thumbnail = request.getParameter("thumbnail");
        String description = request.getParameter("description");
        String quantity_raw = request.getParameter("quantity");
        String galery = request.getParameter("galery");
        
        int price ,category, quantity, color ;
        price = Integer.parseInt(price_raw);
        color = Integer.parseInt(color_raw);
                   
        
        category = Integer.parseInt(category_raw);
        quantity = Integer.parseInt(quantity_raw);
        try {
            DAO d = new DAO();
            d.insertProduct(category, title, color, capacity, size, price, thumbnail, description,quantity);
               Product p = d.getProductId(title, color);
            d.insertGalery(galery, p.getId());
            response.sendRedirect("manageproduct");
        }catch(IOException e){
            System.out.println(e);
        }

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

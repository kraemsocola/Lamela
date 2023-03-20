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
import java.util.List;
import model.Product;
import model.User;

/**
 *
 * @author hp
 */
@WebServlet(name = "StatisticalServlet", urlPatterns = {"/statistical"})
public class StatisticalServlet extends HttpServlet {

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
            out.println("<title>Servlet StatisticalServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticalServlet at " + request.getContextPath() + "</h1>");
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

        int sumOrder, sumPrice;

        try {

            DAO d = new DAO();

            List<User> u = d.getTop5User(2022);
            request.setAttribute("u", u);

            List<Product> bs0 = d.getBestSellerByCategory(0,2022);
            request.setAttribute("bs0", bs0);

            List<Product> bs1 = d.getBestSellerByCategory(1,2022);
            request.setAttribute("bs1", bs1);

            List<Product> bs2 = d.getBestSellerByCategory(2,2022);
            request.setAttribute("bs2", bs2);

            List<Product> bs3 = d.getBestSellerByCategory(3,2022);
            request.setAttribute("bs3", bs3);

            List<Product> bs4 = d.getBestSellerByCategory(4,2022);
            request.setAttribute("bs4", bs4);

            List<Product> bs5 = d.getBestSellerByCategory(5,2022);
            request.setAttribute("bs5", bs5);

            sumOrder = d.sumOrder();
            request.setAttribute("sumOrder", sumOrder);
            sumPrice = d.sumPrice();
            request.setAttribute("sumPrice", sumPrice);

        } catch (Exception e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("statistical.jsp").forward(request, response);

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

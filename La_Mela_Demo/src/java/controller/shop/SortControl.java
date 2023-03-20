/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shop;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import java.util.List;
import model.Category;

/**
 *
 * @author hp
 */
@WebServlet(name = "SortControl", urlPatterns = {"/sort"})
public class SortControl extends HttpServlet {

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
            out.println("<title>Servlet SortControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortControl at " + request.getContextPath() + "</h1>");
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

        String price_raw = request.getParameter("price");
        String price_raw_1 = price_raw.replaceAll("\\$", "");
        String price_raw_2 = price_raw_1.replaceAll("-", "");

        String[] price = price_raw_2.split("\\s");

        int price1 = Integer.parseInt(price[0]);
        int price2 = Integer.parseInt(price[2]);

        PrintWriter out = response.getWriter();

        out.println(price[0]);
        out.println(price[2]);

        try {
            DAO d = new DAO();

            List<Product> l1 = d.searchByPrice(price1, price2);
            request.setAttribute("l1", l1);

            List<Category> listC = d.getAll();
            request.setAttribute("data", listC);
            
            int page, numperpage = 15;
            int size = l1.size();
            int num = (size%15==0?(size/15):((size/15)+1));
            
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }

            int start, end;

            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            
            request.setAttribute("page", page);
            
            request.setAttribute("num", num);
            
            List<Product> title = d.getListByPage(l1, start, end);
            request.setAttribute("title", title);

            request.getRequestDispatcher("shop-grid-view-5-col.jsp").forward(request, response);
        } catch (NumberFormatException e) {
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

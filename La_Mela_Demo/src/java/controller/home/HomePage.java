/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

/**
 *
 * @author hp
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/home"})
public class HomePage extends HttpServlet {

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
            out.println("<title>Servlet ProductsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
        
        try {
         
            DAO d = new DAO();       
            
            List<Product> pCid1 = d.getProductsByCategory(1);
            request.setAttribute("pCid1", pCid1);

            List<Product> pCid2 = d.getProductsByCategory(2);
            request.setAttribute("pCid2", pCid2);
            
            List<Product> pCid3 = d.getProductsByCategory(3);
            request.setAttribute("pCid3", pCid3);

            List<Product> pCid4 = d.getProductsByCategory(4);
            request.setAttribute("pCid4", pCid4);

            List<Product> bs1 = d.getBestSellerByCategory(1,2022);
            request.setAttribute("bs1", bs1);

            List<Product> bs2 = d.getBestSellerByCategory(2,2022);
            request.setAttribute("bs2", bs2);
            
            List<Product> bs3 = d.getBestSellerByCategory(3,2022);
            request.setAttribute("bs3", bs3);

            List<Product> bs4 = d.getBestSellerByCategory(4,2022);
            request.setAttribute("bs4", bs4);
                       
            List<Category> list = d.getAll();
            request.setAttribute("data", list);
            
        List<Product> listt = d.getAllProductToManage();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, listt);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);

        } catch (NumberFormatException e) {
            System.out.println(e);

        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
        
        
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

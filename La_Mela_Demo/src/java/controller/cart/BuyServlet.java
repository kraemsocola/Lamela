/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

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
import model.Item;
import model.Product;

/**
 *
 * @author hp
 */
@WebServlet(name = "BuyServlet", urlPatterns = {"/buy"})
public class BuyServlet extends HttpServlet {

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
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
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
        DAO d = new DAO();
        List<Product> list = d.getAllProductToManage();
        Cookie[] arr = request.getCookies();
        String txt = "";

        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        String num = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id;
        id = Integer.parseInt(id_raw);
        
        if (txt.isEmpty()) {
            txt = id_raw + ":" + num;
        } else {
            txt = txt + "-" + id_raw + ":" + num;
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        request.setAttribute("size", n);
        
        Product product = d.getProductsById(id);
       
        int color = product.getColor().getId();
        request.setAttribute("pcolor", color);
        
        String title = product.getTitle();
        
        List<Product> capacity = d.getCapacity(title);
        request.setAttribute("capacity", capacity);
        
        Product thumbnail1 = d.getThumbnail1(title, color);
        request.setAttribute("check", thumbnail1);

        List<Product> thumbnail = d.getThumbnail(title);
        request.setAttribute("thumbnail", thumbnail);

        Product p = d.getPrice(title, color);
        request.setAttribute("price", p);

        Product pid = d.getProductId(title, color);
        request.setAttribute("pid", pid);

        List<Product> color1 = d.getColor(title);
        request.setAttribute("color", color1);
        
        List<Product> size1 = d.getSize(title);
        request.setAttribute("psize", size1);

        Product p1 = d.getProductsByTitle(title);
        request.setAttribute("detail", p1);

        List<Product> p2 = d.getProductsByCategory(p1.getCategory().getId());
        request.setAttribute("product", p2);
        
        
        request.getRequestDispatcher("product-details.jsp").forward(request, response);
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

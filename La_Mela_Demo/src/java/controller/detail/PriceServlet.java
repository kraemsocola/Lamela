/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.detail;

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
@WebServlet(name="PriceServlet", urlPatterns={"/price"})
public class PriceServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PriceServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PriceServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String color_raw = request.getParameter("cl");
        String title = request.getParameter("title");
        String capacity_raw = request.getParameter("cpid");
        

        int color = Integer.parseInt(color_raw);       
        request.setAttribute("pcolor", color);
        
        int cpid = Integer.parseInt(capacity_raw);
        
        DAO d = new DAO();

        Product thumbnail1 = d.getThumbnail1(title, color);
        request.setAttribute("check", thumbnail1);

        List<Product> thumbnail = d.getThumbnail(title);
        request.setAttribute("thumbnail", thumbnail);

        Product p = d.getPrice(title, color);
        request.setAttribute("price", p);          
        
        Product pid2 = d.getProductId(title, color, cpid);
        request.setAttribute("pid", pid2);

        List<Product> color1 = d.getColor(title);
        request.setAttribute("color", color1);

        List<Product> capacity = d.getCapacity(title);
        request.setAttribute("capacity", capacity);

        List<Product> size = d.getSize(title);
        request.setAttribute("size", size);

        List<Product> ram = d.getRam(title);
        request.setAttribute("ram", ram);

        List<Product> model = d.getModel(title);
        request.setAttribute("model", model);

        Product p1 = d.getProductsByTitle(title);
        request.setAttribute("detail", p1);

        List<Product> p2 = d.getProductsByCategory(p1.getCategory().getId());
        request.setAttribute("product", p2);

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

        request.getRequestDispatcher("product-details.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

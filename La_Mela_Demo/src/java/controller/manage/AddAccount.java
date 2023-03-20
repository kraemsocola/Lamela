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
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;

/**
 *
 * @author hp
 */
@WebServlet(name="AddAccount", urlPatterns={"/addaccount"})
public class AddAccount extends HttpServlet {
   
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
            out.println("<title>Servlet AddAccount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccount at " + request.getContextPath () + "</h1>");
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
        String id_raw = request.getParameter("role_id");
        String user = request.getParameter("user");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        
        PrintWriter out = new PrintWriter(System.out);
        out.print(id_raw);
        
        int id ;
        id = Integer.parseInt(id_raw);
        try {
            if (!pass.equals(re_pass)) {
                String ms1 = "Re-pass is not the same as pass!!!";
                request.setAttribute("ms1", ms1);
                request.getRequestDispatcher("manageaccount").forward(request, response);
            } else {
                DAO d = new DAO();
                User u = d.checkUserExist(email);
                if (u == null) {
                    //dc signup
                    Role r = d.getRoleById(id);
                    User u1 = new User(user, email, phone, address, pass, id, r);
                    d.addAccount(user, email, phone, address, pass,id);
                    response.sendRedirect("manageaccount");
                } else {
                    //day ve trang login
                    String ms2 = "User exist!!!";
                    request.setAttribute("ms2", ms2);
                    request.getRequestDispatcher("manageaccount").forward(request, response);
                }
            }
        } catch (IOException e) {
            System.out.println(e);
        }
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

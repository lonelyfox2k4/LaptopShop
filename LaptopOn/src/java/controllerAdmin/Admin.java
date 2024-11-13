/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.Admin_DAO;
import dal.Product_DAO;
import dal.Shopping_cart_DAO;
import dal.User_DAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author CELESTIALS
 */
@WebServlet(name = "Admin", urlPatterns = {"/admin"})
public class Admin extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin at " + request.getContextPath() + "</h1>");
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
        Product_DAO d1 = new Product_DAO();
        User_DAO d2 = new User_DAO();
        Admin_DAO a = new Admin_DAO();
        request.setAttribute("khachhang", a.getNumberAccount());
        request.setAttribute("sanpham", a.getNumberProduct());
        request.setAttribute("dondathang", a.getNumberCart());
        request.setAttribute("nhiemvu", a.getNumberCartnv());
        request.setAttribute("list", d1.selectTop8Product());
        request.setAttribute("list2", d2.getAllShopping_cartTop6());
        request.setAttribute("khachhang", a.getNumberAccount());
        request.setAttribute("sanpham", a.getNumberProduct());
        request.setAttribute("dondathang", a.getNumberCart());
        request.setAttribute("nhiemvu", a.getNumberCartnv());
        Shopping_cart_DAO d = new Shopping_cart_DAO();
        request.setAttribute("dell", d.getNumberProductbyCid(1));
        request.setAttribute("hp", d.getNumberProductbyCid(2));
        request.setAttribute("acer", d.getNumberProductbyCid(3));
        request.setAttribute("mac", d.getNumberProductbyCid(4));
        request.setAttribute("mcrs", d.getNumberProductbyCid(5));
        request.setAttribute("pin", d.getNumberProductbyCid(6));
        request.setAttribute("cv", d.getNumberProductbyCid(7));
        request.setAttribute("km", d.getNumberProductbyCid(8));
        request.setAttribute("t1", d.getTotalPricebyMonth(1));
        request.setAttribute("t2", d.getTotalPricebyMonth(2));
        request.setAttribute("t3", d.getTotalPricebyMonth(3));
        request.setAttribute("t4", d.getTotalPricebyMonth(4));
        request.setAttribute("t5", d.getTotalPricebyMonth(5));
        request.setAttribute("t6", d.getTotalPricebyMonth(6));
        request.setAttribute("t7", d.getTotalPricebyMonth(7));
        request.setAttribute("t8", d.getTotalPricebyMonth(8));
        request.setAttribute("t9", d.getTotalPricebyMonth(9));
        request.setAttribute("t10", d.getTotalPricebyMonth(10));
        request.setAttribute("t11", d.getTotalPricebyMonth(11));
        request.setAttribute("t12", d.getTotalPricebyMonth(12));
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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

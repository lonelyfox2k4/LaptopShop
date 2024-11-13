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
@WebServlet(name="Nam", urlPatterns={"/nam"})
public class Nam extends HttpServlet {
   
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
            out.println("<title>Servlet Nam</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Nam at " + request.getContextPath () + "</h1>");
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
        String namx = request.getParameter("nam");
        int nam = Integer.parseInt(namx);
        Product_DAO d1 = new Product_DAO();
        User_DAO d2 = new User_DAO();
        Admin_DAO a = new Admin_DAO();
        request.setAttribute("khachhang", a.getNumberAccount());
        request.setAttribute("sanpham", a.getNumberProduct());
        request.setAttribute("dondathang", a.getNumberCart());
        request.setAttribute("nhiemvu", a.getNumberCartnv());
        Shopping_cart_DAO d = new Shopping_cart_DAO();
        request.setAttribute("dell", d.getNumberProductbyCidAndNam(1, nam));
        request.setAttribute("hp", d.getNumberProductbyCidAndNam(2, nam));
        request.setAttribute("acer", d.getNumberProductbyCidAndNam(3, nam));
        request.setAttribute("mac", d.getNumberProductbyCidAndNam(4, nam));
        request.setAttribute("mcrs", d.getNumberProductbyCidAndNam(5, nam));
        request.setAttribute("pin", d.getNumberProductbyCidAndNam(6, nam));
        request.setAttribute("cv", d.getNumberProductbyCidAndNam(7, nam));
        request.setAttribute("km", d.getNumberProductbyCidAndNam(8, nam));
        request.setAttribute("t1", d.getTotalPricebyMonthAndYear(1, nam));
        request.setAttribute("t2", d.getTotalPricebyMonthAndYear(2, nam));
        request.setAttribute("t3", d.getTotalPricebyMonthAndYear(3, nam));
        request.setAttribute("t4", d.getTotalPricebyMonthAndYear(4, nam));
        request.setAttribute("t5", d.getTotalPricebyMonthAndYear(5, nam));
        request.setAttribute("t6", d.getTotalPricebyMonthAndYear(6, nam));
        request.setAttribute("t7", d.getTotalPricebyMonthAndYear(7, nam));
        request.setAttribute("t8", d.getTotalPricebyMonthAndYear(8, nam));
        request.setAttribute("t9", d.getTotalPricebyMonthAndYear(9, nam));
        request.setAttribute("t10", d.getTotalPricebyMonthAndYear(10, nam));
        request.setAttribute("t11", d.getTotalPricebyMonthAndYear(11, nam));
        request.setAttribute("t12", d.getTotalPricebyMonthAndYear(12, nam));
        request.setAttribute("list", d1.selectTop8Product());
        request.setAttribute("list2", d2.getAllShopping_cartTop6());
        request.setAttribute("namx", nam);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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

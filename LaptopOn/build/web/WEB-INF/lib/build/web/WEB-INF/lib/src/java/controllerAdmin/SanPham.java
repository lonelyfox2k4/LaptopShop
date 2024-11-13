/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.Product_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "SanPham", urlPatterns = {"/sanPham"})
public class SanPham extends HttpServlet {

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
            out.println("<title>Servlet SanPham</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SanPham at " + request.getContextPath() + "</h1>");
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
        
        String hang_raw = request.getParameter("hang");
        String name_raw = request.getParameter("name");
        String key = "";
        if (hang_raw != null) {
            key += "hang=" + hang_raw + "&";
        }
        if (name_raw != null) {
            key += "name=" + name_raw + "&";
        }
        String key1 = "";
        if (key.length() > 0) {
            key1 = key.substring(0, key.length() - 1);
        }
        Product_DAO d = new Product_DAO();
        List<Product> products;
        if (key.length() > 0) {
            products = d.searchName(Integer.parseInt(hang_raw), name_raw);
        } else {
            products = d.getAll();
        }
        int numberPage = 12;
        int page;
        int size = products.size();
        int num = (size % numberPage == 0) ? (size / numberPage) : (size / numberPage + 1);
        String xPage = request.getParameter("page");
        if (xPage != null) {
            page = Integer.parseInt(xPage);
        } else {
            page = 1;
        }
        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);
        List<model.Product> list1 = d.getListP(start, end, products);
        request.setAttribute("listProduct_category", d.getProduct_categoryAll());
        request.setAttribute("listProduct", list1);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("key", key1);
        request.setAttribute("hang", hang_raw);
        request.setAttribute("name", name_raw);
        request.getRequestDispatcher("sanPham.jsp").forward(request, response);
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

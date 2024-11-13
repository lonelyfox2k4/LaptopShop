/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.Product_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;
import model.Product_category;

/**
 *
 * @author admin
 */
@WebServlet(name = "ListProductByNsx", urlPatterns = {"/home"})
public class Home extends HttpServlet {

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
            out.println("<title>Servlet ListProductByNsx</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductByNsx at " + request.getContextPath() + "</h1>");
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
        Product_DAO p = new Product_DAO();
        List<Product> list = p.getProductByNsx(2024);
        int numberPage = 8;
        int page;
        int size = list.size();
        int num = (size % numberPage == 0) ? (size / numberPage) : (size / numberPage + 1);
        String xPage = request.getParameter("page");
        if (xPage != null) {
            page = Integer.parseInt(xPage);
        } else {
            page = 1;
        }
        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);
        List<Product> list1 = p.getListP(start, end, list);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("data", list1);
        List<Product> list2 = p.getLinkKien24();
        int numberPage1 = 8;
        int page1;
        int size1 = list2.size();
        int num1 = (size1 % numberPage1 == 0) ? (size1 / numberPage1) : (size1 / numberPage1 + 1);
        String xPage1 = request.getParameter("page1");
        if (xPage1 != null) {
            page1 = Integer.parseInt(xPage1);
        } else {
            page1 = 1;
        }
        int start1 = (page1 - 1) * numberPage1;
        int end1 = Math.min(page1 * numberPage1, size1);
        List<Product> list3 = p.getListP(start1, end1, list2);
        Cookie[] ar = request.getCookies();
        String txt3 = "";
        if (ar != null) {
            for (Cookie cookie : ar) {
                if (cookie.getName().equals("cart")) {
                    txt3 += cookie.getValue();
                }
            }
        }
        Product_DAO d = new Product_DAO();
        model.Cart cart = new model.Cart(txt3, d.getAll());
        request.setAttribute("size", cart.getItems().size());
        request.setAttribute("num1", num1);
        request.setAttribute("page1", page1);
        request.setAttribute("data1", list3);
        List<Product_category> product_categorys1 = p.getProduct_categoryById(1, 5);
        request.setAttribute("product_categorys1", product_categorys1);
        List<Product_category> product_categorys2 = p.getProduct_categoryById(6, 8);
        request.setAttribute("product_categorys2", product_categorys2);
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

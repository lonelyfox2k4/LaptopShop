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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product_category;

/**
 *
 * @author admin
 */
@WebServlet(name = "Buy", urlPatterns = {"/buy"})
public class Buy extends HttpServlet {

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
            out.println("<title>Servlet Buy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Buy at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        int size = 0;
        try {
            Product_DAO d = new Product_DAO();
            List<Product_category> product_categorys1 = d.getProduct_categoryById(1, 5);
            request.setAttribute("product_categorys1", product_categorys1);
            List<Product_category> product_categorys2 = d.getProduct_categoryById(6, 8);
            request.setAttribute("product_categorys2", product_categorys2);
            model.Product p = d.getProductByID(Integer.parseInt(id));
            List<model.Product> list = d.getTop4ProductByCid(p.getProduct_category().getId(), Integer.parseInt(id));
            request.setAttribute("laptop", p);
            request.setAttribute("products", list);
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie cookie : arr) {
                    if (cookie.getName().equals("cart")) {
                        txt += cookie.getValue();
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
            model.Product p1 = d.getProductByID(Integer.parseInt(id));
            int price = 0;
            if (p1.getSale() == 0) {
                price = p1.getPrices();
            } else {
                price = p1.getSale();
            }
            if (txt.isEmpty()) {
                txt = id + ":1:" + price;
            } else {
                txt = txt + "/" + id + ":1:" + price;
            }
            System.out.println(price);
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
            Cart cart = new Cart(txt, d.getAll());
            size = cart.getItems().size();
        } catch (Exception e) {
        }
        request.setAttribute("size", size);
        request.getRequestDispatcher("inforProducts?id=" + id).forward(request, response);

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

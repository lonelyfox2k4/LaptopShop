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
import model.Item;
import model.Product_category;

/**
 *
 * @author admin
 */
@WebServlet(name = "Process", urlPatterns = {"/process"})
public class Process extends HttpServlet {

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
            out.println("<title>Servlet Process</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Process at " + request.getContextPath() + "</h1>");
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
        Product_DAO d = new Product_DAO();
        List<model.Product> list = d.getAll();
        List<Product_category> product_categorys1 = d.getProduct_categoryById(1, 5);
        request.setAttribute("product_categorys1", product_categorys1);
        List<Product_category> product_categorys2 = d.getProduct_categoryById(6, 8);
        request.setAttribute("product_categorys2", product_categorys2);
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
        model.Cart cart = new model.Cart(txt, list);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id, num = 0;
        try {
            id = Integer.parseInt(id_raw);
            model.Product p = d.getProductByID(id);
            num = Integer.parseInt(num_raw);
            if (num == -1 && (cart.getQuantityById(id) <= 1)) {
                cart.removeItem(id);
            } else {
                int price = p.getPrices();
                if (p.getSale() != 0) {
                    price = p.getSale();
                }
                Item t = new Item(p, num, price);
                cart.appItem(t);
            }
        } catch (Exception e) {
        }
        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            int price = items.get(0).getProduct().getPrices();
            if (items.get(0).getProduct().getSale() != 0) {
                price = items.get(0).getProduct().getSale();
            }
            txt = items.get(0).getProduct().getId() + ":" + items.get(0).getQuantity() + ":" + price;
            for (int i = 1; i < items.size(); i++) {
                int x = items.get(i).getProduct().getPrices();
                if (items.get(i).getProduct().getSale() != 0) {
                    x = items.get(i).getProduct().getSale();
                }
                txt += "/" + items.get(i).getProduct().getId() + ":" + items.get(i).getQuantity() + ":" + x;
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.setAttribute("size", cart.getItems().size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        Product_DAO d = new Product_DAO();
        List<model.Product> list = d.getAll();
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
        String id = request.getParameter("id");
        String[] ids = txt.split("/");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            if (!s[0].equals(id)) {
                if (out.isEmpty()) {
                    out = ids[i];
                } else {
                    out += "/" + ids[i];
                }
            }
        }
        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
        }

        model.Cart cart = new model.Cart(out, list);
        request.setAttribute("cart", cart);
        request.setAttribute("size", cart.getItems().size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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

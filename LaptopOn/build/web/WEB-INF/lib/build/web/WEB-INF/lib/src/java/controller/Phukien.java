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
import model.Product_category;

/**
 *
 * @author admin
 */
@WebServlet(name="Phukien", urlPatterns={"/phukien"})
public class Phukien extends HttpServlet {
   
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
            out.println("<title>Servlet Phukien</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Phukien at " + request.getContextPath () + "</h1>");
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
        String hang_raw = request.getParameter("loaisp");
        String gia_raw = request.getParameter("gia");
        String key = "";
        if (hang_raw != null) {
            key += "loaisp=" + hang_raw + "&";
        }
        if (gia_raw != null) {
            key += "gia=" + gia_raw + "&";
        }
        String key1 = "";
        if (key.length() > 0) {
            key1 = key.substring(0, key.length() - 1);
        }
        Product_DAO d = new Product_DAO();
        String[] gia = {
            "   Dưới 200 trăm",
            "   Từ 200-400 trăm",
            "   Từ 400-600 trăm",
            "   Trên 600 trăm"
        };
        int hang = 0, giatien = 0;
        try {
            hang = Integer.parseInt(hang_raw);
            giatien = Integer.parseInt(gia_raw);
        } catch (NumberFormatException e) {
        }
        double price = 0;
        double price2 = 0;
        if (giatien == 0) {
            price = price2 = 0;
        } else if (giatien == 1) {
            price = 0;
            price2 = 200000;
        } else if (giatien == 2) {
            price = 200000;
            price2 = 400000;
        } else if (giatien == 3) {
            price = 400000;
            price2 = 600000;
        } else if (giatien == 4) {
            price = 600000;
            price2 = 6000000;
        } 
        List<Product_category> product_categorys1 = d.getProduct_categoryById(1, 5);
        request.setAttribute("product_categorys1", product_categorys1);
        List<Product_category> product_categorys2 = d.getProduct_categoryById(6, 8);
        request.setAttribute("product_categorys2", product_categorys2);
        List<model.Product> products = d.searchPhukien(hang, price, price2);
        int numberPage = 9;
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
        Cookie[] ar = request.getCookies();
        String txt3 = "";
        if (ar != null) {
            for (Cookie cookie : ar) {
                if (cookie.getName().equals("cart")) {
                    txt3 += cookie.getValue();
                }
            }
        }
        Product_DAO d1 = new Product_DAO();
        model.Cart cart1 = new model.Cart(txt3, d1.getAll());
        request.setAttribute("size", cart1.getItems().size());
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("products", list1);
        request.setAttribute("gia", gia);
        request.setAttribute("loaisp", hang);
        request.setAttribute("giatien", giatien);
        request.setAttribute("key", key1);
        request.getRequestDispatcher("phukien.jsp").forward(request, response);
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

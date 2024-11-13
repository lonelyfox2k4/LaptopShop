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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name="SearchByAjax", urlPatterns={"/searchAjax"})
public class SearchByAjax extends HttpServlet {
   
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
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("key");
        Product_DAO d = new Product_DAO();
        List<model.Product> products = d.searchByKey(txtSearch);
        PrintWriter out = response.getWriter();
        for (model.Product o : products) {
            out.println("<div class=\"col-lg-3 col-md-3 col-sm-6 col-6 m-0 p-0 box-4\">\n" +
"                            <div class=\"accessories__border accessories__productpage\">\n" +
"                                <div class=\"product-item-2 accessories__item\">\n" +
"                                        <div style=\"height: 270px; margin-bottom: 80px\">\n" +
"                                            <a href=\"inforProducts?id="+o.getId()+"\" class=\"wrap-img\">\n" +
"                                                <img style=\"width: 100%; \" src=\""+o.getImg()+"\" class=\"owl-lazy lazy\">\n" +
"                                            </a>\n" +
"                                        </div>\n" +
"\n" +
"                                        <div class=\"body\">\n" +
"                                            <a href=\"inforProducts?id=${it.id}\">\n" +
"                                                <h3 class=\"name\" style=\"font-size: 20px; color: black\">"+o.getName()+"</h3>\n" +
"                                            </a>\n" +
"                                            <span style=\"color: red\" class=\"price\">"+o.getPrices()+" VNĐ\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>");}
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
        processRequest(request, response);
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

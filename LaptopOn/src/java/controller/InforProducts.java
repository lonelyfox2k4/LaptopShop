package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
 * @author CELESTIALS
 */
@WebServlet(urlPatterns = {"/inforProducts"})
public class InforProducts extends HttpServlet {

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
            out.println("<title>Servlet InforProducts</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InforProducts at " + request.getContextPath() + "</h1>");
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
        List<Product_category> product_categorys1 = d.getProduct_categoryById(1, 5);
        request.setAttribute("product_categorys1", product_categorys1);
        List<Product_category> product_categorys2 = d.getProduct_categoryById(6, 8);
        request.setAttribute("product_categorys2", product_categorys2);
        String id = request.getParameter("id");
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
        try {
            model.Product p = d.getProductByID(Integer.parseInt(id));
            List<model.Product> list = d.getTop4ProductByCid(p.getProduct_category().getId(), Integer.parseInt(id));
            request.setAttribute("laptop", p);
            request.setAttribute("products", list);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("inforProducts.jsp").forward(request, response);

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

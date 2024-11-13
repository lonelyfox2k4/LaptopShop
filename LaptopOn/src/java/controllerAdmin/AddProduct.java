    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.Product_DAO;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author CELESTIALS
 */
@MultipartConfig()
@WebServlet(name = "AddProduct", urlPatterns = {"/addProduct"})
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("listProduct_category", d.getProduct_categoryAll());
        
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
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
        String s = request.getParameter("sale");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String mota = request.getParameter("mota");
            int price = Integer.parseInt(request.getParameter("price"));
            int sale = Integer.parseInt(s);
            int nsx = Integer.parseInt(request.getParameter("nsx"));
            String category = request.getParameter("category");
            String img = "img/" + request.getParameter("photo");
            if (d.getProductByID(id) != null) {
                request.setAttribute("product", d.getProductByID(id));
                request.setAttribute("error", "Sản phẩm đã tồn tại");
            } else {
                String check = img.substring(img.length() - 3, img.length());
                if (check.equals("png") || check.equals("jpg")) {
                    Product p = new Product(id, name, price, d.getProduct_categoryById(Integer.parseInt(category)), mota, img, sale, nsx);
                    d.insertProduct(p);
                    request.setAttribute("product", d.getProductByID(id));
                    request.setAttribute("error", "Add thành công!!!");
                } else {
                    request.setAttribute("product", d.getProductByID(id));
                    request.setAttribute("error", "File hình ảnh không đúng dữ liệu!!!");
                }
            }
            request.setAttribute("category", d.getProductByID(id).getProduct_category().getId());
            request.setAttribute("listProduct_category", d.getProduct_categoryAll());
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } catch (Exception e) {
        }
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

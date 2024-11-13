/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.User_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import model.Product;
import model.User;

/**
 *
 * @author CELESTIALS
 */
@MultipartConfig()
@WebServlet(name = "EdipUser", urlPatterns = {"/edipUser"})
public class EdipUser extends HttpServlet {

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
            out.println("<title>Servlet EdipUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EdipUser at " + request.getContextPath() + "</h1>");
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
        
        User_DAO d = new User_DAO();
        String id = request.getParameter("id");
        request.setAttribute("user", d.getUserByID(Integer.parseInt(id)));
        request.getRequestDispatcher("editUser.jsp").forward(request, response);
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
        
        try {
            String first_name = request.getParameter("firstname");
            String last = request.getParameter("lastname");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String phone = request.getParameter("phone");
            Part part = request.getPart("photo");
            String readpath = getServletContext().getRealPath("/" + "uploads");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Path.of(readpath))) {
                Files.createDirectories(Path.of(readpath));
            }
            part.write(readpath + "/" + filename);
            String check = filename.substring(filename.length() - 3, filename.length());
            if (check.equals("png") || check.equals("jpg")) {
                String img = "uploads/" + filename;
                User_DAO d = new User_DAO();
                User u = new User(first_name, last, email, pass, 1, phone, img);
                d.changeUser(u);
                request.setAttribute("user", d.getUserByEmail(u.getEmail()));
                request.getRequestDispatcher("editUser.jsp").forward(request, response);
            }
            request.setAttribute("error", "File hình ảnh không đúng dữ liệu!!!");
            request.getRequestDispatcher("edipUser.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.OrderDAO;
import sample.shopping.OrderDTO;
import sample.shopping.Fashion;

@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "save.jsp";
    private static final String SUCCESS = "save.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String msg = "";
        try {
            HttpSession session = request.getSession();
            String id = request.getParameter("ID");
            String userID = request.getParameter("User ID");
            String address = request.getParameter("Address");
            long millis = System.currentTimeMillis();
            Date date = new Date(millis);
            String phone = request.getParameter("Phone");
            Double total = Double.parseDouble(request.getParameter("Total"));
            OrderDTO order = new OrderDTO(id, address, date, phone, total, userID);
            Cart cart = (Cart) session.getAttribute("CART");
            boolean check = OrderDAO.insertOrder(cart, order);

            if (check) {
                msg = "Order has been placed successfully!";
            } else {
                msg = "Failed to place the order!";
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e + toString());
        } finally {
            request.setAttribute("msg", msg);
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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

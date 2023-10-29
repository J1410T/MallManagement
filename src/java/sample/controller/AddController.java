/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Fashion;

/**
 *
 * @author Asus
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String cmbFashion = request.getParameter("cmbFashion");
            String tmp[] = cmbFashion.split("-");
            String id = tmp[0];
            String name = tmp[1];
            double price = Double.parseDouble(tmp[2]);
            int quantity = Integer.parseInt(request.getParameter("cmbQuantity"));
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                Fashion fashion = new Fashion();
                fashion.setId(id);
                fashion.setName(name);
                fashion.setPrice(price);
                fashion.setQuantity(quantity);
                String imageUrl = getImageUrlById(id);
                fashion.setImage(imageUrl);
                boolean check = cart.add(id, fashion);
                if (check) {
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", quantity + " - " + name + ": successfully !");
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
        } finally {
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

    private String getImageUrlById(String id) {
        String imageUrl = "";

        if (id.equals("F01")) {
            imageUrl = "https://www.dior.com/couture/ecommerce/media/catalog/product/d/x/1666881913_KCI841VEA_S900_E03_GH.jpg";
        } else if (id.equals("F02")) {
            imageUrl = "https://i.pinimg.com/originals/1c/5b/16/1c5b16f3c1635c4d8ab092af63e3dd4b.jpg";
        } else if (id.equals("F03")) {
            imageUrl = "https://static.dw.com/image/37491307_703.jpg";
        } else if (id.equals("F04")) {
            imageUrl = "'https://static.fendi.com/dam/is/image/fendi/FD0941AL5JF0QA1_01?wid=1000&hei=1000&hash=5f13852e7d3daca9b1f93c71645068f8-182daf5f767";
        } else if (id.equals("F05")) {
            imageUrl = "https://fecarotta-com.cdn-immedia.net/wp-content/uploads/2020/03/BVLGARI-ANELLO-SERPENTI-.png";
        } else if (id.equals("F06")) {
            imageUrl = "https://www.michelefranzesemoda.com/img.michelefranzesemoda.com/A23---tom+ford---QVER4911SQ407.JPG";
        } else if (id.equals("F07")) {
            imageUrl = "https://m.media-amazon.com/images/I/61rMsQLr-2L._AC_UY1100_.jpg";
        } else if (id.equals("F08")) {
            imageUrl = "https://media2.bulgari.com/image/upload/f_auto,q_auto/v1661955967/grid/fiorever/Fiorever_1_hzv1qb.jpg";
        } else if (id.equals("F09")) {
            imageUrl = "https://a.1stdibscdn.com/bvlgari-white-gold-diamond-fiorever-bracelet-354603-for-sale/j_5903/j_156777621651956281423/j_15677762_1651956281669_bg_processed.jpg?width=768";
        } else if (id.equals("F10")) {
            imageUrl = "https://www.arabiaweddings.com/sites/default/files/uploads/2019/11/12/bvlgari_-_or858687_001_ful.jpg";
        }

        return imageUrl;
    }
}

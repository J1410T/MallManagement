<%-- 
    Document   : save
    Created on : Jul 14, 2023, 4:26:17 AM
    Author     : Asus
--%>

<%@page import="sample.shopping.OrderDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Page</title>

        <style>
            .msg{
                color: red;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                font-family: monospace;
            }
        </style>
    </head>
    <body>
        <h1></h1>
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
                out.println("<p>" + msg + "</p>");

                // Lấy thông tin đơn hàng từ request attribute
                OrderDTO order = (OrderDTO) request.getAttribute("order");
                if (order != null) {
        %>   
        <table>
            <thead>
                <tr>
                    <th>Order ID: <%= order.getId()%></th>
                    <th>Date: <%= order.getDate()%></th>
                    <th>Total: <%= order.getTotal()%></th>
                    <th>User ID: <%= order.getUserID()%></th>
                    <th>Phone: <%= order.getPhone()%></th>
                    <th>Address: <%= order.getAddress()%></th>
                    <th>Total</th>
                </tr>
            </thead>
        </table>
        <%
                }
            }
        %>
    </body>
</html>

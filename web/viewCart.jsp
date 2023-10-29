
<%@page import="sample.shopping.Fashion"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
        <style>
            body {
                text-align: center;
                font-family: monospace, sans-serif;
                background-image: url("https://www.miamidesigndistrict.net/images/listings/large/448_dior_1570649500521658.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }

            h1 {
                color: #666666;
                margin-top: 50px;
            }

            table {
                background-color: white;
                margin: 30px auto;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
            }

            th {
                background-color: #f2f2f2;
            }

            input[type="text"],
            input[type="number"],
            input[type="submit"] {
                padding: 5px 10px;
                font-size: 14px;
            }

            input[type="text"],
            input[type="number"] {
                width: 50px;
                text-align: center;
            }

            input[type="submit"] {
                background-color: #999999;
                color: white;
                cursor: pointer;
            }

            .total h2{
                color: #ff3300;
                margin-top: 20px;
                font-size: 18px;
            }

            a {
                display: block;
                margin-top: 20px;
                font-size: 16px;
            }
            .empty{
                font-family: monospace;
                color: red;
            }
            .add-to-cart-btn {
                width: 100%;
                height: 40px;
                background-color: #000;
                color: #fff;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

        </style>
    </head>
    <body>
        <h1>You have been chosen these!</h1>
        <% Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getCart().size() > 0) { %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Edit</th>
                    <th>Remove</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                    double total = 0;
                    for (Fashion fashion : cart.getCart().values()) {
                        total += fashion.getQuantity() * fashion.getPrice();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td> 
                    <td>
                        <input type="text" name="id" value="<%= fashion.getId()%>" readonly="">
                    </td>
                    <td><%= fashion.getName()%></td>
                    <td><img src="<%= fashion.getImage()%>" class="add-to-cart-btn" alt="Product Image"></td>
                    <td><%= fashion.getPrice()%></td>
                    <td>
                        <input type="number" name="quantity" value="<%= fashion.getQuantity()%>" min="1" required="">
                    </td>
                    <td>
                        <input type="submit" name="action" value="Edit">
                    </td>
                    <td>
                        <input type="submit" name="action" value="Remove">
                    </td>
                    <td><%= fashion.getQuantity() * fashion.getPrice()%></td>
                </tr>
            </form>
            <% }%>
        </tbody>
    </table>
    <div class="total">
        <h2>Total: <%= total%> $</h2>
    </div>
    <% } else {%>
    <div class="empty">
        <h2> Your cart is Empty!!</h2>
    </div>
    <%}%>
    <a href="shopping.jsp">Add more</a>
    </br>
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="CheckOut">
    </form>
</body>
</html>
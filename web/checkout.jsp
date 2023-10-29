

<%@page import="sample.shopping.Cart"%>
<%@page import="sample.shopping.Fashion"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Information</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                font-family: monospace;
            }

            h1 {
                color: #666666;
                margin-top: 0;
                font-weight: lighter;
                justify-content: center;
                align-items: center;
            }

            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            input[type="text"],
            input[type="number"] {
                width: 300px;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                outline: none;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th,
            td {
                padding: 10px;
                border-bottom: 1px solid #ccc;
            }

            img {
                width: 50px;
                height: auto;
            }

            h2 {
                margin-top: 30px;
                text-align: center;
                font-family: monospace;
                color: #999999;
                font-weight: bolder;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            @media (max-width: 600px) {
                input[type="text"],
                input[type="number"] {
                    width: 100%;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
        <h1>Information User</h1>
        <% long millis = System.currentTimeMillis();
            Date date = new Date(millis);
        %>
        <%= date%>
        <form action="MainController" method="POST">
            <input type="text" name="UserID" placeholder="UserID" required><br>
            <input type="text" name="Address" placeholder="Address" required><br>
            <input type="hidden" name="Date" value="<%= date%>">
            <input type="text" name="Phone" placeholder="Phone" required><br>
            <h1>Your Cart</h1>

            <% Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getCart().size() > 0) { %>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                        double total = 0;
                        for (Fashion f : cart.getCart().values()) {
                        total += f.getQuantity() * f.getPrice();%>
                    <tr>
                        <td><%= count++%></td>
                        <td><%= f.getId()%></td>
                        <td><%= f.getName()%></td>
                        <td>
                            <img src="<%= f.getImage()%>" alt="Product Image">
                        </td>
                        <td><%= f.getPrice()%></td>
                        <td>
                            <input type="number" name="quantity" value="<%= f.getQuantity()%>" min="1" required="">
                        </td>
                        <td><%= f.getQuantity() * f.getPrice()%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <h2>Total: <%= total%> $</h2>
            <input type="hidden" name="Total" value="<%= total%>">
            <% } else { %>
            <p>Your cart is empty.</p>
            <% }%>
            <input type="submit" name="action" value="Save">
        </form>
        </div>
    </body>

</html>



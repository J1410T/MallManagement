<%-- 
    Document   : shopping
    Created on : Jun 16, 2023, 1:46:15 PM
    Author     : Asus
--%>

<%@page import="sample.shopping.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Outfit Page</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: monospace;
                background-color: #fff;
            }

            .center {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                text-align: center;
            }

            .card {
                margin-bottom: 20px;
            }

            .card-img-top {
                height: 250px;
                object-fit: cover;
            }

            .card-title {
                font-weight: bold;
                margin-bottom: 0;
            }

            .card-subtitle {
                color: #666;
                margin-bottom: 10px;
            }

            .price {
                font-weight: bold;
                color: #f44336;
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
            h1{
                color: #666666;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center mt-4 mb-4">Spring Summer 2023 - Haute Couture</h1>

            <div class="row">
                <% List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("GET_PRODUCT");
                    if (listProduct != null) {
                        if (listProduct.size() > 0) {
                            for (ProductDTO elem : listProduct) {
                %>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card">
                        <img src="<%= elem.getImage()%>" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= elem.getName()%></h5>
                            <h6 class="card-subtitle"><%= elem.getDescription()%></h6>
                            <h6 class="card-subtitle price">$<%= elem.getPrice()%></h6>
                            <form action="MainController" method="POST">
                                <input type="hidden" name="cmbFashion" value="<%= elem.getSku()+"-"+ elem.getName()+"-"+elem.getPrice() %>">
                                <input type="hidden" name="cmbQuantity" value="1">
                                <input type="submit" class="add-to-cart-btn" name="action" value="Add" />
                            </form>
                        </div>
                    </div>
                </div>
                <%      }
                        }
                    }
                %>
            </div>

            <div class="text-center mt-4 mb-4">
                <form action="MainController" method="POST">
                    <input type="submit" class="btn btn-primary" name="action" value="View" />
                    <input type="submit" class="btn btn-danger" name="action" value="Logout" />
                </form>
                <% String message = (String) request.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%>
            </div>
        </div>
    </body>
</html>
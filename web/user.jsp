<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                font-family: monospace;
            }

            .container {
                display: flex;
                width: 800px;
                background-color: #fff;
                border: 1px solid none;
                border-radius: 5px;
                overflow: hidden;
                box-shadow: 0 0 10px none;
            }

            .left-section {
                flex: 1;
                padding: 20px;
                border-right: 1px solid #ccc;
                text-align: center;
                background-color: none;
            }

            .left-section img {
                max-width: 100%;
                height: auto;
            }

            .right-section {
                flex: 2;
                padding: 20px;
                text-align: center;
            }

            .user-info {
                margin-bottom: 30px;
            }
            .user-info1{
                color: red;
            }

            h1 {
                color: #666666;
                margin-top: 0;
                font-weight: lighter;
            }
            
            h2{
                font-family: monospace;
                color: #999999;
                font-weight: bolder;
            }
            
            .user-info strong{
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.html");
                    return;
                }
            %>

            <div class="right-section">
                <h1>User's information</h1>
                <%-- User's information displayed here --%>
                <div class="user-info">
                    <strong>User ID:</strong> <%= loginUser.getUserID()%>
                </div>
                <div class="user-info">
                    <strong>Full Name:</strong> <%= loginUser.getFullName()%>
                </div>
                <div class="user-info">
                    <strong>Role ID:</strong> <%= loginUser.getRoleID()%>
                </div>
                <div class="user-info">
                    <strong>Password:</strong>  <%= loginUser.getPassword()%>
                </div>
                <div class="user-info">
                    </br>
                    <h2>You can Shopping now!</h2>
                    <a href="shopping.jsp">Spring Summer 2023 - Haute Couture</a>
                </div>
                <div class="user-info1">
                    <a href="login.html">Logout</a>
                </div>
            </div>
        </div>

        <div class="left-section">
            <img src="https://media.istockphoto.com/id/1311149176/vector/continuous-hand-drawing-style-art-black-and-white-abstract-composition-with-people-portrets.jpg?s=612x612&w=0&k=20&c=zpFRFZaLeRecYAtc1BTzCYe43noFIPTUTTKTabwg-9s=" alt="User Image">
        </div>

    </body>
</html>
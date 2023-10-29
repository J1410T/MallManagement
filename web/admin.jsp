<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN PAGE</title>
        <style>
            body {
                font-family: monospace, sans-serif;
                background-color: #f1f1f1;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-image: url("https://thumbs.dreamstime.com/b/black-white-abstract-painted-background-wallpaper-texture-modern-art-creative-abstract-hand-painted-background-wallpaper-121591384.jpg");
            }

            .container {
                max-width: 20000px;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                text-align: center;
            }

            h1 {
                color: #333;
                margin-top: 0;
            }

            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table th,
            .table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .table th {
                background-color: #f2f2f2;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
            }

            .form-group input[type="text"] {
                width: 100%;
                padding: 8px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            .button-group {
                text-align: center;
                margin-top: 20px;
            }

            .button-group button {
                display: inline-block;
                margin-right: 10px;
                padding: 10px 20px;
                font-size: 16px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .button-group button:last-child {
                margin-right: 0;
            }

            .button-group button:hover {
                background-color: #45a049;
            }

            .error-message {
                text-align: center;
                margin-top: 10px;
                color: red;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Admin World!</h1>
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                    response.sendRedirect("login.html");
                    return;
                }
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            Welcome: <%= loginUser.getFullName()%>

            <form action="MainController" method="POST">
                <input type="submit" name="action" value="Logout"/>
            </form>
            </br>
            <form action ="MainController">
                Search: <input type ="text" name ="search" value="<%=search%>" />
                <input type ="submit" name ="action" value ="Search" />
            </form>
            <%
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                if (listUser != null) {
                    if (listUser.size() > 0) {
            %>
            <!--<table border="1">-->
            </br>
            <table class="table" border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Role ID</th>
                        <th>Password</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {
                    %>

                <form action="MainController">
                    <tr>
                        <td><%= count++%></td>
                        <td><%= user.getUserID()%></td>
                        <td>
                            <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                        </td>
                        <td><%= user.getPassword()%></td>
                        <td>
                            <input type="submit" name="action" value="Update"/>
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                            <input type="hidden" name="search" value="<%= search%>"/>
                        </td>
                        <td>
                            <a href="MainController?search=<%=search%>&action=Delete&userID=<%=user.getUserID()%>">Delete</a>
                        </td>
                    </tr>
                </form>

                <%
                    }
                %>
                </tbody>
            </table>
            <div class="error-message">
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <%= error%>
            </div>

            <%
                    }
                }
            %>
        </div>
    </body>
</html>
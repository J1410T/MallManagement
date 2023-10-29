<%-- 
    Document   : create
    Created on : Jun 9, 2023, 2:05:49 PM
    Author     : Asus
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREATE PAGE</title>
        <style>
            body {
                font-family: monospace, sans-serif;
                background-image: url("https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA3L3JtNTYwLWItMTRiLXguanBn.jpg");
            }

            .container {
                max-width: 500px;
                margin: 0 auto;
                padding: 50px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                margin-top: 50px;
            }

            h1 {
                text-align: center;
                color: #666666;
                margin-top: 0;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                color: graytext;
            }

            input[type="text"],
            input[type="password"] {
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
                background-color: cornflowerblue;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .button-group button:last-child {
                margin-right: 0;
            }

            .button-group button:hover {
                background-color: cadetblue;
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
            <h1>Create User</h1>
            <%
                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                if (userError == null) {
                    userError = new UserError();
                }
            %>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="userID">User ID:</label>
                    <input type="text" name="userID" required="">
                    <span class="error-message"><%= userError.getUserIDError()%></span>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" name="fullName" required="">
                    <span class="error-message">${requestScope.USER_ERROR.fullNameError}</span>
                </div>
                <div class="form-group">
                    <label for="roleID">Role ID:</label>
                    <input type="text" name="roleID" value="US" required="">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required="">
                </div>
                <div class="form-group">
                    <label for="confirm">Confirm:</label>
                    <input type="password" name="confirm" required="">
                    <span class="error-message">${requestScope.USER_ERROR.confirmError}</span>
                </div>
                <div class="button-group">
                    <input type="submit" name="action" value="Create">
                    <input type="reset" value="Reset">
                </div>
            </form>
        </div>
    </body>
</html>
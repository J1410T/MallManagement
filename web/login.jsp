<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE</title>
        <style>
            body {
                font-family: monospace, sans-serif;
                background-image: url("https://dynl.mktgcdn.com/p/evNwRD1ZtQCd6KgTnWJjnvBmuTqapJ4sSfo3t8lXca0/1900x679.jpg");
            }

            .container {
                width: 380px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            
            h1{
                text-align: center;
                color: #cccccc;
            }

            h2 {
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
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
            <h1>JT Mall</h1>
            <h2>Login</h2>
            <form>
                <div class="form-group">
                    <label for="username">User ID:</label>
                    <input type="text" name="userID" required="">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required="">
                </div>
                <div class="button-group">
                    <button type="submit" name="action" value="Login">Login</button>
                    <button type="reset" value="Reset">Reset</button>
                </div>
                <div class="error-message">
                    <%
                        String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                    <%= error%>
                </div>
            </form>
            </br> <a href="MainController?action=CreatePage">Create User</a>
        </div>
    </body>
</html>
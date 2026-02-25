<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(#667eea, #764ba2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }
        .form_fields {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
        }
        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(#667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s;
        }
        button:hover {
            opacity: 0.9;
        }
        .error {
            color: #dc3545;
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        .success {
            color: #155724;
            background: #d4edda;
            border: 1px solid #c3e6cb;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        .info-section {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 25px;
            border-left: 4px solid #667eea;
        }
        .info-section p {
            margin: 8px 0;
            color: #555;
            font-size: 14px;
        }
        .info-label {
            font-weight: 600;
            color: #333;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a {
            color: #667eea;
            text-decoration: none;
            margin: 0 10px;
            font-weight: 500;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .help-text {
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Your Profile</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <% if (request.getAttribute("success") != null) { %>
            <div class="success">
                <%= request.getAttribute("success") %>
            </div>
        <% } %>

        <div class="info-section">
            <p><span class="info-label">Current Username:</span> ${user.username}</p>
            <p><span class="info-label">Current Email:</span> ${user.email}</p>
            <p><span class="info-label">Account Role:</span> ${user.role}</p>
        </div>

        <form method="POST" action="/profile">
            <div class="form_fields">
                <label for="username">New Username (optional)</label>
                <input type="text" id="username" name="username" placeholder="Leave blank to keep current">
            </div>

            <div class="form_fields">
                <label for="email">New Email (optional)</label>
                <input type="email" id="email" name="email" placeholder="Leave blank to keep current">
            </div>

            <div class="form_fields">
                <label for="password">New Password (optional)</label>
                <input type="password" id="password" name="password" placeholder="Leave blank to keep current">
                <div class="help-text">Must be at least 6 characters if changed</div>
            </div>

            <button type="submit">Update Profile</button>
        </form>

        <div class="links">
            <a href="/dashboard">Back to Dashboard</a> | <a href="/logout">Logout</a>
        </div>
    </div>
</body>
</html>


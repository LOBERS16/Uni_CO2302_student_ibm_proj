<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Send Feedback</title>
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
            padding: 20px;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            max-width: 600px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
        }
        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
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
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
        }
        textarea {
            resize: vertical;
            min-height: 150px;
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
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
        }
        .back-btn:hover {
            background: #764ba2;
        }
        .links {
            text-align: center;
            margin-top: 30px;
        }
        .links a {
            color: #667eea;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/dashboard" class="back-btn">← Back to Dashboard</a>

        <h1>Send Us Your Feedback</h1>
        <p class="subtitle">Help us improve! Let us know what you think about SkillsBuild.</p>

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

        <form method="POST" action="/feedback">
            <div class="form_fields">
                <label for="name">Your Name (optional)</label>
                <input type="text" id="name" name="name" placeholder="Your name">
            </div>

            <div class="form_fields">
                <label for="email">Your Email (optional)</label>
                <input type="email" id="email" name="email" placeholder="your@email.com">
            </div>

            <div class="form_fields">
                <label for="subject">Subject (optional)</label>
                <input type="text" id="subject" name="subject" placeholder="What is this feedback about?">
            </div>

            <div class="form_fields">
                <label for="message">Your Feedback</label>
                <textarea id="message" name="message" placeholder="Tell us what you think..." required></textarea>
            </div>

            <button type="submit">Send Feedback</button>
        </form>

        <div class="links">
            <a href="/dashboard">Dashboard</a> | <a href="/profile">Profile</a> | <a href="/support">Get Help</a>
        </div>
    </div>
</body>
</html>


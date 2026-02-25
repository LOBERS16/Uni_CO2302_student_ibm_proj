<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Support & Help</title>
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
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 32px;
            text-align: center;
        }
        .support-section {
            margin-bottom: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        .support-section h2 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 20px;
        }
        .support-section p {
            color: #555;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .faq-item {
            background: white;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .faq-item h3 {
            color: #333;
            margin-bottom: 8px;
            font-size: 16px;
        }
        .faq-item p {
            color: #666;
            font-size: 14px;
        }
        .contact-box {
            background: #e7f3ff;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid #667eea;
            text-align: center;
            margin: 30px 0;
        }
        .contact-box p {
            color: #333;
            margin-bottom: 10px;
        }
        .contact-box a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
        }
        .contact-box a:hover {
            text-decoration: underline;
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
            font-size: 16px;
        }
        .links a:hover {
            text-decoration: underline;
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
    </style>
</head>
<body>
    <div class="container">
        <a href="/dashboard" class="back-btn">← Back to Dashboard</a>

        <h1>Support & Help Center</h1>

        <div class="support-section">
            <h2>📚 Getting Started</h2>
            <p>Welcome to SkillsBuild! Here's how to get started with our platform:</p>
            <div class="faq-item">
                <h3>How do I log in?</h3>
                <p>Use your username and password from your registration. If you don't have an account yet, click on "Register" from the login page.</p>
            </div>
            <div class="faq-item">
                <h3>How do I register?</h3>
                <p>Click on "Register" from the login page, provide your desired username, email, and a strong password (at least 6 characters with special characters).</p>
            </div>
        </div>

        <div class="support-section">
            <h2>🎓 Courses</h2>
            <p>Learn more about our course offerings:</p>
            <div class="faq-item">
                <h3>How do I select courses?</h3>
                <p>Navigate to the "Courses" section from the dashboard. You can browse, search, and filter courses by category or duration.</p>
            </div>
            <div class="faq-item">
                <h3>What are points?</h3>
                <p>Points are awarded based on the number of courses you select. Each selected course counts as 1 point. You can see your total points in your profile.</p>
            </div>
            <div class="faq-item">
                <h3>Can I change my course selections?</h3>
                <p>Yes! You can go back to the course list and select or deselect courses at any time.</p>
            </div>
        </div>

        <div class="support-section">
            <h2>👤 Profile Management</h2>
            <p>Update and manage your account:</p>
            <div class="faq-item">
                <h3>How do I update my profile?</h3>
                <p>Go to your Profile page from the dashboard. You can update your username, email, and password. Only fill in the fields you want to change.</p>
            </div>
            <div class="faq-item">
                <h3>How secure is my password?</h3>
                <p>Your passwords are encrypted using industry-standard security protocols. Never share your password with anyone.</p>
            </div>
        </div>

        <div class="contact-box">
            <p><strong>Still need help?</strong></p>
            <p>If you have any questions or encounter any issues, feel free to send us feedback from your profile page.</p>
            <a href="/profile">Go to Profile</a>
        </div>

        <div class="links">
            <a href="/dashboard">Dashboard</a> | <a href="/profile">Profile</a> | <a href="/courses">Courses</a> | <a href="/logout">Logout</a>
        </div>
    </div>
</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SkillsBuild Dashboard</title>
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
        }
        .nav {
            background: rgba(0,0,0,0.2);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .top_menu {
            display: flex;
            gap: 20px;
        }
        .top_menu a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .top_menu a:hover {
            background: rgba(255,255,255,0.2);
        }
        .user_section {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .profileButton {
            width: 40px;
            height: 40px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #4e73df;
        }
        .logout-btn {
            background: #dc3545;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
        }
        .logout-btn:hover {
            background: #c82333;
        }
        .dashboard-content {
            padding: 35px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .welcome-section {
            background: rgba(255,255,255,0.95);
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .welcome-section h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .streak {
            color: #ff6b6b;
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }
        .options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .menu_Card {
            background: white;
            padding:30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition:0.3s;
            cursor: pointer;

            min-height: 250px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .menu_Card h3 {
            color: #333;
            margin-bottom: 10px;
            font-size: 22px;
        }
        .menu_Card a {
            display: inline-block;
            margin-top: 15px;
            color: #4e73df;
            text-decoration: none;
            font-weight: 600;
            padding: 10px 20px;
            border: 2px solid #4e73df;
            border-radius: 5px;
            transition: all 0.3s;
        }

    </style>
</head>
<body>
<nav class="nav">
    <div class="top_menu">
        <a href="${pageContext.request.contextPath}/dashboard">Home</a>

        <%-- Maybe we can link courses to the courses page or just straight to ibm? Should test and approve --%>
        <a href="${pageContext.request.contextPath}/courses">Courses</a>
        <a href="">My progress</a>
    </div>
    <div class="user_section">
        <div class="profileButton">
            <%= request.getAttribute("username").toString().substring(0,1).toUpperCase() %>
        </div>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </div>
</nav>

<div class="dashboard-content">
    <div class="welcome-section">
        <h2>Student Dashboard</h2>
        <p>Welcome, <strong><%= request.getAttribute("username") %></strong>!</p>
        <p>Your Dashboard:</p>
    </div>

    <div class="options">
        <div class="menu_Card">
            <h3>Learning</h3>
            <p>Access IBM SkillsBuild courses and track your progress</p>
            <a href="${pageContext.request.contextPath}/courses">View Courses</a>
        </div>

        <div class="menu_Card">
            <h3>Competition</h3>
            <p>Compete with friends and check the IBM leaderboard</p>
            <a href="">Leaderboard</a>
        </div>

        <div class="menu_Card">
            <h3>Account</h3>
            <p>Manage your profile and view your achievements</p>
            <a href="${pageContext.request.contextPath}/profile">Manage Profile</a>
        </div>

        <div class="menu_Card">
            <h3>Support</h3>
            <p>Get help on any issues</p>
            <a href="${pageContext.request.contextPath}/feedback">Leave Feedback</a>
        </div>
    </div>
</div>
</body>
</html>
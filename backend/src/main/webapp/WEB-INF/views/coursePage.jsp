<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>IBM SkillsBuild Courses</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background: linear-gradient(#667eea, #764ba2);
            min-height: 100vh;
            padding: 15px;
        }
        .container{
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .course_button {
            border: 2px solid #ddd;
            padding: 20px;
            border-radius: 8px;
        }
        .course_button h3 {
            color: #4e73df;
            margin-bottom: 10px;
        }
        .course_button a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background: #4e73df;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .course_button a:hover {
            background: #3a5dc7;
        }
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
    </head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/dashboard" class="back-btn">Back to dashboard</a>
    <h2>IBM skillsBuild Categories are shown below:</h2>
    <div class="category-grid">
        <a href="https://skillsbuild.org/students/course-catalog/artificial-intelligence" target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
        <h3>Artificial Intelligence</h3>
        <p>Learn the basics of this technology and start building your skills in the AI and machine learning.</p>
        </div>
        </a>
    </div>

</div>
</body>
</html>
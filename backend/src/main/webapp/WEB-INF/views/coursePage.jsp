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
    <a href="${pageContext.request.contextPath}/dashboard" class="back-btn">Go back to dashboard</a>
    <h2>Here are the IBM skillsbuild categories to choose from:</h2>
    <div class="category-grid">
        <a href="https://skillsbuild.org/students/course-catalog/artificial-intelligence" target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
        <h3>Artificial Intelligence</h3>
        <p>Learn the basics of this technology and start building your skills in the AI and machine learning here:</p>
        </div>
        </a>

    <a href="https://skillsbuild.org/students/course-catalog/blockchain" target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
        <h3>Blockchain</h3>
        <p>Explore blockchain technology, a foundational technology for cryptocurrency. Transform your digital transaction knowledge here: </p>

    </div>
    </a>
    <a href="https://skillsbuild.org/students/course-catalog/cloud-computing" target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
            <h3>Cloud Computing</h3>
            <p>Discover cloud computing, a core technology behind photos,apps and music. Learn the invisible infrastructure that powers these digital services here: </p>
        </div>
    </a>

    <a href="https://skillsbuild.org/students/course-catalog/cybersecurity" target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
            <h3>Cyber Security</h3>
            <p>Learn the basics of cybersecurity and why it's such a growing career field, while building skills and insights into the world of digital security.</p>
        </div>
    </a>
    <a href="https://skillsbuild.org/students/course-catalog/data-science"target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
            <h3>Data Science</h3>
            <p>Learn how companies collect massive amounts of data created online and understand the data science to become an informed digital consumer</p>

        </div>
    </a>
    <a href="https://skillsbuild.org/students/course-catalog/emerging-tech-intro" target="_blank" style="text-decoration: none; color: inherit;">
        <div class="course_button">
            <h3>Emerging Tech Intro</h3>
            <p> if you are unsure with what to start learning in the tech realm starting with Explore Emerging Tech is a great way to provide an introduction to six emerging technologies powering today's jobs.</p>
        </div>
    </a>
    </a>
    </div>

</div>
</body>
</html>
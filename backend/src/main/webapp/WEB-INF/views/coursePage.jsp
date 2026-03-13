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


    <a href="${pageContext.request.contextPath}/courses_list" class="back-btn">Search and track courses</a>
    <h2>Here are the IBM skillsbuild categories to choose from:</h2>
    <div class="category-section">
        <div class="category-header">
            <h3>Artificial Intelligence</h3>
            <a href="https://skillsbuild.org/students/course-catalog/artificial-intelligence"
               target="_blank" class="category-link">
                View All AI Courses
            </a>
        </div>
        <p class="category-description">
            Learn the basics of this technology and start building your skills in the AI and machine learning here
        </p>

        <div class="category-grid">
            <div class="course_button">
                <h3>Introduction to AI</h3>
                <p>90 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Building trustworthy AI enterprise solutions</h3>
                <p>60 minutes - Intermediate</p>
            </div>
            <div class="course_button">
                <h3>Using Generative AI and understanding ethical considerations</h3>
                <p>105 minutes - Intermediate</p>
            </div>
        </div>
    </div>


    <div class="category-section">
        <div class="category-header">
            <h3>Blockchain</h3>
            <a href="https://skillsbuild.org/students/course-catalog/blockchain"
               target="_blank" class="category-link">
                View All Blockchain Courses
            </a>
        </div>
        <p class="category-description">
            Explore blockchain technology, a foundational technology for cryptocurrency. Transform your digital transaction knowledge here:
        </p>

        <div class="category-grid">
            <div class="course_button">
                <h3>Blockchain Basics</h3>
                <p>60 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Introduction to Cryptocurrency</h3>
                <p>75 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Smart Contracts Development</h3>
                <p>120 minutes - Advanced</p>
            </div>
        </div>
    </div>


    <div class="category-section">
        <div class="category-header">
            <h3>Cloud Computing</h3>
            <a href="https://skillsbuild.org/students/course-catalog/cloud-computing"
               target="_blank" class="category-link">
                View All Cloud Courses
            </a>
        </div>
        <p class="category-description">
            Discover cloud computing, a core technology behind photos, apps and music. Learn the invisible infrastructure that powers these digital services here:
        </p>

        <div class="category-grid">
            <div class="course_button">
                <h3>Cloud Fundamentals</h3>
                <p>75 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Introduction to IBM Cloud</h3>
                <p>60 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Deploying Applications on Cloud</h3>
                <p>150 minutes - Intermediate</p>
            </div>
        </div>
    </div>


    <div class="category-section">
        <div class="category-header">
            <h3>Cybersecurity</h3>
            <a href="https://skillsbuild.org/students/course-catalog/cybersecurity"
               target="_blank" class="category-link">
                View All Security Courses
            </a>
        </div>
        <p class="category-description">
            Learn the basics of cybersecurity and why it's such a growing career field, while building skills and insights into the world of digital security.
        </p>

        <div class="category-grid">
            <div class="course_button">
                <h3>Cybersecurity Essentials</h3>
                <p>100 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Network Security Fundamentals</h3>
                <p>180 minutes - Intermediate</p>
            </div>
            <div class="course_button">
                <h3>Threat Detection and Response</h3>
                <p>120 minutes - Advanced</p>
            </div>
            <div class="course_button">
                <h3>System and Network security</h3>
                <p>120 minutes - Advanced</p>
            </div>
            <div class="course_button">
                <h3>System and Network security</h3>
                <p>90 minutes - Advanced</p>
            </div>
            <div class="course_button">
                <h3>Security operations and management</h3>
                <p>135 minutes - Advanced</p>
            </div>
        </div>
    </div>


    <div class="category-section">
        <div class="category-header">
            <h3>Data Science</h3>
            <a href="https://skillsbuild.org/students/course-catalog/data-science"
               target="_blank" class="category-link">
                View All Data Science Courses
            </a>
        </div>
        <p class="category-description">
            Learn how companies collect massive amounts of data created online and understand the data science to become an informed digital consumer
        </p>

        <div class="category-grid">
            <div class="course_button">
                <h3>Data collection and Analysis</h3>
                <p>120 minutes - Intermediate</p>
            </div>
            <div class="course_button">
                <h3>Introduction to Data Visualization</h3>
                <p>90 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Problem framing and Data Analysis planning</h3>
                <p>120 minutes - Intermediate</p>
            </div>
            <div class="course_button">
                <h3>Data Visualisation and solution design</h3>
                <p>90 minutes - Intermediate</p>
            </div>
        </div>
    </div>


    <div class="category-section">
        <div class="category-header">
            <h3>Emerging Tech Intro</h3>
            <a href="https://skillsbuild.org/students/course-catalog/emerging-tech-intro"
               target="_blank" class="category-link">
                View All Emerging Tech Courses
            </a>
        </div>
        <p class="category-description">
            if you are unsure with what to start learning in the tech realm starting with Explore Emerging Tech is a great way to provide an introduction to six emerging technologies powering today's jobs.
        </p>

        <div class="category-grid">
            <div class="course_button">
                <h3>Turn Ideas Into Prototypes With Vibe Coding</h3>
                <p>60 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Unleashing the Power of AI Agents</h3>
                <p>90 minutes - Beginner</p>
            </div>
            <div class="course_button">
                <h3>Introduction to Quantum Computing</h3>
                <p>90 minutes - Intermediate</p>
            </div>
        </div>
    </div>

</div>
</body>
</html>
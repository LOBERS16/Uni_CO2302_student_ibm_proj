<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>IBM SkillsBuild — Courses</title>
</head>

<body>

<div class="card">

    <h1>IBM SkillsBuild</h1>

    <h3>Available Courses</h3>


    <div class="course">
        <strong>Introduction to AI</strong>
        <p>Beginner — Artificial Intelligence</p>
        <a href="https://skillsbuild.org/students/course-catalog" target="_blank" class="btn">
            Start Course
        </a>
    </div>

    <div class="course">
        <strong>Cybersecurity Fundamentals</strong>
        <p>Beginner — Security</p>
        <a href="https://skillsbuild.org/students/course-catalog" target="_blank" class="btn">
            Start Course
        </a>
    </div>



    <div class="course">
        <strong>Cloud Computing Basics</strong>
        <p>Intermediate — Cloud</p>
        <a href="https://skillsbuild.org/students/course-catalog" target="_blank" class="btn">
            Start Course
        </a>
    </div>

    <div class="course">
        <strong>Data Science Essentials</strong>
        <p>Intermediate — Data</p>
        <a href="https://skillsbuild.org/students/course-catalog" target="_blank" class="btn">
            Start Course
        </a>
    </div>

    <br>

    <a href="/dashboard" class="back-link">← Back to Dashboard</a>

</div>




<style>






    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #5a6fd6, #7a5bbf);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* White card */
    .card {
        background: white;
        padding: 35px;
        border-radius: 12px;
        width: 420px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        text-align: center;
    }


    h1 {
        margin-top: 0;
        margin-bottom: 10px;
        color: #333;
    }

    h3 {
        margin-top: 0;
        margin-bottom: 20px;
        color: #333;
    }




    .course {
        text-align: left;
        margin: 18px 0;
        padding-bottom: 12px;
        border-bottom: 1px solid #eee;
    }






    .course p {
        margin: 4px 0 10px;
        color: #555;
    }


    .btn {
        display: inline-block;
        width: 100%;
        padding: 10px;
        background-color: #2ea043;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 15px;
        text-align: center;
    }

    .btn:hover {
        background-color: #218838;
    }


    .back-link {
        text-decoration: none;
        color: #5a6fd6;
        font-weight: bold;
    }

    .back-link:hover {
        text-decoration: underline;
    }

</style>
</body>


</html>
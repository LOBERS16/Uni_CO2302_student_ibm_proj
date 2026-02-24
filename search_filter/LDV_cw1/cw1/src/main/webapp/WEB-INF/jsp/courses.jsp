<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Course Hub</title>
</head>
<body>

<h2>Course Hub (SkillsBuild simulated)</h2>

<div style="padding:8px;border:1px solid #ccc;margin-bottom:12px;">
    <strong>${menuState}</strong>
</div>

<form method="get" action="${pageContext.request.contextPath}/courses">
    <input type="text" name="searchText" placeholder="Search code or title" value="${searchText}" />

    <select name="category">
        <option value="">Any category</option>
        <c:forEach var="cat" items="${categories}">
            <option value="${cat}" <c:if test="${cat == category}">selected</c:if>>${cat}</option>
        </c:forEach>
    </select>

    <select name="difficulty">
        <option value="">Any difficulty</option>
        <c:forEach var="d" items="${difficulties}">
            <option value="${d}" <c:if test="${d == difficulty}">selected</c:if>>${d}</option>
        </c:forEach>
    </select>

    <input type="number" name="maxDurationMins" placeholder="Max duration (mins)" value="${maxDurationMins}" min="1" />

    <button type="submit">Search</button>
    <a href="${pageContext.request.contextPath}/courses">Reset</a>
</form>

<hr/>

<table border="1" cellpadding="6">
    <tr>
        <th>Code</th>
        <th>Title</th>
        <th>Category</th>
        <th>Difficulty</th>
        <th>Duration (mins)</th>
    </tr>

    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.code}</td>
            <td>${course.title}</td>
            <td>${course.category}</td>
            <td>${course.difficulty}</td>
            <td>${course.durationMins}</td>
        </tr>
    </c:forEach>

    <c:if test="${empty courses}">
        <tr><td colspan="5">No courses found.</td></tr>
    </c:if>
</table>

</body>
</html>
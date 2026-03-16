<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Global Leaderboard</title>
</head>
<body>
    <div class="container">
    <h2>The Global Leaderboard</h2>
    <c:forEach var="user" items="${users}" varStatus="status">
        <div>
            <p>${status.count}: ${user.username} | points = ${user.points}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>
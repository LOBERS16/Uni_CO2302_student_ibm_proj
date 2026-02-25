<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Course Hub</title>
</head>
<body>

<h2>Course Hub</h2>

<div style="padding:8px;border:1px solid #ccc;margin-bottom:12px;">
    <strong>${menuState}</strong>
    <span style="float:right;">
        Points: <strong id="pointsTotal">${points}</strong>
    </span>
</div>

<form method="get" action="${pageContext.request.contextPath}/courses_list">
    <input type="text" name="searchText" placeholder="Search code or title" value="${searchText}" />

    <select name="category">
        <option value="">Any category</option>
        <c:forEach var="cat" items="${categories}">
            <option value="${cat}" <c:if test="${cat == category}">selected</c:if>>${cat}</option>
        </c:forEach>
    </select>

    <input type="number" name="maxDurationMins" placeholder="Max duration (mins)" value="${maxDurationMins}" min="1" />

    <button type="submit">Search</button>
    <a href="${pageContext.request.contextPath}/courses_list">Reset</a>
</form>

<hr/>

<table border="1" cellpadding="6">
    <tr>
        <th>Code</th>
        <th>Title</th>
        <th>Category</th>
        <th>Duration (mins)</th>
        <th>Languages</th>
        <th>Done</th>
    </tr>

    <c:forEach var="course" items="${courses}">
        <tr>
            <td>${course.code}</td>
            <td>${course.title}</td>
            <td>${course.category}</td>
            <td>${course.durationMins}</td>
            <td>${course.languages}</td>

            <td style="text-align:center;">
                <input
                        type="checkbox"
                        class="courseTick"
                        data-code="${course.code}"
                        <c:if test="${selectedCodes.contains(course.code)}">checked</c:if>
                />
            </td>
        </tr>
    </c:forEach>

    <c:if test="${empty courses}">
        <tr><td colspan="6">No courses found.</td></tr>
    </c:if>
</table>

<script>
    const totalEl = document.getElementById("pointsTotal");

    document.querySelectorAll(".courseTick").forEach(cb => {
        cb.addEventListener("change", async () => {
            const code = cb.dataset.code;
            const checked = cb.checked;

            const form = new URLSearchParams();
            form.append("code", code);
            form.append("checked", checked);

            const resp = await fetch("${pageContext.request.contextPath}/courses_list/tick", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: form.toString()
            });

            const newTotal = await resp.text();
            totalEl.textContent = newTotal;
        });
    });
</script>

</body>
</html>
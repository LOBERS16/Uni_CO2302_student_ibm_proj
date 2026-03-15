<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Course Hub</title>
</head>
<body>

<h2 style="margin:0 0 12px 0;">
    <a href="${pageContext.request.contextPath}/dashboard"
       style="display:inline-block; padding:10px 14px; border:1px solid #ccc; border-radius:6px;
              text-decoration:none; color:inherit; background:#f7f7f7;">
        Course Hub
    </a>
</h2>

<div style="padding:8px;border:1px solid #ccc;margin-bottom:12px;">
    <strong>${menuState}</strong>
    <span style="float:right;">
        Points: <strong id="pointsTotal">${points}</strong>
        |
        Completion: <strong id="completionPercent">${completionPercent}%</strong>
        (${points}/${totalCourses})
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
        <th>Start</th>
        <th>Done</th>
        <th>Started At</th>
        <th>Completed At</th>
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
                        class="startTick"
                        data-code="${course.code}"
                        <c:if test="${progressMap[course.code] != null && progressMap[course.code].started}">checked</c:if>
                />
            </td>

            <td style="text-align:center;">
                <input
                        type="checkbox"
                        class="finishTick"
                        data-code="${course.code}"
                        <c:if test="${progressMap[course.code] != null && progressMap[course.code].finished}">checked</c:if>
                />
            </td>

            <td>
                <c:choose>
                    <c:when test="${progressMap[course.code] != null && progressMap[course.code].startedAt != null}">
                        ${progressMap[course.code].startedAtFormatted}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>

            <td>
                <c:choose>
                    <c:when test="${progressMap[course.code] != null && progressMap[course.code].finishedAt != null}">
                        ${progressMap[course.code].finishedAtFormatted}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>

    <c:if test="${empty courses}">
        <tr><td colspan="9">No courses found.</td></tr>
    </c:if>
</table>

<script>
    const totalEl = document.getElementById("pointsTotal");
    const percentEl = document.getElementById("completionPercent");

    document.querySelectorAll(".startTick").forEach(cb => {
        cb.addEventListener("change", async () => {
            const code = cb.dataset.code;
            const checked = cb.checked;

            const form = new URLSearchParams();
            form.append("code", code);
            form.append("checked", checked);

            const resp = await fetch("${pageContext.request.contextPath}/courses_list/start", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: form.toString()
            });

            const result = await resp.text();
            const parts = result.split(",");

            totalEl.textContent = parts[0];
            percentEl.textContent = parts[1] + "%";

            location.reload();
        });
    });

    document.querySelectorAll(".finishTick").forEach(cb => {
        cb.addEventListener("change", async () => {
            const code = cb.dataset.code;
            const checked = cb.checked;

            const form = new URLSearchParams();
            form.append("code", code);
            form.append("checked", checked);

            const resp = await fetch("${pageContext.request.contextPath}/courses_list/finish", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: form.toString()
            });

            const result = await resp.text();
            const parts = result.split(",");

            totalEl.textContent = parts[0];
            percentEl.textContent = parts[1] + "%";

            location.reload();
        });
    });
</script>

</body>
</html>
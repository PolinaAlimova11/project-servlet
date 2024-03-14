<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link href="static/main.css" rel="stylesheet">
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
</head>
<body>
<h1>Tic-Tac-Toe</h1>

<table>
    <tr>
        <td onclick="window.location='/logic?click=0'">
            <c:out value="${data.get(0).getSign()}"/>
        </td>
        <td onclick="window.location='/logic?click=1'">
            <c:out value="${data.get(1).getSign()}"/>
        </td>
        <td onclick="window.location='/logic?click=2'">
            <c:out value="${data.get(2).getSign()}"/>
        </td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'">
            <c:out value="${data.get(3).getSign()}"/>
        </td>
        <td onclick="window.location='/logic?click=4'">
            <c:out value="${data.get(4).getSign()}"/>
        </td>
        <td onclick="window.location='/logic?click=5'">
            <c:out value="${data.get(5).getSign()}"/>
        </td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'">
            <c:out value="${data.get(6).getSign()}"/>
        </td>
        <td onclick="window.location='/logic?click=7'">
            <c:out value="${data.get(7).getSign()}"/>
        </td>
        <td onclick="window.location='/logic?click=8'">
            <c:out value="${data.get(8).getSign()}"/>
        </td>
    </tr>
</table>

<hr>
<c:set var="CROSS" value="${sessionScope.get(\"signCROSS\")}" />
<c:set var="NOUGHT" value="${sessionScope.get(\"signNOUGHT\")}" />

<c:if test="${winner == CROSS}">
    <h1>CROSSES WIN</h1>
    <button onclick="restart()">Start again</button>
</c:if>

<c:if test="${winner == NOUGHT}">
    <h1>CROSSES NOUGHT</h1>
    <button onclick="restart()">Start again</button>
</c:if>

<c:if test="${draw}">
    <h1>IT'S A DRAW</h1>
    <br>
    <button onclick="restart()">Start again</button>
</c:if>


<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문조사 결과</title>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String year = request.getParameter("year");
        String name = request.getParameter("name");
        String[] pet = request.getParameterValues("pet"); // checkbox는 여러개가 올 수 있으므로, getParameterValues

        for(int i=0; i<pet.length;i++) {
            if (pet[i].equals("dog")) {
                pet[i] = "강아지";
            } else if (pet[i].equals("cat")) {
                pet[i] = "고양이";
            } else if (pet[i].equals("cow")) {
                pet[i] = "송아지";
            } else {
                pet[i] = "망아지";
            }
        }

    %>
</head>
<body>
    <div class="container">
        <p>아이디 : <strong><%=id %></strong></p>
        <p>출생년도 : <strong><%=year %></strong></p>
        <p>이름 : <strong><%=name %></strong></p>
        <p>좋아하는 동물<br>
            <% for(int i = 0; i<pet.length; i++) { %>
            <strong><%=pet[i] %></strong><br>
            <% }%>
        </p>
        <a href="test03.jsp">테스트03으로 돌아가기</a><br>
        <a href="test04.jsp">테스트04로 이동하기</a>
    </div>
</body>
</html>
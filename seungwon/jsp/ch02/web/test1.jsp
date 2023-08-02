<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html,charset=utf-8");
%>
</head>
<body>
<div class="msg">
    <h2>pageContext</h2>
    <hr>
    <%
        String str = request.getParameter("str");
        if(str.equals("include")){
            pageContext.include("target.jsp");
        } else if(str.equals("forward")){
            pageContext.forward("target.jsp");
        } else {
                out.println("<h2>잘못된 값입니다.</h2>");
         }
    %>
</div>
</body>
</html>

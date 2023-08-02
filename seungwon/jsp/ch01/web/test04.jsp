<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더 정보 출력하기 </title>
    <%
        request.setCharacterEncoding("UTF-8");
        String msg = request.getParameter("msg");
    %>
</head>
<body>
<div class="container">
    <h2 class="title">요청 정보 및 헤더 정보 출력하기</h2>
    <hr>
    <ul class="list">
        <li><span>메시지</span> : <strong><%=msg %></strong></li>
        <li><span>프로토콜</span> : <strong><%=request.getProtocol() %></strong></li>
        <li><span>요청된 서버 이름</span> : <strong><%=request.getServerName() %></strong></li>
        <li><span>요청방식</span> : <strong><%=request.getMethod() %></strong></li>
        <li><span>파라미터열</span> : <strong><%=request.getQueryString() %></strong></li>
        <li><span>요청주소</span> : <strong><%=request.getRequestURL() %></strong></li>
        <li><span>요청URL</span> : <strong><%=request.getRequestURL() %></strong></li>
        <li><span>서버이름</span> : <strong><%=request.getRemoteHost()%></strong></li>
        <li><span>서버주소</span> : <strong><%=request.getRemoteAddr()%></strong></li>
        <li><span>서버포트(원격)</span> : <strong><%=request.getRemotePort()%></strong></li>
        <li><span>서버포트(지역)</span> : <strong><%=request.getServerPort()%></strong></li>
        <li><span>현재 문서의 경로</span> : <strong><%=request.getContextPath()%></strong></li>
        <li><span>헤더의 어셉트</span> : <strong><%=request.getHeader("Accept")%></strong></li>
        <li><span>헤더의 호스트(host) 주소</span> : <strong><%=request.getHeader("host")%></strong></li>
    </ul>
    <hr>
    <br>
    <hr>
    <table class="table" id="tb1">
        <caption><h2>헤더 정보</h2></caption>
        <tbody>
        <%
            Enumeration e = request.getHeaderNames();
            while(e.hasMoreElements()){
                String hdName = (String) e.nextElement();
        %>
        <tr>
            <td><%=hdName %></td>
            <td><%=request.getHeader(hdName) %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <hr>
    <p>정보 : <%=request.getParameter("id")%></p>
</div>
</body>
</html>

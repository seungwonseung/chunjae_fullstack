<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2023-07-27
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%-- 1. 디렉티브(Directive --%>
<%-- <%@ %>로 감싼다 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%-- 2. 선언문  : 클래스를 선언--%>
<%-- --%>
<%!
    private String name;
    public String getName(){
        return this.name;
    }
    public void setName(String name){
        this.name = name;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>기본 구성 요소</title>
</head>
<body>
<%-- 스크립트릿(Scriptlet) --%>
<%-- <% %> 로 감싼다. : JAVA 코등 긴,ㅇ--%>
<%
    setName("김기태");
    String addr = "가산동";
%>
<hr>
<%-- 표현식(EXpression) : 값을 가져와서 출력 --%>
<%-- <%= %> 로 감싸는 것은 표현식--%>
<p>이름 : <%=getName() %></p>
<p>주소 : <%=addr %></p>
</body>
</html>

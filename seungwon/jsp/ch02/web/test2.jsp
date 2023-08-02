<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객체 제어</title>
</head>
<body>
<%
    //보내는 곳에서 담는 부분
    Student st1 = new Student();
    st1.setNo(1);
    st1.setName("ㄱㄱㅌ대왕");
    st1.setKor(100);
    st1.setEng(70);
    st1.setMat(100);
    request.setAttribute("st1", st1);

    List<Student> st = new ArrayList<>();
    Student s = new Student();
    s.setNo(1);
    s.setName("이은영");
    s.setKor(90);
    s.setEng(80);
    s.setMat(70);
    st.add(s);
    Student s2 = new Student();
    s2.setNo(2);
    s2.setName("신승원");
    s2.setKor(100);
    s2.setEng(60);
    s2.setMat(80);
    st.add(s2);
    request.setAttribute("st", st);

    ArrayList<String> lst = new ArrayList<>();
    lst.add("오세훈");
    lst.add("백준철");
    lst.add("구예진");
    lst.add("신승원");
    request.setAttribute("lst", lst);

    HashSet<String> set = new HashSet<>();
    set.add("오태훈");
    set.add("김현경");
    set.add("박진권");
    set.add("김보경");
    set.add("신예은");
    set.add("김현경");
    request.setAttribute("set", set);

    HashMap<String, String> map = new HashMap<>();
    map.put("no", "3");
    map.put("name", "서광");
    map.put("kor", "80");
    map.put("eng", "90");
    map.put("mat", "85");
    request.setAttribute("map", map);
    RequestDispatcher rd = request.getRequestDispatcher("test3.jsp"); //보내질 곳 지정
    rd.forward(request, response);
    //response.sendRedirect("test3.jsp?map="+map);  //사이트 이동
%>
<%
    //받는 곳에서 출력하는 부분
    out.println("<p>번호 : "+st1.getNo()+"</p>");
%>
    <p>이름 : <%=st1.getName() %></p>
    <p>국어 : <%=st1.getKor() %></p>
    <p>영어 : <%=st1.getEng() %></p>
    <p>수학 : <%=st1.getMat() %></p>
    <p>총점 : <%=st1.getKor()+st1.getEng()+st1.getMat() %></p>
<hr>
<div class="msg">
    <h2 class="title">자바의 객체 데이터를 전송합니다.</h2>
</div>
</body>
</html>
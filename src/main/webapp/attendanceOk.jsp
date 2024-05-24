<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>

<%
   Connection conn = db.getConnection();
   AttendanceDao dao = new AttendanceDao(conn);
    String check = request.getParameter("check");
    String num = request.getParameter("num");
    int stNum = Integer.parseInt(num);
    
    dao.check(check, stNum);
    
    System.out.println(check);
    
    
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
    alert("체크 되었습니다.");
    location.href="attendance.jsp";
    </script>
</body>
</html>
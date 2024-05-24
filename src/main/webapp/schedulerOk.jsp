<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="inc/header.jsp" flush="true" />
<jsp:include page="inc/aside.jsp" flush="true" />
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>

<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>
<% 
    request.setCharacterEncoding("utf-8");
    Connection conn = db.getConnection();
    ScheduleDao dao = new ScheduleDao(conn);
   

   String cls = request.getParameter("class");
   int cls2 = Integer.parseInt(cls);
   System.out.println(cls);
   
   ArrayList<scDto> lists = dao.selectDB(cls2);
   
   String title = "";
   String week = "";
   String time = "";
   for(int i=0; i<lists.size(); i++) {
       scDto dto = lists.get(i);
       title = dto.getTitle();
       week = dto.getWeek();
       time = dto.getTime();
       System.out.println(title +"," +week + ","+time);
   } 
   
   
   db.closeConnection();
%>


<div class="notice">
    <div class="left">수강신청 마감일정 2024년 04월 02일 18:00<br>
                      ! 일정을 반드시 지켜주세요 !</div>
    <div class="right">- 마감시간 이후에는 변경이 불가하며, 인원충족 시 전산확정 됩니다.<br>
                       - 장바구니 담기 기간 이후의 변경내역은 장바구니에 적용되지 않습니다.</div>
  </div>
  <p class="intertablep">선택한 과목 개수 : <%=cls %></p>
  
  
         <table class="table table-bordered">
            <thead class="text-center">
                <tr>
                    <th>시간</th>
                    <th>월요일</th>
                    <th>화요일</th>
                    <th>수요일</th>
                    <th>목요일</th>
                    <th>금요일</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <tr>
                    <th>1교시<br>09:00~10:00</th>
                    <td class="mon1">
                <% 
                if ((week.equals("월")) && (time.equals("mon1"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td class="tue1">
                    <% 
                if ((week.equals("화")) && (time.equals("tue1"))) { 
                %>
                <%= title %>
                <% } else { } %>
                </td>
                    <td class="wed1">
                    <% 
                if ((week.equals("수")) && (time.equals("wed1"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td class="thu1">
                    <% 
                if ((week.equals("목")) && (time.equals("thu1"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td class="fri1">
                     <% 
                if ((week.equals("금")) && (time.equals("fri1"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
                <tr>
                
                    <th>2교시<br>10:00~11:00</th>
                    <td>
                    <%  if ((week.equals("월")) && (time.equals("mon2"))) {  %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("화")) && (time.equals("tue2"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("수")) && (time.equals("wed2"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("목")) && (time.equals("thu2"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("금")) && (time.equals("fri2"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
                <tr>
                
                    <th>3교시<br>11:00~12:00</th>
                    <td>
                    <% 
                if ((week.equals("월")) && (time.equals("mon3"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                     <% 
                if ((week.equals("화")) && (time.equals("tue3"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("수")) && (time.equals("wed3"))) { 
                %>
                <%= title %>
                <% } else { } %>
                </td>
                    <td>
                    <% 
                if ((week.equals("목")) && (time.equals("thu3"))) { 
                %>
                <%= title %>
                <% } else { } %>
                </td>
                    <td>
                    <% 
                if ((week.equals("금")) && (time.equals("fir3"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
                <tr>
                    <th>4교시<br>12:00~13:00</th>
                        <td>
                    <% 
                if ((week.equals("월")) && (time.equals("mon4"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("화")) && (time.equals("tue4"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("수")) && (time.equals("wed4"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("목")) && (time.equals("thu4"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("금")) && (time.equals("fri4"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
                <tr>
                    <th>5교시<br>13:00~14:00</th>
                        <td>
                    <% 
                if ((week.equals("월")) && (time.equals("mon5"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("화")) && (time.equals("tue5"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("수")) && (time.equals("wed5"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("목")) && (time.equals("thu5"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("금")) && (time.equals("fri5"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
                <tr>
                    <th>6교시<br>14:00~15:00</th>
                        <td>
                    <% 
                if ((week.equals("월")) && (time.equals("mon6"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("화")) && (time.equals("tue6"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("수")) && (time.equals("wed6"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("목")) && (time.equals("thu6"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("금")) && (time.equals("fri6"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
                <tr>
                    <th>7교시<br>15:00~16:00</th>
                        <td>
                    <% 
                if ((week.equals("월")) && (time.equals("mon7"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("화")) && (time.equals("tue7"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("수")) && (time.equals("wed7"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("목")) && (time.equals("thu7"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                    <td>
                    <% 
                if ((week.equals("금")) && (time.equals("fri7"))) { 
                %>
                <%= title %>
                <% } else { } %>
                    </td>
                </tr>
            </tbody>
        </table>

<jsp:include page="inc/footer.jsp" flush="true" />
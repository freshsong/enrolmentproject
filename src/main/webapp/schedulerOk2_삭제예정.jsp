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
   
   String web = "";
   String java = "";
   String data = "";
   String view = "";
   
   String selectedClasses = request.getParameter("selected");
   String[] sClass = selectedClasses.split(","); 
   for(int i=0; i<sClass.length; i++){

      if(sClass[i].equals("웹디자인")){
         web = sClass[i];
      }else if(sClass[i].equals("자바프로그래밍")){
         java = sClass[i];
      }else if(sClass[i].equals("데이터베이스")){
         data = sClass[i];
      }else if(sClass[i].equals("영상편집")){
         view = sClass[i];
      }
      
   }
   
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
  <p>선택한 과목 : <%=cls %></p>
  
  
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
               <%=title %>
                    </td>
                    <td class="tue1">
                   
                <%= title %>
                </td>
                    <td class="wed1">
                <%= title %>
                    </td>
                    <td class="thu1">
                <%= title %>
                    </td>
                    <td class="fri1">
                <%= title %>
                    </td>
                </tr>
                <tr>
                
                    <th>2교시<br>10:00~11:00</th>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                </tr>
                <tr>
                
                    <th>3교시<br>11:00~12:00</th>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                </tr>
                <tr>
                    <th>4교시<br>12:00~13:00</th>
                      <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                </tr>
                <tr>
                    <th>5교시<br>13:00~14:00</th>
                     <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                </tr>
                <tr>
                    <th>6교시<br>14:00~15:00</th>
                     <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                </tr>
                <tr>
                    <th>7교시<br>15:00~16:00</th>
                        <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                    <td>
                <%= title %>
                    </td>
                </tr>
            </tbody>
        </table>

<jsp:include page="inc/footer.jsp" flush="true" />
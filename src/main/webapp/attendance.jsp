<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="inc/header.jsp" flush="true" />



<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="school.dto.*" %>
<%@ page import="school.dao.*" %>
<jsp:useBean id="db" class="school.dao.DBConnect" scope="page"/>

<%
   request.setCharacterEncoding("UTF-8");
   Connection conn = db.getConnection();
   AttendanceDao dao = new AttendanceDao(conn);
   //String pf = (String) session.getAttribute("name");

   int num = 1;
   
   ArrayList<ADto> list = dao.view(num);
   
   int stnum = 0;
   int att = 0;
   int abs = 0;
   int late = 0;
   int ets = 0;
   String dep = null; 
   String name = null; 
   String phoneNum =null; 
   
   
   
   for(int i = 0; i<list.size(); i++){
         ADto dto = list.get(i);
         
         stnum = dto.getStNum();
         dep = dto.getDep();
         name = dto.getStName();
         phoneNum = dto.getStPhoneNum();
         
         att = dto.getAtt();
         abs = dto.getAbs();
         late = dto.getLate();
         ets = dto.getEts();
         
      }
   
   
   
   db.closeConnection();
   
%>

<div class="tab-menu1">
     <div class="tab-menu attmenu">
                           <div class="tab-btn">
                             <h3>출석 관리</h3>
                             <br>
                               <ul>
                                   <li class="active"><a href="attendance.jsp">출석 관리</a></li>
                                   <li><a href="attendancePr.jsp">출석부</a></li>
                               </ul>
                           </div>
                           <div class="tab-cont">
                             <div class="tab-in">
                               <form action="attendance.jsp" method="get">
                                                        
                                   <div>
                                     <label for="date">출결 날짜</label> 
                                     <input type="date" name="date" id="date"></input>  
                                     <select name="time" id="time">
                                         <option value="1교시">1교시</option>
                                         <option value="2교시">2교시</option>
                                         <option value="3교시">3교시</option>
                                         <option value="4교시">4교시</option>
                                         <option value="5교시">5교시</option>
                                         <option value="6교시">6교시</option>
                                     </select>
                                   </div>
                                   <br>
                                   <div>
                                     <label for="lists">목록수</label>
                                     <select name="lists" id="lists">
                                         <option value="1">1</option>
                                         <option value="2">2</option>
                                         <option value="3">3</option>
                                         <option value="4">4</option>
                                         <option value="5">5</option>
                                         <option value="6">6</option>
                                     </select>
                                   </div>
                                   <br>
                                   <div>
                                     <label for="seach">검색</label>
                                     <select name="seach" id="seach">
                                         <option value="학번">학번</option>
                                         <option value="학과">학과</option>
                                         <option value="이름">이름</option>
                                     </select>
                                     <input type="text" id="search_box">
                                     <button type="submit" id ="att_btn" class="btn btn-outline-dark">
                                       검색
                                     </button>
                                   </div>
                                   <br>
                                   <div>
                                     <label for="outocheck">자동 출결</label>
                                     <button type="submit" class="btn" id="att_btn2">자동 출결 시작</button>
                                   </div>
                                   <br>
                             </form>
                             </div>
                           </div>
                       </div>
                    
                                            <!-- 출석부 -->
                     <div id="check">
                           <p>*출석현황을 체크하신 후에 하단의 저장버튼을 눌러주세요</p>
                           <input type="radio"  name="frcheck" value="att">
                              <label for="출석">출석</label>
                           <input type="radio"  name="frcheck" value="abs">
                              <label for="결석">결석</label>
                           <input type="radio"  name="frcheck" value="late">
                              <label for="지각">지각</label>
                           <input type="radio"  name="frcheck" value="ets">
                              <label for="기타">기타</label>
                           <button type="submit" class="btn" id="att_btn3">일괄상태처리</button>
                     </div>
                     <div class="atttablebox"> 
                     <form name="attform" action="attendancePr.jsp" method="post">           
                         <table>
                            <colgroup>
                               <col width="11%">
                               <col width="15%">
                               <col width="13%">
                               <col width="7%">
                               <col width="14%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                            </colgroup>
                            <thead>
                               <tr>
                                  <th>사진</th>
                                  <th>학과(전공)</th>
                                  <th>학년</th>
                                  <th>학번</th>
                                  <th>이름</th>
                                  <th colspan="4">상태</th>
                               </tr>
                            </thead>
                            <tbody id="tby">
                            <%
                              for(int i=0; i<list.size(); i++){
                                ADto dto = list.get(i);
                                dep = dto.getDep();
                                stnum = dto.getStNum();
                                name = dto.getStName();
                              
                            %>
                              <input type="hidden" name="seq" value="<%=i%>">

                                                 
                               <tr>
                                  <td><i class="ri-image-line" alt="사진"></i></td>
                                  <td><%=dep %></td>
                                  <td>1학년</td>
                                  <td><%=stnum %></td>
                                  <input type="hidden" value="<%=stnum %>" name="num<%=i %>"/>
                                  <td><%=name %></td>
                                  <td>
                                  
                                   <input type="radio" name="check<%=i %>" value="att">
                        
                                   <label for="출석">출석</label>
                                 </td>
                                  <td>
                                  
                                   <input type="radio" name="check<%=i %>" value="abs">
                                  
                                   <label for="결석">결석</label>
                                   
                                 </td>
                                  <td>
                                  
                                   <input type="radio"  name="check<%=i %>" value="late">
                                  
                                   <label for="지각">지각</label>
                                   
                                 </td>
                                  <td>
                                  
                                   <input type="radio" name="check<%=i %>" value="ets">
                                  
                                   
                                   <label for="기타">기타</label>
                                   
                                 </td>
                               </tr>
                               
                               
                               <%
                                }
                               %>

                            </tbody>
                         </table>
                         <button type="submit" class="btn btn-outline-dark">
                           저장
                         </button>
                       
                         </form>
                         <div class="pgbox">
                           <ul class="paging">
                               <li><a href="#"><i class="ri-arrow-left-double-line"></i></a></li>
                               <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                               <li><a href="#">1</a></li>
                               <li><a href="#" class="active">2</a></li>
                               <li><a href="#">3</a></li>
                               <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
                               <li><a href="#"><i class="ri-arrow-right-double-line"></i></a></li>
                           </ul>
                       </div>
                     </div>              
                </div>

                



<jsp:include page="inc/aside.jsp" flush="true" />
<jsp:include page="inc/footer.jsp" flush="true" />
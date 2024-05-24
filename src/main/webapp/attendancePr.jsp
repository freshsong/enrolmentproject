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
   Connection conn = db.getConnection();
   AttendanceDao dao = new AttendanceDao(conn);
   int num = 1;
   ArrayList<ADto> list = dao.view(num);
   
   int stnum = 0;
   
   String dep = null; 
   String name = null; 
   String phoneNum =null; 
   
   for(int i = 0; i<list.size(); i++){
      ADto dto = list.get(i);
      
      stnum = dto.getStNum();
      dep = dto.getDep();
      name = dto.getStName();
      phoneNum = dto.getStPhoneNum();
      
      System.out.println(dep+"|"+stnum+"|"+name+"|"+phoneNum);
   }
   
   db.closeConnection();
   
%>


     <div class="tab-menu attmenu">
                           <div class="tab-btn">
                             <h3>출석부</h3>
                             <br>
                               <ul>
                                   <li class="active"><a href="attendance.jsp">출석 관리</a></li>
                                   <li><a href="attendancePr.jsp">출석부</a></li>
                                   <li><a href="#">성적 항목 관리</a></li>
                               </ul>
                           </div>
                           <div class="tab-cont">
                             <div class="tab-in">
                               <form action="#" method="post">                                                        
                                  
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
                                   <br>
                                </form>
                             </div>                             
                           </div>
                       </div>
                    
                                            <!-- 출석부 -->
                     <div class="d-day">
                            2024년 4월 8일 1교시 수업입니다. 
                     </div>
                     <div class="atttablebox">            
                         <table>
                            <colgroup>
                               <col width="4%">
                               <col width="16%">
                               <col width="7%">
                               <col width="15%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                               <col width="10%">
                            </colgroup>
                            <thead>
                               <tr>
                                  <th>번호</th>
                                  <th>학과(전공)</th>
                                  <th>학년</th>
                                  <th>학번</th>
                                  <th>이름</th>
                                  <th>출결상황</th>
                                  <th>출석일수</th>
                                  <th>결석일수</th>
                                  <th>지각일수</th>
                                  <th>기타일수</th>
                               </tr>
                            </thead>
                            <tbody id="tby">
                               <tr>
                                  <td>1</td>
                                  <td><%=dep %></td>
                                  <td>1</td>
                                  <td><%=stnum %></td>
                                  <td><%=name %></td>
                                  <td>출석</td>
                                  <td>2</td>
                                  <td>0</td>
                                  <td>1</td>
                                  <td>0</td>
                              </tr>
                            </tbody>
                         </table>
                         <button type="submit" class="btn btn-outline-dark">
                           저장
                         </button>
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
                




<jsp:include page="inc/footer.jsp" flush="true" />
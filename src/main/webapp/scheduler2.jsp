<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="inc/header.jsp" flush="true" />
<script>


//수강신청 
function scheduleAddCart() {
 // 체크된 체크박스들을 담을 배열
 let checkedItems = [];
 let cartItems = [];
 // 모든 체크박스 요소들을 가져옴
 let checkboxes = document.querySelectorAll('input[type="checkbox"]');
 // 각 체크박스를 순회하면서 체크 여부를 확인
 checkboxes.forEach(function(checkbox) {
     if (checkbox.checked) {
         checkedItems.push(checkbox.value);
     }
 });
 
//수강신청 선택된 항목을 추가
 cartItems = cartItems.concat(checkedItems);
//수강신청 추가된 항목을 출력
 let cartList = document.getElementById('cart');
 cartList.innerHTML = ''; // 기존 내용을 초기화
 cartItems.forEach(function(item) {
     let li = document.createElement('li');
     li.textContent = item;
     cartList.appendChild(li);
     let xbutton = document.createElement("button");
     xbutton.textContent = "x";
     li.appendChild(xbutton);
     
     console.log(cartItems);
     document.getElementById("inpp").setAttribute("value", cartItems);
 });
}

/* 수강신청 전체 비우기 */
function scheduleClearCart() {
let cartList = document.getElementById('cart');
cartList.innerHTML = ''; 
cartItems=[];
}

$(document).ready(function(){  
/* 선택한 카트요소 비우기 */
$('#cart').on('click','button',function(){
$(this).parent().remove();
});
/* check box 선택삭제 */
$('#deleteAll1').on('click', function() {
$(".textcheck").prop("checked", false);
$('#checkedCount1').text('현재 선택 강의 : 0');
});

/* check box 선택개수 */
$('input[type="checkbox"]').change(function() {
 var checkedCount = $('input[type="checkbox"]:checked').length;
 $('#checkedCount1').text('현재 선택 강의 : ' + checkedCount);
 
});


/* 수강신청 클릭시 색상변경 > 관심강좌 색상과 동일 */
 $(function(){
    $("td:contains('웹디자인')").css("background-color", "#e9fcff");
    $("td:contains('자바프로그래밍')").css("background-color", "#fdf7e5");
    $("td:contains('데이터베이스')").css("background-color", "#edf7e9");
    $("td:contains('영상편집')").css("background-color", "#f4eefd");
 });
 
 
});

/* 수강신청 인원증가 - 데이터베이스 수업만 넣음*/
$(document).ready(function() {
 $("#wed4").click(function(e) {
     e.preventDefault(); // 기본 이벤트 방지
     var currentValue = parseInt($("#DBen").text()); // 현재 수강신청인원
     var maxCapacity = 0; // 최대 정원
     // 정원이 최대 정원에 도달한 경우
     if (currentValue >= maxCapacity) {
         alert("본 강의는 현재 정원이 가득 찼습니다.");
         return;
     }
     // 수강신청인원 증가
     $("#DBen").text(currentValue + 1);
 });
});

</script>
<jsp:include page="inc/aside.jsp" flush="true" />

<div class="notice">
    <div class="left">수강신청 마감일정 2024년 04월 02일 18:00<br>
                      ! 일정을 반드시 지켜주세요 !</div>
    <div class="right">- 마감시간 이후에는 변경이 불가하며, 인원충족 시 전산확정 됩니다.<br>
                       - 장바구니 담기 기간 이후의 변경내역은 장바구니에 적용되지 않습니다.</div>
</div> <!--/notice--> 

<div class="infobox">
    <div class="infohead">
        <h3>수강신청</h3>
        <!-- 내가담은 수강신청 전체삭제 / 부분삭제 -->
         <div class="req_header">
       <button onclick="scheduleAddCart()" class="req_box1" ><p style="margin-top: 10px;">선택강의 담기</p></button>
       <button onclick="scPass()" class="req_box1" ><p style="margin-top: 10px;">선택강의 신청하기</p></button>
       <button type="button" class="req_box1" id="deleteAll1">선택삭제</button>
       <button onclick="scheduleClearCart()" class="req_box1"><p style="margin-top: 10px;">전체 삭제</p></button>
      
       <form action="schedulerOk2.jsp" method ="post">
          <input type="submit" value="전송"/>
          <input type="hidden" name="val" id="inpp" value="" />
       </form>
      <p class="t_score" id="checkedCount1">현재 선택 강의 : 0</p> 
    </div>
         <div class="popup1">
      <div class="popbody1" id="cart1"></div> <!--/popbody-->
        </div> <!--/popup-->
        <!-- 내가담은 수강신청 전체삭제 / 부분삭제 -->
    </div>    <!-- /infohead -->  
    
    <div class="box">
        <form action="scheduleOk.jsp" method="post">
            <div class="class">
                <div class="web">
                    <input type="checkbox" class="textcheck" id="mon1" value="웹디자인 월요일(09:00~10:00)" >
                    <br>웹디자인 월(09:00~10:00) <br>
                    김교수 | 이젠컴퓨터학과 <br>
                    수강신청인원 / 정원 (총 <span id="weben"></span>/30) | 학점 2 <br>
                </div><!-- /web -->
                <div class="submitbox" class="">
                    <input type="submit" value="신청하기" name="ty"  class="pass" id="mon1"/>
                    <input type="hidden" value="1" name="class"  class="pass" id="mon1"/>
                    <input type="submit" value="취소하기" name="ty" class="cancel" id="mon11"/>
                    <input type="hidden" value="1" name="class" class="cancel" id="mon11"/>
                </div> <!-- /submitbox -->
            </div> <!-- /class -->
        </form>  <!--/웹디form-->
        
        <form action="scheduleOk.jsp" method="post">    
            <div class="class">
                <div class="java">
                    <input type="checkbox" class="textcheck" id="mon2" value="자바프로그램 월(11:00~12:00)">
                    <br>자바프로그래밍 월(11:00~12:00) <br>
                    박교수 | 이젠컴퓨터학과 <br>
                    수강신청인원 / 정원 (총 <span id="javaen"></span>/30) | 학점 2 <br>
                </div> <!--/java-->
                <div class="submitbox" class="2">
                    <input type="submit" value="신청하기" name="ty" class="pass" id="mon2"/>              
                    <input type="hidden" value="2" name="class"/>
                    <input type="submit" value="취소하기" name="ty" class="cancel" id="mon22"/>
                    <input type="hidden" value="2" name="class"/>
                </div> <!--/submitbox-->
            </div> <!--/class-->
        </form>  <!--/자바form -->   
        
        <form action="scheduleOk.jsp" method="post">         
            <div class="class">
                <div class="DB">
                    <input type="checkbox" class="textcheck" id="wed4" value="데이터베이스 수(14:00~15:00)">
                    <br>데이터베이스 수(14:00~15:00) <br>
                    이교수 | 이젠컴퓨터학과 <br>
                    수강신청인원 / 정원 (총 <span id="DBen"> 0 </span>/1) | 학점 3 <br>
                </div> <!--/checkbox-->
                <div class="submitbox">
                    <input type="submit" value="신청하기" name="ty" class="pass" id="wed4" />
                    <input type="hidden" value="3" name="class"/>
                    <input type="submit" value="취소하기" name="ty" class="cancel" id="wed44"/>
                    <input type="hidden" value="3" name="class"/>
                </div> <!--/submitbox-->
           </div> <!--/class-->
        </form>   <!--/DBform-->
        
        <form action="scheduleOk.jsp" method="post">           
            <div class="class">
                <div class="final">
                    <input type="checkbox" class="textcheck" id="tue1" value="영상편집 화(09:00~10:00)">
                    <br>영상편집 화(09:00~10:00)<br>
                    나교수 | 이젠컴퓨터학과 <br>
                    수강신청인원 / 정원 (총 <span id="finalen"></span>/30) | 학점 2 <br>
                </div> <!--/checkbox-->
                <div class="submitbox" class="4">
                    <input type="submit" value="신청하기" name="ty" class="pass" id="tue1"/>
                    <input type="hidden" value="4" name="class"/>
                    <input type="submit" value="취소하기" name="ty" class="cancel" id="tue11"/>
                    <input type="hidden" value="4" name="class"/>
                </div> <!-- /submitbox-->
            </div><!--/class-->
        </form> 
        
    </div> <!--/box-->
     
</div> <!--infobox-->

<jsp:include page="inc/footer.jsp" flush="true" />
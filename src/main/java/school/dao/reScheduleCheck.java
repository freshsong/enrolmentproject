package school.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resche")
public class reScheduleCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Integer = null;
       
   
    public reScheduleCheck() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//화면출력값 한글로
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//화면에 찍히게
		PrintWriter out = response.getWriter();
		//선택강의한 강의 값 가져오기
		String title = request.getParameter("title");
		String time = request.getParameter("time");
		
		
		
		try {
			//강의 값 가져오기 위해 DB 연결
			Connection conn = null;
			DBConnect db = new DBConnect();
			//쿼리문 실행
			String sql = "INSERT INTO school (title, time) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, time);
            pstmt.executeUpdate();
		//값 화면에 출력하기
		out.println("<HTML>");
		out.println("<HEAD><TITLE>수강신청 미리보기</TITLE></HEAD>");
		out.println("<BODY>");
		out.println("<table class=\"table table-bordered\">");
		out.println("<thead class=\"text-center\">");
		out.println("<tr>");
		out.println("<th>시간</th>");
		out.println("<th>월요일</th>");
		out.println("<th>화요일</th>");
		out.println("<th>수요일</th>");
		out.println("<th>목요일</th>");
		out.println("<th>금요일</th>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody class=\"text-center\">");
		out.println("<tr>");
		out.println("<th>1교시<br>09:00~10:00</th>");
		out.println("<td class=\"mon1\">"+ title + time +"</td>");
		out.println("<td class=\"tue1\"></td>");
		out.println("<td class=\"wed1\"></td>");
		out.println("<td class=\"thu1\"></td>");
		out.println(" <td class=\"fri1\"></td>");
		out.println("</tr>");
        out.println("</tbody>");
        out.println("</table>");
        out.println("</BODY>");
        out.println("</HTML>");
        out.close();
        // 자원 해제
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        // 오류 처리
        out.println("오류 발생: " + e.getMessage());
    } finally {
        out.close();
    }
}
}
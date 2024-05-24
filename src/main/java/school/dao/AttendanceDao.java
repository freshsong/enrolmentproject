package school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import school.dto.ADto;

public class AttendanceDao {
	PreparedStatement pstmt = null;
	   Statement stmt = null;
	   ResultSet res = null;
	   Connection conn;
	   
	   public AttendanceDao(Connection conn) {
	      this.conn = conn;
	   }
	   
	   /*** 출석부 등록 ***/
	   public int insertDB(int scid, int stNum) {
		   ADto dto = new ADto();
		   
		   int rs = 0;
		   int num;
		   String name, phonenum, addr1, addr2;
		   
		   String sql1 = "select stNum, name, phoneNum, addr1, addr2 from student where stNum = ?";
		   
		   try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, stNum);
			res = pstmt.executeQuery();
			res.next();
			
			num = res.getInt("stNum");
			name = res.getString("name");
			phonenum = res.getString("phoneNum");
			addr1 = res.getString("addr1");
			addr2 = res.getString("addr2");
			
			pstmt.close();
			res.close();
			
			String sql2 = "insert into attendance (scid, stNum, stName, stPhoneNum, stAddr1, stAddr2) values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, scid);
			pstmt.setInt(2, num);
			pstmt.setString(3, name);
			pstmt.setString(4, phonenum);
			pstmt.setString(5, addr1);
			pstmt.setString(6, addr2);
			int res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return rs;
	   }
	   
	 //수강신청 취소하기
	   
	    public int deleteScDB(int stNum) {
	    	
	       int result = 0;
	       String sql = "delete from attendance where stNum = ?";
	       try {
	         pstmt = conn.prepareStatement(sql);
	          pstmt.setInt(1, stNum);
	           result = pstmt.executeUpdate();
	           System.out.println(pstmt);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 
	       
	       return result;
	    }
	    
	    /*** 출석부 보기 ***/
	    public ArrayList<ADto> view(int num){
	    	ArrayList<ADto> stView = new ArrayList<>();
	    	String sql = "select * from attendance where scid = ? order by stNum";
	    	
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					ADto dto = new ADto();
					
					int stNum = res.getInt("stNum");
					String dep = res.getString("dep");
					String name = res.getString("stName");
					String phoneNum = res.getString("stPhoneNum");
					int att = res.getInt("att");
					int abs = res.getInt("abs");
					int late = res.getInt("late");
					int ets = res.getInt("ets");
					Timestamp time = res.getTimestamp("time");
					
					dto.setDep(dep);
					dto.setStNum(stNum);
					dto.setStName(name);
					dto.setStPhoneNum(phoneNum);
					dto.setAtt(att);
					dto.setAbs(abs);
					dto.setLate(late);
					dto.setEts(ets);
					dto.setTime(time); 
					
					stView.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return stView;
	    }
	    
	    /*** 출석 체크 ***/
	    public void check(String check, int stNum) {
	    	int num = 0;
	    	String sql = "insert into attendance (dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, att) select dep, scid, stNum, stName, stPhoneNum, stAddr1, stAddr2, ? from attendance where stNum = ?"; 
	    	
	    	
	    	try {
	    		if(check.equals("attend")) {
	    			num = 1;
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, stNum);
	    			int rs = pstmt.executeUpdate();
	    		}
	    		else if(check.equals("abs")){
	    			num = 2;
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, stNum);
	    			int rs = pstmt.executeUpdate();
	    		}
	    		else if(check.equals("late")) {
	    			num = 3;
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, stNum);
	    			int rs = pstmt.executeUpdate();
	    		}
	    		else if(check.equals("ets")) {
	    			num = 4;
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setInt(1, num);
	    			pstmt.setInt(2, stNum);
	    			int rs = pstmt.executeUpdate();
	    		}
				
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    //교수번호? 과목번호 출력
	    public int scheduleId(String name) {
	    	int rss = 0;
	    	String sql = "select scid from schedule where pfname = ?";
	    	
	    	try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				res = pstmt.executeQuery();
				res.next();
				System.out.println(res.getInt("scid"));
				rss = res.getInt("scid");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return rss;
	    }

}

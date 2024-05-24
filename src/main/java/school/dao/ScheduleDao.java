package school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import school.dto.scDto;

public class ScheduleDao {
      PreparedStatement pstmt = null;
      Statement stmt = null;
      ResultSet res = null;
      Connection conn;
      
      public ScheduleDao(Connection conn) {
         this.conn = conn;
      }
      
      //수강신청 scid 검증
      public int[] findUser(String stNum) {
         int[] rs = new int[4];
         int stNum1 = Integer.parseInt(stNum);
         int i = 0;
         String sql = "select lectureNum1, lectureNum2, lectureNum3, lectureNum4 from student where stNum=?";
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, stNum1);   
            res = pstmt.executeQuery();
            
            while(res.next()) {
          
               
               for(i=0; i<rs.length; i++) {
                  rs[i] = res.getInt("lectureNum"+(i+1));
               }
               
            }
            
         }catch(SQLException e) {
               e.printStackTrace();
          }finally {
           try {
            if(pstmt != null) pstmt.close();
           } catch (SQLException e) {
              e.printStackTrace();
           }
         }
         
         
         return rs;
      }
      
      //수강신청 완료
      public int updateDB(int scid, int id) {
         int rs = 0;
         
   
         System.out.println(scid+", "+id);
         String sql1 = "select lectureNum1, lectureNum2, lectureNum3, lectureNum4 from student where stNum=?";
         
         
         try {
               pstmt = conn.prepareStatement(sql1);
               pstmt.setInt(1, id);
               
               res = pstmt.executeQuery();
               System.out.println("1");
            
               while(res.next()) {
                  
                  for(int i = 1; i<5; i++) {
                     rs = res.getInt("lectureNum"+i); // lectureNum1 -> x
                     System.out.println("4, rs : "+rs+", i : "+i);
                     if(rs==0) { //rs = x -> 0 or 1123;
                        String sql2 = "update student set lectureNum"+i+"=? where stNum = ?";
                        pstmt = conn.prepareStatement(sql2);
                        pstmt.setInt(1, scid);
                        pstmt.setInt(2, id);
                        System.out.println(sql2);
                        int res = pstmt.executeUpdate();
                        System.out.println("2");
                        break;
                     }
                     System.out.println("3");
                     
                     
                  }
               }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

         return rs;
      }
      
      //수강신청 목록 가져오기
      /* 송이씨 파트
       * 검색하여 선택된 모든 값을 저장하는 방법 + 그것을 맞춰서 출력하는 법
       * */
         public scDto login(int scid) {
            String sql = "select * from schedule where scid=?";
            scDto dto = new scDto();
            
            try {
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, scid);
               res = pstmt.executeQuery();
               res.next();
               System.out.println(pstmt);
               if(res.next()) {         
                  dto.setScid(res.getInt("scid"));
                  dto.setTitle(res.getString("title"));
                  dto.setPfName(res.getString("pfName"));
                  dto.setWeek(res.getString("week"));
                  dto.setTime(res.getString("time"));
               }
            }catch(SQLException e){
               e.printStackTrace();
            }finally {
                 try {
                     if(pstmt != null) pstmt.close();
                     if(res != null) res.close();
                  } catch (SQLException e) {
                     e.printStackTrace();
                  }
            }
            
            System.out.println(dto.getScid());
            return dto;
         }
      
      //수강신청 담기
         
      /* 제욱씨 파트
       * schedule 테이블의 scid를 student 테이블의 lectureNum(1,2,3,4)에 저장
       * 관심등록한 부분을 확인할 때는 student 테이블의 lectureNum(1,2,3,4)에 저장된 값으로
       * schedule 테이블 전체를 선택하는데 이때 검색에 이용되는 건 scid
       * 검색해서 나온 정보를 list에 저장, 관심등록 보여주기는 list를 출력
       * 
       * */
      public int insertDB(String scid, String week, String time) {
          int mid = Integer.parseInt(scid);
          int result = 0;
          String sql = "insert into school (scid, week, time) values (?, ?, ?)";
          try {
            pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, mid);
             pstmt.setString(2, week);
             pstmt.setString(3, time);
              result = pstmt.executeUpdate();
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
             try {
                 if(res != null) res.close();
                 if(pstmt != null) pstmt.close();
              }catch(SQLException e) {
                 e.printStackTrace();
              }   
           }
          return result;
       }
      
      //수강신청배열
      public ArrayList<scDto> selectDB(int title){
         ArrayList<scDto> dtos = new ArrayList<>();
         String sql = "select * from schedule where scid=?";
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,title);
            res = pstmt.executeQuery();
            
            while(res.next()) {
               scDto dto = new scDto();
               dto.setScid(res.getInt("scid"));
                dto.setTitle(res.getString("title"));
                dto.setPfName(res.getString("pfName"));
                dto.setWeek(res.getString("week"));
                dto.setTime(res.getString("time"));
              dtos.add(dto);
            }
            
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
           try {
              if(res != null) res.close();
              if(pstmt != null) pstmt.close();
           }catch(SQLException e) {}
         }
         
         return dtos;
      }
      
      public ArrayList<scDto> selectDB(int scid, String stName){
          ArrayList<scDto> dtos = new ArrayList<>();
          String sql1 = "select * from student where name = ?";
          String sql2 = "select * from schedule where scid=?";
          
          int i = 1;
          int[] scid2 = new int[4];
          
          try {
        	 pstmt = conn.prepareStatement(sql1);
        	 pstmt.setString(1, stName);
        	 System.out.println(sql1);
        	 res = pstmt.executeQuery();
        	 res.next();
        	 
        	 for(i = 1; i<=4; i++) {
        		 if(res.getInt("lectureNum"+i) !=0 ) {
        		 scid2[i-1] = res.getInt("lectureNum"+i);
        		 System.out.println(res.getInt("lectureNum"+i));
        		 }
        	 }
        	 
        	 pstmt.close();
        	 res.close();
        	 
        	 int j = 0;
        	 
        	 while(j<=3) {
        		 
        		 int scid1 = scid2[j];
        		 System.out.println(scid1);
        		 pstmt = conn.prepareStatement(sql2);
        		 pstmt.setInt(1, scid1);
        		 res = pstmt.executeQuery();
             
        		 while(res.next()) {
        			 scDto dto = new scDto();
        			 dto.setScid(res.getInt("scid"));
        			 dto.setTitle(res.getString("title"));
        			 dto.setPfName(res.getString("pfName"));
        			 dto.setWeek(res.getString("week"));
        			 dto.setTime(res.getString("time"));
        			 dtos.add(dto);
             		}
             
        		 j++;
        	 	}
              
          }catch(SQLException e) {
             e.printStackTrace();
          }finally {
            try {
               if(res != null) res.close();
               if(pstmt != null) pstmt.close();
            }catch(SQLException e) {}
          }
          
          return dtos;
       }
      
      
      
      //강의담기 취소하기
      
       public int deleteScDB(int num, int stNum) {
          
          int result = 0;
          String sql = "update student set lectureNum"+num+" = null where stNum = ?";
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
      
   }
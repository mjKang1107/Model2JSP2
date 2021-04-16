<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/deletePro.jsp</h1>
	<% 
	
	//로그인 세션처리 (로그인x -> 로그인페이지로 이동)
	String id =(String) session.getAttribute("id");
	
	
		if(id == null){
		System.out.println("[deletePro.jsp] : 아이디 없음 -> 로그인페이지 이동");
		response.sendRedirect("loginForm.jsp");
			
		}
	
	// 한글처리 
		request.setCharacterEncoding("UTF-8");

	%>
	
	<jsp:useBean id="mb" class="com.itwillbs.member.memberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	
	//update처리 로직을 참고하여 회원정보 삭제기능 구현하기
		System.out.println("삭제 회원정보 : " + mb);
	
		String DRIVER = "com.mysql.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";
		
		Class.forName(DRIVER);
		
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		String sql= "select pw from itwill_member where id=?" ;
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//? 채우기
		pstmt.setString(1, id);
			
				
		ResultSet rs =  pstmt.executeQuery();
		
		// 데이터처리
		if(rs.next()){
			//아이디가 있는 경우
			if(mb.getPw().equals(rs.getString("pw"))){
				//비밀번호 같음 => 본인 -> 정보 수정
				//sql (update구문 & pstmt 객체) 	-> 둘이 세트임 꼭 같이 작성하기..	
				sql = "delete from itwill_member where id=?";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mb.getId());
				//실행
				pstmt.executeUpdate();
				//세션정보 초기화
				session.invalidate();
				//페이지 이동
				response.sendRedirect("main.jsp");
			}else{
				//비밀번호 다름 => 오류(페이지 뒤로 이동)
				%>
				
			<script type="text/javascript">
				alert("비밀번호 오류!");
				history.back();
				</script>
				<% 	
						
			}
		}else{
			//아이디가 없는 경우 => 오류(페이지 뒤로 이동)
			%>
			<script type="text/javascript">
			alert("아이디 없음!");
			history.back();
			</script>
			<% 
		}
		
		
		

		
	%>

		
		
	
	
</body>
</html>
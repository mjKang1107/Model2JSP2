<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member.loginPro.jsp</h1>
	
	<%
	request.setCharacterEncoding("utf-8");
	
	%>
	
	
	<jsp:useBean id="mb" class="com.itwillbs.member.memberBean"/>
	
	<jsp:setProperty property="*" name="mb"/>
	
	<% 
	System.out.println("전달정보:" +mb);
	
	
	String DRIVER = "com.mysql.jdbc.Driver";
    String DBURL = "jdbc:mysql://localhost:3306/jspdb";
    String DBID ="root";
    String DBPW ="1234";
   
    //2. 드라이버연결 
    Class.forName(DRIVER);
    
  Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
  
  //3. sql구문 & pstmt객체 생성
  String sql ="select pw from itwill_member where id=?";
    
  PreparedStatement pstmt = conn.prepareStatement(sql);
  
  pstmt.setString(1, mb.getId());
  
  //4. sql구문 실행
ResultSet rs = pstmt.executeQuery();
  
  //5. 데이터 처리
  if(rs.next()){ //sql구문의 결과가 있을때 
	  //회원이다.
	  //비밀번호를 사용해서 본인확인
	  if(mb.getPw().equals(rs.getString("pw")) ){
		 //비밀번호 같다(+회원이다) =>본인 => 로그인성공
		
		//로그인 성공의 의미로 회원 ID정보를 session내장객체에 저장
		session.setAttribute("id", mb.getId());
		 							//업캐스팅됨 (자동 형변환)
		// main.jsp 페이지 이동		 
		//response.sendRedirect("main.jsp");
		%>
			<script type="text/javascript">
			alert("로그인 성공!");
			location.href="main.jsp";
			</script>
		<% 
		
	  }else{
		  //비밀번호 다름(+회원이다)
		  %>
		  <script type="text/javascript">
		  alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		  history.back();
		  </script>
		  <% 
	  }
  }else{
	  //비회원이다.
	  %>
	  <script type="text/javascript">
	  //confirm("회원정보가 없습니다.회원가입하겠습니까?");
	 var result = confirm("회원정보가 없습니다.회원가입하겠습니까?");
	  
	  if(result){
		  alert("회원가입 페이지로 이동합니다");
		  location.href = "insertForm.jsp";
		  
	  }else{
		  history.back();
	  } 
	 // alert("회원정보가 없습니다.");

	  </script>
	  
	   
	  <% 
	  
  }  
  
  
  //문자열 상수
  //String A1 ="itwill";
  //String B1 ="itwill";
  
  //문자열 객체
  //String A = new String("itwill");
  //String B = new String("itwill");
  
	// -> 참조형은 A.equals(B)로 비교해야함!!
	 //참조형은 4바이트..
	//https://cdmanii.com/272
	
	%>
	
</body>
</html>
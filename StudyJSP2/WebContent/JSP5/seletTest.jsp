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
	<h1>WebContent/JSP5/selectTest.jsp</h1>
	
	<%
	// 디비에 저장된 모든 회원의 정보를 출력(콘솔창, 화면)
	
	final String DRIVER = "com.mysql.jdbc.Driver";
    final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
    final String DBID = "root";
    final String DBPW = "1234";
    
	//1.드라이버로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공");
	//2. 디비 연결
	Connection con =
	DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("디비연결 성공");
	
	//3. sql작성 & pstmt 객체 생성
	String sql = "select * from itwill_member";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//4. sql 구문 실행
	//ResultSet : select문의 결과 (레코드셋 형태의 데이터)를 저장하는 객체
	ResultSet rs = pstmt.executeQuery();
	
	//5. 데이터 처리
	while(rs.next()){//레코드셋에 데이터가 있으면 T, 없으면 F 리턴하는 메서드 (커서 이동)
		//데이터가 있다.
		//while문을 자주 사용함-> 초기식, 증감식 다 필요없고 참일때 돌아가기때문에!!
		
	// 1) rs.getXXXXX("컬럼명");
	// -> XXXXX 가져오는 컬럼의 데이터 타입에 따라서 변경
	// => rs 객체의 커서가 가리키고 있는 한줄에 데이터 중에서 찾아오는 메서드
	// 2) rs.getStiring(컬럼인덱스번호);
	
	//=> 인덱스번호를 사용하는 방법이 훨씬 처리속도가 빠르다.
			
			
			
			
		//String name = rs.getString("name");
		int idx = rs.getInt(1);
		out.print("사용자 번호: " + idx + " ");
		String name = rs.getString(2);
		out.print("사용자 이름 : " + name + " ");
		String gender = rs.getString(3);
		out.print("사용자 성별 : " + gender +" ");
		int age = rs.getInt(4);
		out.print("사용자 나이 : " + age + " ");
		String jumin = rs.getString(5);
		out.print("사용자 주민번호 : " + jumin + "<br>");
		
		
	}
	
	System.out.println("회원정보 조회 성공!");
	
	%>
	
	
	
	
</body>
</html>
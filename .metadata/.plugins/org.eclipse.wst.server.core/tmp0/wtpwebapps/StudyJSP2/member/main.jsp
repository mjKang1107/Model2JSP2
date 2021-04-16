<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/main.jsp</h1>
	
	<%
		//사용자가 로그인을 했을때만 main페이지 확인
		//로그인 안한경우 로그인 페이지로 이동
	
		//세션객체의 정보를 가져와서 확인
		String id = (String) session.getAttribute("id");
					//다운캐스팅해주면됨- 강제 형변환
					//상속관계에서 부모타입으로 형변환하는거 -> 업캐스팅(상속받은거만 사용할수있다-Object라는 포장지로 싸서 안까지는 모른다..)
					//-> 모든 클래스는 Object라는 최상위 부모를 가진다 
					//상속관계에서 자식타입으로 형변환하는거 -> 다운캐스팅(포장지를 열어서 String이라는 자식타입까지 사용가능하다.)
			if(id==null){
				//로그인 x
				System.out.println("[main.jsp] : 아이디없음 -> 로그인페이지 이동");
				response.sendRedirect("loginForm.jsp");
				
			}		
					
	%>
	
	<h2><%=id %>님 환영합니다~!!</h2>
	<input type="button" value="로그아웃!" onclick="location.href='logoutForm.jsp';"> 
	
	<hr>

	<h3><a href="info.jsp">회원 정보 조회</a></h3>
	
	<h3><a href="updateForm.jsp">회원 정보 수정</a></h3>
	
	<h3><a href="deleteForm.jsp">회원 탈퇴(삭제)</a></h3>
	
	<!-- 관리자만 사용가능한 메뉴 생성 -->
	<%if(id != null){
		if(id.equals("admin")){
			//참조형데이터 값 비교시 항상 null값을 먼저 비교 후 데이터 비교
			if(id != null && id.equals("admin"))
		%>
	<h3><a href="list.jsp">회원 목록보기</a></h3>
	
	<%
	 }
	}
	
	%>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP3/sessionTest.jsp</h1>
	
	<%
		//p270~
		//http 프로토콜 사용하여 통신시
		//페이지 요청 (request), 요청에 대한 응답 (response)를 완료하고 나면
		//서버와 클라이언트의 연결의 종료
		//=> 서버와 클라이언트의 상태를 연결하기 위해선 세션,쿠키 사용
		
	%>
	
	<h2> 세션 (Session) : 웹 서버의 컨테이너 정보(상태)를 유지하기위한 정보<br>
	- 웹 브라우저당 1개씩 설정 <br>
	- 서버쪽에서 관리 => 보안상 안전 
	</h2>
	
	- 세션 정보 저장 <br>
		session.setAttribute("세션값이름","세션데이터값"); <br>
	- 세션 정보 사용<br>	
		session.getAttribute("세션값 이름"); <br>
	- 세션 정보 삭제(속성 삭제) <br>
		session.removeAttribute("세션값 이름"); <br>
	- 세션 정보 초기화<br>
		session.invalidate();<br>
	
	<hr><hr>
	<!-- 
	세션값이 있을때는 세션값을 출력,
	세션값이 없을때는 "세션값 없음!" 출력
	 -->
	 
	 <% 
	if(session.getAttribute("id") == null){
		%>
			<h2> 세션값 : 세션값 없음! </h2>
		<% 	
	}else{
		%>
		<h2> 세션값: <%=session.getAttribute("id") %></h2>
		<%
	}
	
	%>
	
	
	<%
		String id = (String)session.getAttribute("id");
		//형변환- 다운캐스팅(참조형데이터타입)  참조형-앞대문자,색이 안바뀜
		//형변환- 강제/명시적 (기본형데이터타입) 기본형-색이 바뀜
	
		if(id == null){
			id = "세션값 없음!";
			
		}
	%>
	
	<hr>
	<h2> 세션값 : <%=id %></h2>
	
	<h2> 세션값 : <%=session.getAttribute("id") %> </h2>
	
	<input type="button" value="세션값 생성(저장)" 
		onclick="location.href='sessionSet.jsp'"> <br>
	
	
	<input type="button" value="세션값 삭제" 
		onclick="location.href='sessionDel.jsp'"> <br>
	
	<input type="button" value="세션값 초기화" 
		onclick="location.href='sessionInv.jsp'"> <br>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
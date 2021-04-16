<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/logoutForm.jsp</h1>
	
	<%
		//로그아웃 처리 하기 
		
		//세션 초기화
		session.invalidate();
		//session.removeAttribute(arg0); 
		//로그아웃시에는 삭제보다 초기화가 더 좋다 
	
	%>
	
	<script type="text/javascript">
	alert("정상적으로 로그아웃 되었습니다.");
	location.href='main.jsp';
	</script>
	
</body>
</html>
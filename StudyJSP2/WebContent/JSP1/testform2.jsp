<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/testform2.jsp</h1>
	
	<!-- 사용자의 이름, 나이를 입력 받아서 결과를 출력
	testPro2.jsp 페이지에서 결과를 출력
	 -->
	 
	 <!-- 
	 	form - get방식 : 한글데이터 전달시 문제 x
	 	form - post방식 : 한글데이터 전달시 문제o (인코딩에러
	 
	  -->
	 
	 <fieldset>
	 	<legend> 사용자 정보 </legend>
	 <form action="testPro2.jsp" method="post">
	이름 : <input type="text" name="name1"> <br>
	나이 : <input type="text" name="age1"> <br>
	 
	 <input type="submit" value="click">
	 </form>
	 </fieldset>
	 
	 
</body>
</html>
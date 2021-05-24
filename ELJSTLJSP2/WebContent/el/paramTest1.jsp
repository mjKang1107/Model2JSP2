<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="paramTestPro1.jsp" method="post">
ID : <input type="text" name="id"><br>
PW : <input type="password" name="pw"><br>
Favorite food1 : <input type="text" name="food"><br>
Favorite food2 : <input type="text" name="food"><br>
<hr>
	<input type="checkbox" name="hobby" value="츄르먹기" > 츄르먹기
	<input type="checkbox" name="hobby" value="옥상올라가기" > 옥상올라가기
	<input type="checkbox" name="hobby" value="잠자기" > 잠자기
<hr>
<input type="submit" value="입력">	
</form>



</body>
</html>
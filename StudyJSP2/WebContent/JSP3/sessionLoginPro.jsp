<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP3/sessionLoginPro.jsp</h1>
	
	
	
	 <% 
	 //한글처리
	 request.setCharacterEncoding("UTF-8");
	 
     // 
     String id = request.getParameter("id");   
     String pw = request.getParameter("pw");   
	
     System.out.println(id.hashCode());
     System.out.println("id : " +id+ " , pw : " +pw);
     
     String userID= "itwill";
     String userPW= "1234";
     
     //A.equals(B) : 문자열A, 문자열B의 값이 동일한지 체크(true,false)
     //로그인 처리 로직
     if(id.equals(userID)){
    	 // 아이디가 동일(회원이다)
    	 if(pw.equals(userPW)){
    		 //아이디 동일 + 비밀번호 동일 => 로그인 성공!
    			//세션값 생성(ID값- 변수값)
    			session.setAttribute("id", id);
    				 // 페이지 이동
    				 response.sendRedirect("sessionLoginMain.jsp");
    		
    	 }else{
    		 //아이디는 동일 + 비밀번호 다름
    		 out.println("비밀번호 오류!! ");
    	 }
    	 
     }else{
    	 //아이디가 다름(비회원이다)
    	 out.println("아이디 정보가 없습니다! (비회원) ");
     }
     
	%>
	

</body>
</html>
package com.itwillbs.myServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//http://localhost:8088/ELJSTLJSP2/test1
public class TestServlet1 extends HttpServlet{
	
	//doGet메소드 오버라이딩하기
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get방식 호출 발생!");
		
		//request영역에 속성을 저장
		request.setAttribute("cnt", 100);
		//request.setAttribute("cnt", new Integer(100));
		
		//session영역에 속성을 저장
		HttpSession session = request.getSession();
		
		session.setAttribute("cnt", 200);
		
		
		
		//화면에 표시될 view페이지 연결
		RequestDispatcher dis 
			= request.getRequestDispatcher("/el/AttributeTest.jsp");
		
		dis.forward(request, response);
	}

	
}

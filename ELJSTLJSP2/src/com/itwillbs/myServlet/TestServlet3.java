package com.itwillbs.myServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test3")
public class TestServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("/test3 호출");
		
		Person kang = new Person();
		kang.setName("강집사");
		
		Cat cat = new Cat();
		cat.setCatName("자두");
		
		kang.setCat(cat);
		
		request.setAttribute("kang", kang);
		
		
		//forward방식 페이지 이동
		RequestDispatcher dis = request.getRequestDispatcher("/el/BeanTest.jsp");
		dis.forward(request, response);
		
		
		
		
		
	}

	
	
	
	
}

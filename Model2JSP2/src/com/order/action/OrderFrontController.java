package com.order.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("*.or")
// => 주소를 통한 컨트롤러 매핑 (JSP2.2~2.3/서블릿3.0~3.1에서 사용)

@WebServlet("*.or")
public class OrderFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("C : OrderFrontController_doProcess() 호출");

		/******************* 1.페이지 주소 파싱 ********************************/
		// 가상주소 전체 가져오기
		String requestURI = request.getRequestURI();
		// 프로젝트명 가져오기
		String contextPath = request.getContextPath();
		// 필요한 가상주소 생성
		String command = requestURI.substring(contextPath.length());

		System.out.println("command : " + command);
		System.out.println("C : 1.페이지 주소 파싱 완료 ");
		/******************* 1.페이지 주소 파싱 ********************************/

		/******************* 2.페이지 주소 매핑(연결) ****************************/
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/OrderStart.or")){
			// OrderStartAction 객체
			action = new OrderStartAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/OrderAdd.or")){
			System.out.println("C: /OrderAdd.or 호출 ");
			
			// 주문정보를 전달받아서 DB저장
			// OrderAddAction
			action = new OrderAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/OrderList.or")){
			System.out.println("C: /OrderList.or  호출");
			//OrderListAction
			
			action = new OrderListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		System.out.println("C : 2.페이지 주소 매핑  완료");

		/******************* 2.페이지 주소 매핑(연결) ****************************/

		/******************* 3.페이지 주소 이동 ********************************/
		if (forward != null) { // 페이지 이동정보가 있다.
			if (forward.isRedirect()) { // true
				response.sendRedirect(forward.getPath());
				System.out.println("C : sendRedirect() 방식, " + forward.getPath() + " 페이지 이동");
			} else { // false
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				System.out.println("C : forward() 방식, " + forward.getPath() + " 페이지 이동");
			}
			System.out.println("C : 3.페이지 주소 이동 완료");
		}
		System.out.println("C : 3.페이지 주소 이동 X(컨트롤러 이동X)");
		/******************* 3.페이지 주소 이동 ********************************/

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------------------");
		System.out.println("C : OrderFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---------------------------------------------");
		System.out.println("C : OrderFrontController_doPost() 호출");
		doProcess(request, response);
	}

}

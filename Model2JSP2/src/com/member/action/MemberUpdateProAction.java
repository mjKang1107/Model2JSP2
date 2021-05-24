package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberUpdateProAction_execute() 호출");
		
		//세션제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		//한글처리
		request.setCharacterEncoding("utf-8");
		//전달된 정보를 저장(DTO)
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.updateMember(id);
		request.setAttribute("mdto", mdto);
		//DAO생성 -> updateMember(DTO);
		//수정결과에 따른 페이지 이동 (0: 비밀번호 오류, 1: 수정완료, -1: 아이디없음)
		//=> 자바스크립트 사용 이동
		
		return null;
	}

}

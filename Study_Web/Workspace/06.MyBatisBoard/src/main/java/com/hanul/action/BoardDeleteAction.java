package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 클라이언트의 요청 받는다.
		int num = Integer.parseInt(request.getParameter("num") );
		
		// 2. 비지니스 로직 
		BoardDAO dao = new BoardDAO();
		dao.boardDelete(num);
		
		// 3. 프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("boardList.bo");  // 게시글 목록 페이지
		forward.setRedirect(true);		
		return forward;
	}
}
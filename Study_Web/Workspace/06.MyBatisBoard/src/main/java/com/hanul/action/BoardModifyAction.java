package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 클라이언트의 요청을 받는다.
		int num = Integer.parseInt( request.getParameter("num") );
		
		// 2. 비지니스 로직 : 해당 게시글의 상세 정보 조회
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.boardDetail(num);
		request.setAttribute("dto", dto); 
		
		// 3. 프리젠테이션 로직 
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardModify.jsp");
		forward.setRedirect(false);		
		return forward;
	}
}

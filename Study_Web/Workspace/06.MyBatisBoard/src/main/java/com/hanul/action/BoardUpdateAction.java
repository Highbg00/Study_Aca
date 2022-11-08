package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 클라이언트의 요청을 받는다.
		BoardDTO dto = new BoardDTO();
		dto.setNum( Integer.parseInt( request.getParameter("num") ));
		dto.setWriter( request.getParameter("writer") );
		dto.setTitle( request.getParameter("title"));
		dto.setContent( request.getParameter("content"));
		dto.setPw( request.getParameter("pw") );
		
		// 2. 비지니스 로직 : DB에 해당 게시글 수정 저장 처리
		BoardDAO dao = new BoardDAO();
		dao.boardUpdate( dto );
		
		// 3. 프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("boardList.bo");
		forward.setRedirect(true);		
		return forward;
	}

}

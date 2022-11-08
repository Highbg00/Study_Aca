package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

// DB에서 게시판 전체 목록 조회 처리
public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 클라이언트의 요청을 받는다. : 전달되는 매개 변수가 없음.
		// 2. 비지니스 로직 : DB에서 게시판 전체 목록을 가져오는 작업 수행 → BoardDAO.java
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardList();
		request.setAttribute("list", list); 	// 바인딩(연결) 객체
		
		// 3. 프리젠이션 로직 (페이지 전환) → ActionForward.java : path(경로), isRedirect (boolean)
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardList.jsp");
		forward.setRedirect(false);		// true : sendRedirect(),  false : forward() 방식으로 페이지 전환
		return forward;
	}

}






package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardDetailAction implements Action {
	
	// 게시글 상세 정보 조회
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 클라이언트의 요청을 받는다.
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 2. 비지니스 로직 : DAO 연동(DB 접속, SQl 쿼리 수행)
		//					게시글 번호(num)에 해당 글 조회 → BoardDAO.java
		BoardDAO dao = new BoardDAO();
		dao.boardCount(num); // 조회수 증가
		BoardDTO dto = dao.boardDetail(num); // 상세 정보 조회
		request.setAttribute("dto", dto); 	// 바인딩(연결) 객체
		
		// 3. 프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardDetail.jsp");
		forward.setRedirect(false);	
		
		return forward;
	}

}

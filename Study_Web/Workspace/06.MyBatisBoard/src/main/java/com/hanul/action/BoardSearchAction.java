package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;
import com.hanul.dto.SearchDTO;

public class BoardSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 클라이언트의 요청을 받는다.
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		
		SearchDTO dto = new SearchDTO();
		dto.setSearch(search);
		dto.setKeyword("%" + keyword + "%");  // SQL 문에 like절에서 사용하기 위해 % 부여  
		
		// 2. 비지니스 로직
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardSearch(dto);
		request.setAttribute("list", list);
		
		// 3. 프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardSearchList.jsp");
		forward.setRedirect(false);	
		return forward;
	}

}

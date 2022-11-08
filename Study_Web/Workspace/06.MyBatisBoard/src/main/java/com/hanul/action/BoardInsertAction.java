package com.hanul.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardInsertAction implements Action {

	// 사용자가 입력한 게시글을 DB에 저장(insert) 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 클라이언트의 요청을 받음 → DTO 묶음
		
//		request.setCharacterEncoding("utf-8");		
		BoardDTO dto = new BoardDTO();
		dto.setWriter(request.getParameter("writer"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setPw(request.getParameter("pw"));
		
		// 2. 비지니스 로직 : DAO 연동(DB 접속, SQL 쿼리 수행) 
		//					  글쓰기한 내용을 DB에 저장 작업 수행 → BoardDAO.java 
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);		
		
		// 3. 프리젠테이션 로직 : alert 창을 사용
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if ( succ > 0) {
			out.println("<script>alert('등록완료')");
			out.println("location.href='boardList.bo';</script>");
		} else {
			out.println("<script>alert('등록실패')");
			out.println("location.href='boardList.bo';</script>");
		}
		
		// 위의 코드에서 페이지 전환이 이루어졌으므로
		// ActionForward 가 필요하지 않음.
		
		return null;
	}

}










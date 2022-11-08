package com.hanul.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.action.Action;
import com.hanul.action.ActionForward;
import com.hanul.action.BoardDeleteAction;
import com.hanul.action.BoardDetailAction;
import com.hanul.action.BoardInsertAction;
import com.hanul.action.BoardListAction;
import com.hanul.action.BoardModifyAction;
import com.hanul.action.BoardSearchAction;
import com.hanul.action.BoardUpdateAction;
@WebServlet("/BoardFrontController")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 클라이언트가 어떤 요청을 했는지 파악
		String uri = request.getRequestURI();	// url-pattern 값 : /mbb/xxx.bo
		String ctx = request.getContextPath();	// Context root 값 : /mbb
		String command = uri.substring(ctx.length());	// 실제 요청한 페이지 : /xxx.bo 
		
		System.out.println("uri : " + uri);
		System.out.println("ctx : " + ctx);
		System.out.println("command : " + command);
		
		// 2. 클라이언트의 요청(*.bo → command)과 실제 처리할 비지니스 로직과 연결
		// 실제 처리할 비지니스 로직(BoardxxxAction.java)과 연결
		
		Action action = null;
		ActionForward forward = null;
		
		if ( command.equals("/boardList.bo")) {
			action = new BoardListAction();		// UpCasting으로 객체 생성 : 다형성이 발생
			forward = action.execute(request, response);
		} else if ( command.equals("/boardWrite.bo") ) {  // 게시판 글쓰기 페이지 호출
			// 페이지만 이동할 것이기에 action 처리 불필요
			// 화면 이동을 ActionForward 를 통해 이동할 페이지 지정
			forward = new ActionForward();
			forward.setPath("board/boardWrite.jsp");
			forward.setRedirect(false);
		} else if ( command.equals("/boardInsert.bo")) {	// DB에 게시글 저장(insert) 처리 요청
			action = new BoardInsertAction();
			// null 값을 리턴 받았기 때문에 forward 값은 null 을 가짐
			forward = action.execute(request, response);
		} else if ( command.equals("/boardDetail.bo") ) {
			// 해당 게시글(num)의 상세 정보 조회 후 ...
			action = new BoardDetailAction();
			// board/boardDetail.jsp 전달
			forward = action.execute(request, response);
		} else if ( command.equals("/boardDelete.bo") ) {	// DB에서 해당 게시글 삭제 처리 요청
			action = new BoardDeleteAction();
			forward = action.execute(request, response);  	// 전체 게시글 목록 페이지(boardList.bo)로 이동 
		} else if ( command.equals("/boardModify.bo") ) {	// 해당 게시글 수정화면(상세정보 조회) 이동
			action = new BoardModifyAction();
			forward = action.execute(request, response);
		} else if ( command.equals("/boardUpdate.bo") ) {	// 수정 입력한 정보, 해당 num 게시글 수정 저장 처리 요청
			action = new BoardUpdateAction();
			forward = action.execute(request, response);
		} else if ( command.equals("/boardSearch.bo") ) {
			action = new BoardSearchAction();
			forward = action.execute(request, response);
		}
			
		
		// 3. 프리젠테이션 로직 (페이지 전환) : forward(), sendRedirect()
		if ( forward != null ) {
			if ( forward.isRedirect() ) {  
				// true  : sendRedirect() 방식으로 페이지를 전환 (url이 바뀌며, 요청과 응답하는 부분이 같음)
				// false : forward() 방식으로 페이지를 전환 (url 이 바뀌지 않고, 요청과 응답하는 부분이 다름)
				response.sendRedirect( forward.getPath() );	// 경로만 가져와 페이지 전환
			} else {
				RequestDispatcher rd = request.getRequestDispatcher( forward.getPath() );
				// 바인딩 된 객체와 전환할 페이지 호출
				rd.forward(request, response);
			}
		}
	}

}









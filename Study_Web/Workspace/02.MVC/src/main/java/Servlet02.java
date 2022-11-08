

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.CalcDTO;
import com.hanul.study.SumMachine;

@WebServlet("/s02.do")
public class Servlet02 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ① 클라이언트의 요청을 받는다.(HttpServletRequest) : 매개 변수 값을 가져옴
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt( request.getParameter("num1") ) ;
		int num2 = Integer.parseInt( request.getParameter("num2") ) ;
		
		// ② 비지니스 로직 : 별도의 클래스로 작성 ▶ com.hanul.study
		SumMachine sm = new SumMachine();
		int sum = sm.getSum(num1, num2);
		
		// ③ 프리젠테이션 로직 : result.jsp
		CalcDTO dto = new CalcDTO(num1, num2, sum);
		request.setAttribute("dto", dto);  // 바인딩(연결) 객체
		// setAttribute(이름, 내용) : 내용을 이름으로 연결해주는 메소드
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp"); // 페이지 호출
		rd.forward(request, response);  	// 페이지 전환 (forward)
	}

}



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumMachine;

@WebServlet("/redirect01.do")
public class RedirectServlet01 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ① 클라이언트의 요청을 받는다. : 매개변수를 가져옴
		request.setCharacterEncoding("utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1")) ;
		int num2 = Integer.parseInt(request.getParameter("num2")) ;
		
		// ② 비지니스 로직 : 별도의 클래스에 작성 (SumMachine.java)
		SumMachine sm = new SumMachine();
		int sum = sm.getSum(num1, num2);
		
		// ③ 프리젠테이션 로직 : 결과를 응답 ▶ RedirectServlet02.java (/redirect02.do)
		// sendRedirect() 방식 : 단순한 페이지 전환만 필요할 경우
		// url 이 변경됨.
		// 페이지 전환시 연결할 매개변수가 있다면 get 방식으로 처리
		// 객체의 재사용 여부 ( 재사용 : X )         ↑
		response.sendRedirect("redirect02.do?num1=" + num1 + "&num2=" + num2 + "&sum=" + sum);
	}

}

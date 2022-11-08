

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fn02.do")
public class ForwardServlet02 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ForwardServlet01.java(/fn01.do) 에서 넘겨준 바인딩(연결) 객체를 받는다.
		// 바인딩 객체는 반드시 클래스 타입으로 설정하고 Casting 한다.
		Integer num1 = (Integer) request.getAttribute("num1");
		Integer num2 = (Integer) request.getAttribute("num2");
		Integer sum = (Integer) request.getAttribute("sum");
		
		// 결과를 응답(출력) : html  ▶ HttpServletResponse
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<body>");
		out.println("<h2>forward()</h2>");
		out.println("첫 번째 정수 : " + num1 + "<br />");
		out.println("두 번째 정수 : " + num2 + "<br />");
		out.println("두 정수 사이의 누적합 : " + sum);
		out.println("</body>");		
	}

}









import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.member.MemberDTO;

@WebServlet("/member.do")
public class Member extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청을 받는다. : 매개 변수를 가져온다. ▶ HttpServeltRequest
		
		// 클라이언트로 전달받은 값 중 한글이 있을 경우 
		// 아래와 같이 utf-8로 인코딩 필요 (없을 경우 한글이 깨짐)
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int age = Integer.parseInt(request.getParameter("age")) ;
		String addr = request.getParameter("addr");
		
		// 비지니스 로직 : DAO 를 통해 DB와 연동하여 결과를 리턴받는 작업
		MemberDTO dto = new MemberDTO(name, id, pw, age, addr);
		
		// DB 연동 : MemberDAO.java → insertMember()
		
		// 프리젠테이션 로직 : 리턴 받은 결과를 클라이언트에게 응답 ▶ HttpServletResponse
		// ▶ View (*.html, *.jsp)
		request.setAttribute("dto", dto);
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		// result.jsp 에서 request, response 객체가 사용 (데이터 전달)
		rd.forward(request, response);
		
	}

}

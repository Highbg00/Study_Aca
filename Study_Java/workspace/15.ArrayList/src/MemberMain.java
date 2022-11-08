import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class MemberMain {
	public static void main(String[] args) {
		//회원정보(MemberDTO.java)를 ArrayList<> list에 저장(add())하시오.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("홍길동", 27, "광주시 서구 농성동", "010-1111-1111"));
		list.add(new MemberDTO("김길동", 29, "광주시 남구 봉선동", "010-2222-2222"));
		list.add(new MemberDTO("나길동", 25, "광주시 북구 용봉동", "010-3333-3333"));
		
		//회원정보를 출력 : display() ▶ MemberDAO.java
		MemberDAO dao = new MemberDAO();
		dao.display(list);
		
		//나이의 오름차순 정렬 후 출력 : ageAscSort() ▶ MemberDAO.java
		dao.ageAscSort(list);
		dao.display(list);
		
		//이름의 내림차순 정렬 후 출력 : nameDescSort() ▶ MemberDAO.java
		dao.nameDescSort(list);
		dao.display(list);
	}//main()
}//class

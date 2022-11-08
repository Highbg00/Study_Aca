public class BookMain02 {
	public static void main(String[] args) {
		//도서정보(title, name, company, price ▶ BookDTO.java)를 저장할
		//객체배열(book[])을 선언
		BookDTO[] book;
		
		//3권의 도서정보가 저장될 객체 배열을 생성 : new
		book = new BookDTO[3];
		
		//객체배열을 선언 및 생성
		//BookDTO[] book = new BookDTO[3];
		
		//BookDTO.java의 초기화된 생성자 메소드를 이용하여 내용(값)을 입력(할당)
		book[0] = new BookDTO("JAVA", "신용권", "한빛", 24000);
		book[1] = new BookDTO("View", "김은옥", "삼양", 28000);
		
		//디폴트 생성자 메소드를 이용하여 값을 할당 : setter method
		BookDTO dto = new BookDTO();
		dto.setTitle("SQL");
		dto.setName("개발팀");
		dto.setCompany("한울");
		dto.setPrice(15000);
		book[2] = dto;
		
		//도서정보(book[])의 내용을 출력 ▶ BookDAO.java → display() 메소드 호출
		BookDAO dao = new BookDAO();	//BookDAO 객체를 생성
		dao.display(book);	//메소드 호출
	}//main()
}//class

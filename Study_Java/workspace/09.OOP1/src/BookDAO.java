//행위정보(동작, 기능)를 저장하는 Class ▶ 메소드의 집합
//DAO Class를 통해 DataBase에 접속하고 사용자의 요청을 처리
public class BookDAO {
	//출력메소드 : getter method
	public void display(BookDTO[] book) {
		System.out.println("제목\t저자\t출판사\t가격");
		System.out.println("=============================");
		for (int i = 0; i < book.length; i++) {
			System.out.print(book[i].getTitle() + "\t");
			System.out.print(book[i].getName() + "\t");
			System.out.print(book[i].getCompany() + "\t");
			System.out.print(book[i].getPrice() + "\n");			
		}
		System.out.println("=============================");
	}//display()
}//class

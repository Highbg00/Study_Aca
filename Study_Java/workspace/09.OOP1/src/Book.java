import java.text.DecimalFormat;

public class Book {
	//멤버변수(필드) 선언 ▶ 상태정보 : DTO(VO) Class
	String title, name, company;
	int cost, qty, price;
	
	//가격계산 멤버메소드 정의 : getPrice() ▶ DAO Class
	public void getPrice() {
		price = cost * qty;
	}//getPrice()
	
	//출력메소드 정의 : display() ▶ DAO Class
	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");	//￦ : ㄹ → 한자
		System.out.println("도서명 : " + title);
		System.out.println("저자 : " + name);
		System.out.println("출판사 : " + company);
		System.out.println("단가 : " + df.format(cost));
		System.out.println("수량 : " + qty);
		System.out.println("주문금액 : " + df.format(price));
		System.out.println("====================");
	}//display()
}//class

public class Operator08 {
	public static void main(String[] args) {
		//프로그램에서 사용되는 특수기호문자(Escape Sequence) : 출력문에 많이 사용
		//역슬래쉬(\, ￦)를 먼저 입력하고 사용한다.
		System.out.println("1. HelloWorld");
		System.out.println("2. Hello" + "\t" + "World");	//\t : 탭간격(8칸 띄워쓰기)
		System.out.println("3. Hello\tWorld");	//문자열 출력문 안에 연결해서 사용가능
		System.out.println("4. Hello" + "\n" + "World");	//\n : 줄바꿈
		System.out.println("5. Hello" + "\b" + "World");	//\b : 백스페이스
		System.out.println("6. Hello" + "\r" + "World");	//\r : Carriage Return(행의 처음으로 커서를 이동)
		System.out.println("7. Hello" + "\'" + "World");	//\' : 작은따옴표를 표시
		System.out.println("8. Hello" + "\"" + "World");	//\" : 쌍따옴표를 표시
		System.out.println("9. Hello" + "\\" + "World");	//\\ : 역슬래쉬 기호를 표시
		
		System.out.println("번호" + "\t" + "이름" + "\t" + "주소");
		System.out.println("1" + "\t" + "홍길동" + "\t" + "광주광역시 서구 농성동");
		
		System.out.println("나는 \"자바\"를 공부하고 있습니다.");
		System.out.println("나는 " + "\"자바\"" + "를 공부하고 있습니다.");
	}//main()
}//class

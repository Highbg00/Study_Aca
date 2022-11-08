public class Variable05 {
	public static void main(String[] args) {
		//문자 데이터 타입 : char(2Byte) ▶ 하나의 글자만 저장 : 유니코드(UNICode)
		//값을 할당할 때는 작은따옴표를 사용한다.
		char a = 'A';
		char b = '가';
		char c = '★';
		System.out.println("변수 a : " + a);
		System.out.println("변수 b : " + b);
		System.out.println("변수 c : " + c);
		
		//String : 문자열을 저장할 수 있는 클래스
		//값을 할당할 때는 쌍따옴표를 사용한다.
		String str1 = "ABCD";
		String str2 = "대한민국";
		System.out.println("str1의 값 : " + str1);
		System.out.println("str2의 값 : " + str2);
	}//main()
}//class
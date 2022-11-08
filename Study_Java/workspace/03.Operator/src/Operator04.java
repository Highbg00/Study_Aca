public class Operator04 {
	public static void main(String[] args) {
		//비교연산자 ▶ 조건문에 많이 사용
		//연산의 결과는 true, false 반환 → boolean Type
		//>, >=, <, <= : 수학의 연산과 같은 대소관계를 비교연산자
		//a = b : 수학에서는 같다라는 의미이지만 프로그램에서는 할당(대입)을 의미
		//a == b : 프로그램에서 같다라는 의미
		//a != b : 같지않다라는 의미
		
		int a = 5, b = 10;	//선언, 할당, 초기화, 나열
		System.out.println(a > b);	//false
		System.out.println(a >= b);	//false
		System.out.println(a < b);	//true
		System.out.println(a <= b);	//true
		System.out.println(a == b);	//false
		System.out.println(a != b);	//true
	}//main()
}//class
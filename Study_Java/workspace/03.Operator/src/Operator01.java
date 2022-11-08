public class Operator01 {
	public static void main(String[] args) {
		//산술연산자 : +, -, *, / ▶ 수학식에서 다루는 4칙연산과 동일
		//나머지 연산 : % ▶ 짝수/홀수, 배수의 판단에 사용 → 조건식 처리에 활용
		int a = 10, b = 3;	//정수형 변수 a를 선언하고 값(10)을 할당하고, ▶ 초기화
							//정수형 변수 b를 선언하고 값(3)을 할당하면서 나열
		
		int addResult = a + b;	//덧셈
		int subResult = a - b;	//뺄셈
		int mulResult = a * b;	//곱셈
		int divResult = a / b;	//나눗셈(주 : 나눗셈의 연산 결과는 실수가 나올 수 있다)
		int modResult = a % b;	//나머지
		
		System.out.println("덧셈 : " + addResult);		//출력값 : 13
		System.out.println("뺄셈 : " + subResult);		//출력값 : 7
		System.out.println("곱셈 : " + mulResult);		//출력값 : 30
		System.out.println("나눗셈 : " + divResult);	//출력값 : 3
		System.out.println("나머지 : " + modResult);	//출력값 : 1
		
		int x = 3, y = 5;
		System.out.println("x + y = " + x + y);		//x + y = 35
		System.out.println(x + y  + " = x + y");	//8 = x + y
		System.out.println(x - y + x + y);			//6
		System.out.println("x - y" + x + y);		//x - y35
		System.out.println(x - y + " = x - y");		//-2 = x - y		
	}//main()
}//class
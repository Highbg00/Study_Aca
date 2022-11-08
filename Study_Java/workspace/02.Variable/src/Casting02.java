public class Casting02 {
	public static void main(String[] args) {
		char i = 'A';
		int j = i;	//자동형 변환(char → int)
		System.out.println("변수 i의 값 : " + i);	//출력값 : A
		System.out.println("변수 j의 값 : " + j);	//출력값 : 65 → UniCode 값
		System.out.println("변수 j의 값 : " + (char) j);	//출력값 : A ▶ 강제형 변환
		
		int num1 = 10;
		int num2 = 2;
		int num3 = 4;
		
		int result1 = num1 / num2;
		int result2 = num1 / num3;
		double result3 = num1 / num3;
		double result4 = (double) num1 / (double) num3;	//강제형 변환
		
		System.out.println("결과1 : " + result1);	//출력값 : 5(10 / 2)
		System.out.println("결과2 : " + result2);	//출력값 : 2(10 / 4 : int / int)
		System.out.println("결과3 : " + result3);	//출력값 : 2.0
		System.out.println("결과4 : " + result4);	//출력값 : 2.5
	}//main()
}//class
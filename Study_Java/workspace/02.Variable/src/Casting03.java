public class Casting03 {
	public static void main(String[] args) {
		//String 클래스를 이용하여 문자 10(str1)과 문자 20(str2)을 더하기 연산
		String str1 = "10";
		String str2 = "20";
		System.out.println(str1 + str2);	//출력값 : 1020 ▶ Concatenation(결합, 연결)
		
		//문자 10(str1)을 정수 10(num1)으로 변환
		//int num1 = (int) str1;	//오류 ▶ Casting 연산자를 사용할 수 없다.
		//Wrapper Class : String 타입을 기본 데이터 타입으로 변환해 주는 클래스
		int num1 = Integer.parseInt(str1);	//변수 num1에는 정수 10이 저장
		int num2 = Integer.parseInt(str2);	//변수 num2에는 정수 20이 저장
		System.out.println(num1 + num2);	//출력값 : 30
		System.out.println(Integer.parseInt(str1) + Integer.parseInt(str2));
		
		//String 클래스를 이용하여 문자 12.3(str3)과 문자 45.67(str4)을 더하기 연산
		String str3 = "12.3";
		String str4 = "45.67";
		System.out.println(str3 + str4);	//출력값 : 12.345.67
		
		double num3 = Double.parseDouble(str3);	//String → double
		double num4 = Double.parseDouble(str4);	//Wrapper Class : 박싱(Boxing)
		System.out.println(num3 + num4);	//출력값 : 57.97
		
		System.out.println(Double.parseDouble(str3) + Double.parseDouble(str4));
	}//main()
}//class

import java.text.DecimalFormat;
import java.util.Scanner;

public class Test_Method03 {
	//임의의 정수 2개를 입력받아(num1, num2) ▶ Scanner Class
	//사칙연산을 수행하는 메소드를 호출 : add(), sub(), mul(), div()
	//결과값은 리턴받아 출력하시오.
	//단, 나눗셈의 결과는 실수형태로 출력 ▶ 실수 타입으로 Casting
	//단, 나눗셈의 결과는 소수 둘째자리까지 표시 ▶ DecimalFormat Class
	public static void main(String[] args) {
		//입력
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("두 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		//처리
		int addResult = add(num1, num2);
		
		//출력
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		System.out.println("덧셈의 결과 : " + addResult);
		System.out.println("덧셈의 결과 : " + add(num1, num2));
		System.out.println("뺄셈의 결과 : " + sub(num1, num2));
		System.out.println("곱셈의 결과 : " + mul(num1, num2));
		System.out.println("나눗셈의 결과 : " + div(num1, num2));
		System.out.println("나눗셈의 결과 : " + divResult(num1, num2));
	}//main()
	
	//메소드 구현 : add(), sub(), mul(), div()
	public static int add(int num1, int num2) {
		//int addResult = num1 + num2;
		//return addResult;
		return num1 + num2;
	}//add()
	
	public static int sub(int num1, int num2) {
		return num1 - num2;
	}//sub()
	
	public static int mul(int num1, int num2) {
		return num1 * num2;
	}//mul()
	
	public static double div(int num1, int num2) {
		return (double)num1/num2;
	}//div()
	
	//출력되는 표시형식을 변경하는 메소드 : DecimalFormat Class
	public static String divResult(int num1, int num2) {
		DecimalFormat df = new DecimalFormat("0.00");
		double result = (double)num1 / num2;
		return df.format(result);	//DecimalFormat 사용하면 결과는 String Type
	}//divResult()
	
}//class

/*
# : 의미없는 0값은 표시하지 않는다.
0 : 0의 개수만큼 화면에 표시
========================
3.14	##.###	 3.14
3.14	00.000	03.140

0.45	#.#		 .5
0.45	0.0		0.5
========================
0.00 	▶ 소수 둘째자리까지 표시(예 : 3.40)
#,##0	▶ 천단위 구분기호 표시(1,234)
*/

import java.util.Scanner;

public class Ex_Scanner {
	public static void main(String[] args) {
		//두 개의 정수를 입력(num1, num2)받은 후, 사칙연산을 수행하고 결과를 출력
		//입력 : Scanner 객체 생성 ▶ new Scanner(System.in);
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");	//입력을 대기하는 상태
		int num1 = scanner.nextInt();
		System.out.print("두 번째 정수를 입력하세요 : ");	//블럭킹 상태(Blocking State)
		int num2 = scanner.nextInt();
		scanner.close();
		
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		
		int addResult = num1 + num2;
		System.out.println("덧셈의 결과 : " + addResult);
		System.out.println("덧셈의 결과 : " + (num1 + num2));
		System.out.println("뺄셈의 결과 : " + (num1 - num2));
		System.out.println("곱셈의 결과 : " + (num1 * num2));
		System.out.println("나눗셈의 결과 : " + (num1 / num2));
		System.out.println("나눗셈의 결과 : " + (double)(num1 / num2));
		System.out.println("나눗셈의 결과 : " + ((double)num1 / num2));
		
	}//main()
}//class

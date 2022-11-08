import java.util.Scanner;

public class Test_Method04 {
	//임의의 정수 두개를 입력(num1, num2)받은 후
	//두 정수 사이의 홀수의 합(oddSum)을 구하여 결과를 리턴하는 메소드(getOddSum())를 호출
	//두 정수 사이의 짝수의 합(evenSum)을 구하여 결과를 리턴하는 메소드(getEvenSum())를 호출	
	public static void main(String[] args) {
		//입력
		Scanner scanner = new Scanner(System.in);
		System.out.print("첫 번째 정수를 입력하세요 : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("두 번째 정수를 입력하세요 : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		//출력
		if(num1 > num2) {
			System.out.println("첫 번째 정수는 작은수, 두 번째 정수는 큰수를 입력하세요!");
		}else {
			System.out.println("첫 번째 정수 : " + num1);
			System.out.println("두 번째 정수 : " + num2);
			System.out.println("홀수의 합 : " + getOddSum(num1, num2));
			System.out.println("짝수의 합 : " + getEvenSum(num1, num2));
		}
	}//main()
	
	//두 정수 사이의 홀수의 합(oddSum)을 계산하고 리턴하는 메소드를 정의 : getOddSum()
	public static int getOddSum(int num1, int num2) {
		int oddSum = 0;
		for(int i = num1; i <= num2; i++) {
			if(i % 2 != 0) {
				oddSum += i;
			}
		}
		return oddSum;
	}//getOddSum()
	
	//두 정수 사이의 짝수의 합(evenSum)을 계산하고 리턴하는 메소드를 정의 : getEvenSum()
	public static int getEvenSum(int num1, int num2) {
		int evenSum = 0;
		for(int i = num1; i <= num2; i++) {
			if(i % 2 == 0) {
				evenSum += i;
			}
		}
		return evenSum;
	}//getEvenSum()
}//class

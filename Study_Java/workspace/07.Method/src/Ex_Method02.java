public class Ex_Method02 {
	//getSum() 메소드에 10과 20을 매개변수로 보내는 호출문 작성
	//단, 결과는 return 받은 후 출력하시오 ▶ getSum() 결과값 → main() 전달
	public static void main(String[] args) {
		int num1 = 10, num2 = 20;		//getSum() 메소드로 보낼 매개변수를 초기화
		int sum = getSum(num1, num2);	//getSum() 메소드를 호출 ▶ 실인수
		System.out.println("첫 번째 정수 : " + num1);
		System.out.println("두 번째 정수 : " + num2);
		System.out.println("두 정수의 합 : " + sum);
	}//main()

	//2개의 정수를 매개변수로 받아 합계(sum)를 구하여 리턴하는 메소드(getSum()) 정의
	public static int getSum(int num1, int num2) {	//getSum() 메소드를 정의 ▶ 가인수
		int sum = num1 + num2;
		return sum;				//return : 리턴타입 변경 ▶ void → int
	}//getSum()
}//class

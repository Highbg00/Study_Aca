import java.util.Arrays;

public class Ex_Sum {
	public static void main(String[] args) {
		//정수형 배열(arr[])의 원소값의 누적합(sum)을 구하여 출력
		int[] arr = {3, 2, 4, 1, 5};	//정수형 배열을 선언하고 값을 할당 : 초기화
		int sum = 0;	//누적합이 저장될 변수를 선언하고 값을 할당 : 초기화
		
		for (int i = 0; i < arr.length; i++) {
			sum = sum + arr[i];		//누적합 계산 : sum += arr[i];
		}
		
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("원소의 누적합 : " + sum);
	}//main()
}//class

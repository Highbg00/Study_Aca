import java.util.Arrays;

public class Ex_Min {
	public static void main(String[] args) {
		//정수형 배열(arr[])의 원소값의 최소값(min)을 구하여 출력
		int[] arr = {3, 2, 4, 1, 5};	//정수형 배열을 선언하고 값을 할당 : 초기화
		int min = arr[0];	//최소값이 저장될 변수를 초기화 ▶ 배열의 첫 번째 index로 할당
		for (int i = 0; i < arr.length; i++) {
			if(min > arr[i]) {	//현재의 최소값(min)과 각각의 배열 원소값(arr[i])을 비교
				min = arr[i];	//배열 원소값이 더 작으면, 최소값을 변경(arr[i] 값으로 재할당)
			}//if
		}//for
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("배열의 최소값 : " + min);
		
		Arrays.sort(arr);	//배열(arr[])을 오름차순 정렬
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("배열의 최소값 : " + arr[0]);		
	}//main()
}//class

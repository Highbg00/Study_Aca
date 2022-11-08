import java.util.Arrays;

public class Ex_Sort {
	public static void main(String[] args) {
		//정수형 배열(arr[])의 원소값을 오름차순으로 정렬하여 출력 : ascSort()
		//정수형 배열(arr[])의 원소값을 내림차순으로 정렬하여 출력 : descSort()
		int[] arr = {4, 3, 1, 2, 5};	//정수형 배열을 선언하고 값을 할당 : 초기화
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		
		Ex_Sort sort = new Ex_Sort();
		System.out.println("오름차순 정렬 : " + Arrays.toString(sort.ascSort(arr)));
		System.out.println("내림차순 정렬 : " + Arrays.toString(sort.descSort(arr)));
		
		Arrays.sort(arr);	//오름차순 정렬
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));		
	}//main()
	
	//오름차순으로 정렬하는 메소드를 정의
	public int[] ascSort(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if(arr[i] > arr[j]) {	//오름차순
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}//if
			}//for j
		}//for i
		return arr;
	}//ascSort()
	
	//내림차순으로 정렬하는 메소드를 정의
	public int[] descSort(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if(arr[i] < arr[j]) {	//내림차순
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}//if
			}//for j
		}//for i
		return arr;
	}//ascSort()
}//class

public class ForEachMain01 {
	public static void main(String[] args) {
		int[] score = {95, 80, 83, 72, 91};
		
		//배열의 총합(sum) : 단순 for문 ▶ 배열(Array[]) 적용
		int sum = 0;
		for (int i = 0; i < score.length; i++) {
			sum += score[i];
		}
		System.out.println("배열의 총합 : " + sum);
		
		//배열의 총합(result) : 향상된 for문(forEach문) ▶ 무한배열(ArrayList<>) 적용
		int result = 0;
		for (int i : score) {
			result += i;
		}
		System.out.println("배열의 총합 : " + result);
	}
}

/*
○ 단순 for문 : index 필요
	for(초기값(시작값); 조건식(최종값); 증감값){
		~~body(반복변수)~~;
	}
	
	for(int i = 0; i < arr.length; i++){
		arr[i] = 10;
	}
	
○ 향상된 for문 : 단순 for문 간소화 → index 불필요
	for(Type 식별자 : 배열명){
		~~body(식별자)~~;
	}
	
	for(int i : arr){
		syso(i);
	}
*/
public class Ex_do_while {
	public static void main(String[] args) {
		//1부터 100까지의 정수 중에서 짝수의 누적합(whileEvenSum)을 구하여 출력 : while, if
		int whileEvenSum = 0;	//결과가 저장될 변수를 초기화
		
		int i = 1;						//초기값 : 1부터 시작
		while(i <= 100) {				//조건식 : 100까지 구동(동작)
			if(i % 2 == 0) {			//실행문 : 반복변수의 값이 짝수이면
				whileEvenSum += i;		//짝수의 누적합 계산		
			}//if						//실행문 종료
			i++;						//증감값 : 1씩 증가
		}//while
		
		System.out.println("while 짝수의 합 : " + whileEvenSum);
		
		//1부터 100까지의 정수 중에서 짝수의 누적합(doEvenSum)을 구하여 출력 : do~while, if
		int doEvenSum = 0;		//결과가 저장될 변수를 초기화
		
		i = 1;						//초기값(재할당) : 1부터 시작
		do {						//반복문 시작
			if(i % 2 == 0) {		//실행문 : 짝수이면
				doEvenSum += i;		//짝수의 누적합 계산
			}//if					//실행문 종료
			i++;					//증감값 : 1씩 증가
		} while(i <= 100);			//조건식 : 100까지 동작
		
		System.out.println("do_while 짝수의 합 : " + doEvenSum);
	}//main()
}//class

/*
○ do~while : 선처리 → 후조건
	▶ 조건이 처음부터 거짓이더라도 실행문(반복문)은 최소 1번은 실행

초기값;	
do{
	실행문;
	증감값;
}while(조건식);


*/
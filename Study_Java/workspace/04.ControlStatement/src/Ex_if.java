public class Ex_if {
	public static void main(String[] args) {
		int a = 10;	//정수형 변수 a를 선언하고 값(10)을 할당 ▶ 초기화
		if(a % 2 == 0) {	//a를 2로 나눈 나머지 값이 0과 같다 → 짝수
			System.out.println("입력값은 " + a + "입니다.");
			System.out.println(a + "은 짝수입니다.");
		}//if
		
		int b = 9;
		if(b % 2 != 0) {	//b를 2로 나눈 나머지 값이 0과 같지 않다 → 홀수 ▶ if(b % 2 == 1)
			System.out.println("입력값은 " + b + "입니다." + "\n" + b + "는 홀수입니다.");
		}//if
	}//main()
}//class

/*
★ 단순 if문 : 조건을 판단하여, 조건이 참일 경우에만 실행

if(조건식){
	실행문;
}

※ 실행되는 문장이 단일문장이면 {}을 생략해도 된다 → 권장사양은 아니다.
	▶ if(조건식) 실행문;
*/
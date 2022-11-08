public class Operator05 {
	public static void main(String[] args) {
		//논리연산자 : 여러개의 조건을 판단 ▶ 조건식에 많이 사용
		//연산의 결과는 true, false 반환
		//조건A && 조건B : 조건 A도 참이고 조건 B도 참일 경우 → 참으로 출력
		//조건A || 조건B : 조건 A 또는 조건 B 중에서 하나라도 참일 경우 → 참으로 출력
		//AND 조건(모두 만족) : ~~이면서, ~~이고
		//OR 조건(하나라도 만족) : A이거나, ~~또는
		
		System.out.println(10 > 5 && 20 > 5);	//true && true : true
		System.out.println(10 > 5 && 20 < 5);	//true && false : false
		System.out.println(10 < 5 && 20 > 5);	//false && true : false
		System.out.println(10 < 5 && 20 < 5);	//false && false : false
		
		System.out.println();	//빈 줄 삽입
		
		System.out.println(10 > 5 || 20 > 5);	//true || true : true
		System.out.println(10 > 5 || 20 < 5);	//true || false : true
		System.out.println(10 < 5 || 20 > 5);	//false || true : true
		System.out.println(10 < 5 || 20 < 5);	//false || false : false		
	}//main()
}//class
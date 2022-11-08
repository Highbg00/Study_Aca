public class Operator03 {
	public static void main(String[] args) {
		//비트연산자 : 하드웨어 제어 → 현재는 거의 사용하지 않는다.
		//① &(AND) : 모두 1일때 → 1 출력  
		//② |(OR) : 하나라도 1일때 → 1출력
		//③ ^(XOR) : 서로 다를때 → 1출력
		//④ !(NOT) : 1 → 0, 0 → 1(부정)
		int x = 2;	//2진법 : 10
		int y = 3;	//2진법 : 11
		
		System.out.println(x & y);	//출력값 : 2(2진법 : 10)
		System.out.println(x | y);	//출력값 : 3(2진법 : 11)
		System.out.println(x ^ y);	//출력값 : 1(2진법 : 01)
		
		boolean result = true;
		System.out.println(result);		//출력값 : true
		System.out.println(!result);	//출력값 : false
	}//main()
}//class
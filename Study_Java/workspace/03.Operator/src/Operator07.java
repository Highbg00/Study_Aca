public class Operator07 {
	public static void main(String[] args) {
		int a = 10;
		String result = a == 10 ? "같다" : "다르다";
		System.out.println(result);
		
		int b = 10;
		if(b == 10) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}
	}//main()
}//class

/*
○ 삼항연산자
	- 3개의 항으로 구성된다.
	- 간략한 조건식을 작성할 경우 편리하다.
	- 조건식 ? 참값 : 거짓값; 
*/

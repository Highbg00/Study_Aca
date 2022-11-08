public class Casting01 {
	public static void main(String[] args) {
		int a = 10;	//정수형 변수 a를 선언하고, 값(10)을 할당 ▶ 초기화
		double b;	//실수형 변수 b를 선언만 한 상태
		b = a;		//변수 a의 값을 변수 b에 할당
		System.out.println("변수 a의 값 : " + a);	//출력값 : 10
		System.out.println("변수 b의 값 : " + b);	//출력값 : 10.0
		//자동형 변환 : 작은 타입(int)이 큰 타입(double)으로 자동으로 변환
		// ▶ 묵시적 형변환, UpCasting
		
		int c;				//정수형 변수 c를 선언만 한 상태
		double d = 34.5;	//실수형 변수 d를 선언하고, 값(34.5)을 할당 ▶ 초기화
		//c = d;			//오류 : 큰 타입(double)을 작은 타입(int)에 할당
		c = (int) d;
		System.out.println("변수 c의 값 : " + c);	//출력값 : 34 → 0.5의 손실 발생
		System.out.println("변수 d의 값 : " + d);	//출력값 : 34.5
		//강제형 변환 : 큰 타입(double)이 작은 타입(int)으로 강제로 변환
		// ▶ 명시적 형변환, DownCasting, 일반적인 의미의 Casting
		
		int x = 128;
		byte y = (byte) x;	//강제형 변환(int → byte)
		System.out.println("변수 x의 값 : " + x);	//출력값 : 128
		System.out.println("변수 y의 값 : " + y);	//출력값 : -128
	}//main()
}//class

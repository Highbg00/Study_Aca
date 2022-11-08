public class Operator09 {
	public static void main(String[] args) {
		//2진수 : 숫자 앞에 '0b'를 붙인다.	▶ 0, 1
		//8진수 : 숫자 앞에 '0'을 붙인다.	▶ 0 ~ 7
		//10진수 : 일반적으로 활용하는 방식	▶ 0 ~ 9
		//16진수 : 숫자 앞에 '0x'를 붙인다.	▶ 0 ~ 9, A ~ F
		int a = 0b11;	//2진수
		int b = 011;	//8진수
		int c = 11;		//10진수
		int d = 0x11;	//16진수
		
		System.out.println("변수 a의 값 : " + a);
		System.out.println("변수 b의 값 : " + b);
		System.out.println("변수 c의 값 : " + c);
		System.out.println("변수 d의 값 : " + d);
	}//main()
}//class
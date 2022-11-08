public class Ex_Method03 {
	public static void main(String[] args) {
		getSum(10, 20);				//getSum(int, int) 메소드 호출
		System.out.println("===================");
		
		getSum(10, 20, 30);			//getSum(int, int, int) 메소드 호출
		System.out.println("===================");
		
		getSum(10.5, 20.7);			//getSum(double, double) 메소드 호출
		System.out.println("===================");
		
		getSum(10, 10.5);			//getSum(double, double) 메소드 호출
	}//main()
	
	//getSum(int, int) 메소드 정의
	public static void getSum(int x, int y) {
		System.out.println("첫 번째 인수 : " + x);
		System.out.println("두 번째 인수 : " + y);
		System.out.println("두 인수의 합 : " + (x + y));
	}//getSum()
	
	//getSum(int, int, int) 메소드 정의
	public static void getSum(int x, int y, int z) {
		System.out.println("첫 번째 인수 : " + x);
		System.out.println("두 번째 인수 : " + y);
		System.out.println("세 번째 인수 : " + z);
		System.out.println("세 인수의 합 : " + (x + y + z));
	}//getSum()
	
	//getSum(double, double) 메소드 정의
	public static void getSum(double x, double y) {
		System.out.println("첫 번째 인수 : " + x);
		System.out.println("두 번째 인수 : " + y);
		System.out.println("두 인수의 합 : " + (x + y));
	}//getSum()	
	
}//class

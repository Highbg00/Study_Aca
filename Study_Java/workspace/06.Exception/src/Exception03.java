public class Exception03 {
	public static void main(String[] args) {
		try {
			int result  = 10 / 5;	//ArithmeticException : 미확인 예외
			System.out.println("result : " + result);
			
			int[] arr = new int[3];
			arr[0] = 10;
			System.out.println("arr[0] : " + arr[3]);
			
		} catch (ArithmeticException e) {
			System.out.println("입력값이 잘못 되었습니다.");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("배열의 index가 잘못 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();	//예외를 상세하게 출력
		}
	}//main()
}//class
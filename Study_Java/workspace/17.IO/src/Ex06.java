import java.io.InputStream;

public class Ex06 {
	public static void main(String[] args) {
		//키보드에서 영문자 여러 글자를 입력받아 출력
		//단, 입력한 글자중에 'q'라는 문자가 입력되면 종료
		InputStream is = System.in;
		System.out.print("영문자 여러 글자를 입력하세요 : ");
		try {
			int data;
			while((data = is.read()) != 'q') {
				System.out.println("입력하신 영문자는 " + (char)data + "입니다.");
			}
			System.out.println("종료되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class

import java.io.IOException;
import java.io.InputStream;

public class Ex01 {
	public static void main(String[] args) {
		//키보드에서 영문자 1글자를 입력받아 출력
		InputStream is = System.in;		//노드스트림 : 가장 먼저 연결되는 스트림
		System.out.print("영문자 1글자를 입력하세요 : ");
		try {
			int data = is.read();
			System.out.println("입력하신 영문자는 " + data + "입니다.");	//출력값 : 65 → ASCII
			System.out.println("입력하신 영문자는 " + (char) data + "입니다.");	//Casting
		} catch (IOException e) {	//IOException 발생
			e.printStackTrace();	//예외를 메모리에서 추적하여 상세하게 출력
		}
	}//main()
}//class

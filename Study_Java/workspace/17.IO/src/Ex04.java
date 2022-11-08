import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex04 {
	public static void main(String[] args) {
		//키보드에서 한글 1글자를 입력받아 출력
		InputStream is = System.in;	//바이트 스트림 : ASCII Code, 이미지, 영상, 음원 등
		InputStreamReader isr = new InputStreamReader(is);  //문자 스트림 : 텍스트, UniCode
		//InputStreamReader isr = new InputStreamReader(System.in);	//연쇄
		
		System.out.print("한글 1글자를 입력하세요 : ");
		try {
			int data = isr.read();
			System.out.println("입력하신 글자는 " + data + "입니다.");	//UniCode 값
			System.out.println("입력하신 글자는 " + (char)data + "입니다.");	//Casting			
		} catch (Exception e) {
			e.printStackTrace();
		}//try
	}//main()
}//class

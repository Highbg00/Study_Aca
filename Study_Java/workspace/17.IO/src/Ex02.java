import java.io.InputStream;

public class Ex02 {
	public static void main(String[] args) {
		//키보드에서 영문자 1글자를 입력받아 출력
		InputStream is = System.in;		//바이트 단위(기반)로 입력하는 기본(노드)스트림
		System.out.print("영문자 1글자를 입력하세요 : ");
		try {
			int data = is.read();
			System.out.println(data);		//65 : ASCII Code
			System.out.println((char)data);	//A
			
			data = is.read();				//Enter : CR
			System.out.println(data);		//13 : ASCII Code
			System.out.println((char)data);	//화면에는 공백문자가 출력된 후 줄바꿈
			
			data = is.read();				//Enter : LF 
			System.out.println(data);		//10 : ASCII Code
			System.out.println((char)data);	//화면에는 공백문자가 출력된 후 줄바꿈
			
		} catch (Exception e) {		//모든 예외를 처리
			e.printStackTrace();	//예외를 상세하게 출력
		}
	}//main()
}//class

/*
- 사용자가 문자를 입력 → Enter 입력
- Enter를 입력하는 것은 프로그램 종료(Terminate : Ctrl + C)가 아니다.
- CR(Carriage Return) : 커서를 줄의 맨앞으로 이동
- LF(Line Feed) : 커서를 한 줄 아래로 이동
*/
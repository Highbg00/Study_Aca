import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Exception05 {
	public static void main(String[] args) throws FileNotFoundException, Exception {
		/*
		try {
			FileInputStream fis = new FileInputStream("abc.txt");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		*/
		
		FileInputStream fis = new FileInputStream("abc.txt");
	}//main()
}//class

/*
○ throws
	- 예외를 처리하는 방법
	- 예외회피(예외 미루기)
	- try ~ catch 블럭을 사용하지 않는다.
	- 메소드 선언부에 사용
		예) public void xxx(){ ~~body(try_catch)~~ }
			→ public void xxx() throws XXXException, OOOException { ~~body~~ }
*/
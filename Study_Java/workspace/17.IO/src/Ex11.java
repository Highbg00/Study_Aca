import java.io.FileReader;

public class Ex11 {
	//파일(텍스트문서, 유니코드)에서 문자 단위로 입출력하는 스트림
	//FileReader, FileWriter
	//한글이 포함된 파일(member.txt)에서 데이터를 읽어서 화면에 출력
	//member.txt 파일 생성 : IO Project > 마오 > New > File > member.txt
	//내용 작성 시 항목간 구분은 반드시 TAB 키를 활용한다.
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader("member.txt");	//원본파일
			int data, cnt = 0;
			while((data = fr.read()) != -1) {
				cnt++;
				System.out.println((char)data);
			}
			fr.close();
			System.out.println("접근횟수 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class

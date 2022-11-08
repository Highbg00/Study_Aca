import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

//Client : 정보를 요청(Request, 질의)
public class EchoClient {
	public static void main(String[] args) {
		//서버에 접속을 시도하여 접속에 성공하면 Socket 생성
		//Client Socket : 서버의 IP주소 + 서버의 Port번호
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.38", 9999);	//서버의 IP주소 + Port번호
			
			//클라이언트에서 서버로 송신(출력)하기 위한 준비단계 : 출력스트림
			OutputStream os = socket.getOutputStream();	//socket으로부터 기본 출력스트림을 가져온다
			//OutputStreamWriter osw = new OutputStreamWriter(os);	//문자형 자료(유니코드) 출력
			//BufferedWriter bw = new BufferedWriter(osw);	//버퍼를 활용
			PrintWriter pw = new PrintWriter(os);	//PrintWriter : osw + bw
			
			//키보드에서 메세지를 입력(Scanner)받아 서버로 보내자
			Scanner scanner = new Scanner(System.in);
			System.out.print("서버로 보낼 메세지를 입력하세요 : ");
			String msg = scanner.nextLine();
			pw.println(msg);
			pw.flush();
			
			//서버에서 보낸 메세지를 수신(입력)받아 화면에 출력 : 입력스트림
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String echoMsg = br.readLine();
			System.out.println("서버로 부터 받은 메세지 : " + echoMsg);
			
			//스트림 종료
			br.close();
			scanner.close();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EchoClient Exception!!!");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//try		
	}//main()
}//class

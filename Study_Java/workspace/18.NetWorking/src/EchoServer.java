import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

//Server : 정보를 응답(Response, 제공)
//TCP : 오류검사 수행, 속도는 느리지만 신뢰성이 높다.
public class EchoServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			//ServerSocket 생성 : Port 번호를 할당
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			
			//Socket 생성 : 클라이언트의 접속정보가 들어있는 Socket
			//Socket socket = new Socket();	//Client 측에서 Socket 생성하는 방법
			socket = ss.accept();	//Server 측에서 Socket 생성하는 방법
			
			//클라이언트에서 서버로 보낸 메세지를 수신(입력)받기 위한 준비단계 : 입력스트림
			InputStream is = socket.getInputStream();	//socket으로부터 기본 입력스트림을 가져온다.
			InputStreamReader isr = new InputStreamReader(is);	//문자형 자료(유니코드) 입력
			BufferedReader br = new BufferedReader(isr);	//버퍼를 활용
			
			//클라이언트의 접속정보를 가져오자.
			InetAddress addr = socket.getInetAddress();
			String ip = addr.getHostAddress();	//IP주소
			String name = addr.getHostName();	//컴퓨터 이름
			
			//클라이언트가 보낸 메세지를 수신받아 화면에 출력하자
			String msg = br.readLine();
			System.out.println("클라이언트 IP주소 : " + ip + ", 컴퓨터이름 : " + name);
			System.out.println("클라이언트로부터 받은 메세지 : " + msg);
			
			//다시 클라이언트에게 받은 메세지를 송신(출력)하자 : 출력스트림
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			pw.println(msg);
			pw.flush();
			
			//스트림 종료
			pw.close();
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EchoServer Exception!!!");
		} finally {
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//try		
	}//main()
}//class

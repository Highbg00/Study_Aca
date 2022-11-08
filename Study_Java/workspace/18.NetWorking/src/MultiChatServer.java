import java.net.ServerSocket;
import java.net.Socket;

public class MultiChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			ss = new ServerSocket(9999);	//포트번호 할당
			System.out.println("서버가 구동중입니다.");
			
			//다수의 클라이언트가 서버에 접속 → 클라이언트의 개수만큼 Socket 생성
			while(true) {
				socket = ss.accept();
				Thread pt = new MultiChatPersonThread(socket);
				pt.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatServer Exception!!!");
		} /*finally {
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
	}//main()
}//class

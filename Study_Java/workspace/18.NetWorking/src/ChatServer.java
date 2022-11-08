import java.net.ServerSocket;
import java.net.Socket;

public class ChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			ss = new ServerSocket(9999);
			System.out.println("서버가 구동중입니다.");
			socket = ss.accept();
			
			//보내준 메세지를 받는 작업(수신) : ReceiverThread(받는 Thread)
			Thread rt = new ChatReceiverThread(socket);
			rt.start();
			
			//메세지를 입력받아 송신(출력)하는 작업 : SenderThread(보내는 Thread)
			Thread st = new ChatSenderThread(socket);
			st.start();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Chat Server Exception!!!");
		} finally {
			try {
				//socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//main()
}//class

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

//받는 Thread : 메세지를 수신(입력스트림) ▶ BufferedReader Stream
public class ChatReceiverThread extends Thread{
	private Socket socket;
	public ChatReceiverThread(Socket socket) {
		this.socket= socket;
	}

	@Override
	public void run() {
		try {
			//입력스트림
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			//전송한 메세지를 수신(입력)받아 화면에 출력
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					//System.out.println("종료되었습니다.");
					break;
				}
				System.out.println("수신메세지 > " + msg);
			}
			
			//스트림종료
			br.close();
		} catch (Exception e) {
			if(e.getMessage().equalsIgnoreCase("Socket Closed")) {
				System.out.println("종료되었습니다.");
				System.exit(0);	//프로그램 종료
			}
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
}//class

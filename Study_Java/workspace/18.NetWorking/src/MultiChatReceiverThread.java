import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class MultiChatReceiverThread extends Thread{
	private Socket socket;
	public MultiChatReceiverThread(Socket socket) {
		this.socket = socket;
	}

	@Override
	public void run() {
		try {
			//입력스트림 생성
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			//서버에서 보낸 메세지를 수신받아 화면에 출력
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					break;
				}
				System.out.println(msg);
			}
			
			//스트림종료
			br.close();
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("MultiChatReceiverThread Exception!!!");
			System.out.println("종료되었습니다.");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
}//class

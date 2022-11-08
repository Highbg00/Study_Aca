import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

//보내는 Thread : 메세지를 송신(출력스트림) ▶ PrintWriter Stream
public class ChatSenderThread extends Thread{
	private Socket socket;
	public ChatSenderThread(Socket socket) {
		this.socket = socket;
	}

	@Override
	public void run() {
		try {
			//출력스트림
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			
			//메세지를 입력받아 송신(출력)
			Scanner scanner = new Scanner(System.in);
			while(true) {
				//System.out.print("메세지 입력 : ");
				String msg = scanner.nextLine();
				if(msg.equals("bye")) {
					System.out.println("종료되었습니다.");
					break;
				}
				pw.println(msg);
				pw.flush();
			}
			
			//스트림종료
			scanner.close();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Chat SenderThread Exception!!!");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
}//class

import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class MultiChatSenderThread extends Thread{
	private Socket socket;
	private String name;
	private Scanner scanner;
	public MultiChatSenderThread(Socket socket, String name, Scanner scanner) {
		this.socket = socket;
		this.name = name;
		this.scanner = scanner;
	}

	@Override
	public void run() {
		try {
			//출력스트림 생성하고 대화명을 송신(출력)
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			pw.println(name);
			pw.flush();
			
			//키보드에서 메세지를 입력받아 송신(출력)			
			while(true) {
				String msg = scanner.nextLine();
				if(msg.equals("bye")) {
					break;
				}
				pw.println(msg);
				pw.flush();
			}
			
			//스트림 종료
			scanner.close();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MultiChatSenderThread Exception!!!");
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
}//class

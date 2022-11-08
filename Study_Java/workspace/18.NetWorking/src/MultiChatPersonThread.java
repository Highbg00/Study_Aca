import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;

public class MultiChatPersonThread extends Thread{
	//접속된 다수의 클라이언트를 제어하기 위한 쓰레드
	//모든 클라이언트의 접속정보(Socket)를 저장하고,
	//접속된 클라이언트에게 메세지를 전송(출력 : PrintWriter)할 수 있도록
	//클라이언트의 목록을 저장할 컬렉션(무한배열)을 만들자 : ArrayList<>
	//MultiChatServer Class의 main() 메소드와 같이 동작 : static
	static ArrayList<PrintWriter> list = new ArrayList<>();
	private PrintWriter pw;
	private Socket socket;
	public MultiChatPersonThread(Socket socket) {
		this.socket = socket;
		try {
			OutputStream os = socket.getOutputStream();
			pw = new PrintWriter(os);
			list.add(pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		String name = null;
		String comName = null;
		try {
			//입력스트림 생성
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			//클라이언트에서 처음에 보내준 메세지(대화명)을 받아서
			//접속된 다른 클라이언트(list) 화면에 출력 : sendAll() 메소드
			//접속한 클라이언트의 컴퓨터 이름을 가져와서 출력
			name = br.readLine();
			InetAddress addr = socket.getInetAddress();
			comName = addr.getHostName();
			sendAll("#" + name + "(" + comName + ")님이 입장하셨습니다.");
			//#홍길동(202-xx)님이 입장하셨습니다.
			
			//클라이언트가 입력한 메세지(대화내용)를 받아서
			//접속된 클라이언트(list) 화면에 출력 : sendAll()
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					break;
				}
				sendAll(name + "(" + comName +") : " + msg);	//홍길동(202-xx) : 안녕
			}
		} catch (Exception e) {
			//e.printStackTrace();
			//System.out.println("MultiChatPersonThread Exception!!!");
		} finally {
			try {
				list.remove(pw);
				sendAll("#" + name + "(" + comName + ")님이 퇴장하셨습니다.");
				//#홍길동(202-xx)님이 퇴장하셨습니다.
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//run()
	
	//접속된 클라이언트(list) 화면에 메세지 출력
	public void sendAll(String msg) {
		for (PrintWriter pw : list) {
			pw.println(msg);
			pw.flush();
		}
	}//sendAll()
}//class

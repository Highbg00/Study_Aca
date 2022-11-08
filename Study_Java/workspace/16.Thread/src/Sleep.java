public class Sleep extends Thread{
	private int num;
	public Sleep(int num) {
		this.num = num;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			System.out.print(num + ", ");
			try {
				sleep(1000);	//1000ms : 1초
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}//for
	}//run()	
}//class

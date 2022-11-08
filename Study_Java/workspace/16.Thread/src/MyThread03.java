public class MyThread03 extends Thread{	//Thread Class 상속
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			System.out.println(getName() + "[" + i + "]");	//Thread Name[i]
		}//for
	}//run()
}//class

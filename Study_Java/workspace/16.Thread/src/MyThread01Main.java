public class MyThread01Main {
	public static void main(String[] args) {
		//객체생성
		MyThread01 thread01 = new MyThread01();
		MyThread02 thread02 = new MyThread02();
		
		//run() 메소드 호출
		//thread01.run();	//1 ~ 30 출력
		//thread02.run();	//a ~ z 출력
		
		//run() 메소드를 동시에 실행 ▶ start() 실행
		thread01.start();
		thread02.start();
		
	}//main()
}//class

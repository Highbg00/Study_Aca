//Thread(쓰레드) : 동시작업 ▶ Thread Class 상속받아 구현
public class MyThread01 extends Thread{
	//1 ~ 30 출력하는 코드 : run() 메소드에서 재정의(Override)
	@Override
	public void run() {
		for(int i = 1; i <= 30; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	}//run()	
}//class

//중첩클래스 : 하나의 *.java 파일에 2개 이상의 클래스를 구현
class MyThread02 extends Thread {	//Thread Class 상속
	//a ~ z 출력하는 코드 : run() 메소드에서 재정의(Override)
	@Override
	public void run() {
		for(char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	}//run()
}//class

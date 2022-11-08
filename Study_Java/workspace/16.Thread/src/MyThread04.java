//자바에서는 다중상속이 불가능
//이미 다른 클래스를 상속받은 상태에서는 Thread Class 상속 불가능 ▶ Thread 구현할 수 없다.
//이러한 문제점을 해결하기 위해 Runnable Interface 제공 ▶ 재정의(Override)가 필수
public class MyThread04 implements Runnable{
	@Override
	public void run() {
		for(int i = 1; i <= 30; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	}
}//class

class MyThread05 implements Runnable{
	@Override
	public void run() {
		for(char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	}
}//class
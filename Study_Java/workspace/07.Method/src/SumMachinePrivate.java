import java.util.Scanner;

public class SumMachinePrivate {
	//시작값(startNum)과 종료값(endNum)을 입력받은 후
	//startNum과 endNum을 매개변수로 전달하는 makeSum() 메소드를 호출하고 결과를 추력
	//단, makeSum() 메소드는 SumMachine.java, SumMachineReturn.java 클래스를 활용
	public static void main(String[] args) {
		//입력
		Scanner scanner = new Scanner(System.in); 
		System.out.print("시작값을 입력하세요 : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("종료값을 입력하세요 : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		//SumMachine.java 활용
		//makeSum() 메소드에 static 있다 : 클래스명.static메소드명(); ▶ SumMachine.makeSum();
		//makeSum() 메소드에 static 없다 : 객체를 생성하여 메소드를 호출
		//SumMachine.makeSum(startNum, endNum);	//오류 : makeSum() 메소드에 static 없다
		SumMachine sm = new SumMachine();	//SumMachine 객체 생성
		sm.makeSum(startNum, endNum);	//makeSum() 메소드 호출
		//public ~~ makeSum(){} : 덥근제어가 public 선언 ▶ 외부에서도 사용 가능
		
		//SumMachineReturn.java 활용
		SumMachineReturn smr = new SumMachineReturn();	//SumMachineReturn 객체 생성
		//System.out.println(smr.makeSum(startNum, endNum));	//메소드 호출 : 오류 → 접근제어자
		//private ~~ makeSum(){} : 접근제어자가 private 선언 ▶ 내부에서만 사용 가능 : 정보은닉
	}//main()
}//class

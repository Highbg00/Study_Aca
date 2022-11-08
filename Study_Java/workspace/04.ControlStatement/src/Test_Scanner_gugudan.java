import java.util.Scanner;

public class Test_Scanner_gugudan {
	public static void main(String[] args) {
		//출력하고 싶은 구구단의 단수(danNumber)를 입력받은 후,
		//입력받은 단수의 구구단 값을 출력하시오 ▶ Scanner(입력), 구구단 출력(for)
		//단, 입력받은 구구단의 단수는 2단부터 9단까지만 입력받으며, ▶ if
		//다른 구구단의 단수가 입력되면 오류메세지를 출력하고 재입력받아 구구단을 출력 ▶ while, continue, break
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("출력하고 싶은 구구단의 단수를 입력하세요 : ");
			int danNumber = scanner.nextInt();
			
			if(danNumber < 2 || danNumber > 9) {
				//오류메세지
				System.out.println("입력하신 구구단의 단수가 잘못 입력되었습니다."); 
				System.out.println("2부터 9사이의 단수를 입력하세요!");
				continue;
			}else {
				//구구단출력
				System.out.println(danNumber + "단을 출력합니다.");
				for(int i = 1; i <= 9; i++) {
					if(danNumber * i < 10) {
						System.out.println(danNumber + " * " + i + " = 0" + (danNumber * i));
					}else {
						System.out.println(danNumber + " * " + i + " = " + (danNumber * i));
					}//if
				}//for
				break;
			}//if			
		}//while
		scanner.close();
	}//main()
}//class

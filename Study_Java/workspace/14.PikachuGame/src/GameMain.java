import java.util.Scanner;

public class GameMain {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("원하는 캐릭터를 선택하세요!");
		System.out.print("1.피카츄\t2.이상해씨\t3.꼬부기 ▶ ");
		
		Character character = null;
		int menu = Integer.parseInt(scanner.nextLine());
		if(menu == 1) {
			character = new Pikachu();	//객체의 업캐스팅
		}else if(menu == 2) {
			character = new Lee();
		}else if(menu == 3) {
			character = new Gobook();
		}else {
			System.out.println("잘못 선택하셨습니다!");
			scanner.close();
			return;
		}
		
		SubMenu subMenu = new SubMenu(scanner);
		subMenu.playGame(character);
		scanner.close();
	}//main()
}//class

import java.util.Scanner;

import com.hanul.member.MemberInput;

public class MemberMain {
	public static void display() {
		System.out.println();
		System.out.println("=====회원관리=====");		
		System.out.println("회원정보 등록 : I");
		System.out.println("회원정보 삭제 : D");
		System.out.println("회원정보 수정 : U");
		System.out.println("회원목록 검색 : S");
		System.out.println("회원이름 검색 : N");
		System.out.println("회원주소 검색 : A");
		System.out.println("전화번호 검색 : T");
		System.out.println("회원관리 종료 : E");
		System.out.println("==================");
	}//display()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		MemberInput input = new MemberInput(scanner);
		while(true) {			
			display();
			System.out.print("메뉴를 입력하세요 : ");
			String menu = scanner.nextLine();
			if(menu.equalsIgnoreCase("i")) {
				//회원정보 등록하는 서브화면 호출
				input.insertInput();
			}else if(menu.equalsIgnoreCase("d")) {
				//회원정보 삭제하는 서브화면 호출
				input.deleteInput();
			}else if(menu.equalsIgnoreCase("u")) {
				//회원정보 수정하는 서브화면 호출
				input.updateInput();
			}else if(menu.equalsIgnoreCase("s")) {
				//전체회원 목록을 검색하는 서브화면 호출
				input.getAllListMember();
			}else if(menu.equalsIgnoreCase("n")) {
				//이름을 검색하는 서브화면 호출
				input.nameInput();
			}else if(menu.equalsIgnoreCase("a")) {
				//주소를 검색하는 서브화면 호출
				input.addrInput();
			}else if(menu.equalsIgnoreCase("t")) {
				//전화번호를 검색하는 서브화면 호출
				input.telInput();
			}else if(menu.equalsIgnoreCase("E")) {
				//프로그램 종료하는 코드 구현
				System.out.print("정말 종료 하시겠습니까?(Y/N) : ");
				String exit = scanner.nextLine();
				if(exit.equalsIgnoreCase("y")) {
					System.out.println("회원관리 프로그램을 종료합니다.");
					System.exit(0);	//프로그램을 종료하고 메모리에서 관련 프로세스를 제거
					break;
				}else if(exit.equalsIgnoreCase("n")) {
					continue;
				}else {
					System.out.println("잘못 입력하셨습니다!");
					continue;
				}//if
			}//if
		}//while
		//scanner.close();
	}//main()
}//class

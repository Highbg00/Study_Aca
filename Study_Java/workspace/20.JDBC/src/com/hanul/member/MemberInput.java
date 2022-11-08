package com.hanul.member;

import java.util.ArrayList;
import java.util.Scanner;

public class MemberInput {
	private Scanner scanner;
	public MemberInput(Scanner scanner) {
		this.scanner = scanner;
	}
	
	//회원정보 등록 서브화면
	public void insertInput() {
		while(true) {
			System.out.print("등록할 회원번호를 입력하세요 : ");
			int num = Integer.parseInt(scanner.nextLine());
			MemberDAO dao = new MemberDAO();
			boolean result = dao.checkNum(num);	//회원번호의 존재여부
			if(result) {	//회원번호가 존재 → 중복된 회원번호
				System.out.println(num + "번 회원번호가 존재합니다.");
				continue;
			}else {			//회원번호가 중복되지 않았다 → 세부내용을 입력받는다.
				System.out.print("이름을 입력하세요 : ");
				String name = scanner.nextLine();
				System.out.print("나이를 입력하세요 : ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print("주소를 입력하세요 : ");
				String addr = scanner.nextLine();
				System.out.print("전화번호를 입력하세요 : ");
				String tel = scanner.nextLine();
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.insertMember(dto);
				
				if(succ > 0) {
					System.out.println(num + "번 회원님의 정보가 등록 되었습니다.");
					//break;
				}else {
					System.out.println(num + "번 회원님의 정보가 등록 실패 되었습니다.");
					//break;
				}
				break;
			}//if
		}//while
	}//insertInput()
	
	//회원정보 삭제 서브화면
	public void deleteInput() {
		System.out.print("삭제할 회원번호를 입력하세요 : ");
		int num = Integer.parseInt(scanner.nextLine());
		MemberDAO dao = new MemberDAO();
		boolean result = dao.checkNum(num);	//회원번호의 존재여부
		if(result) {	//삭제할 번호가 존재
			while(true) {
				System.out.print("정말 삭제하시겠습니까?(Y/N) : ");
				String menu = scanner.nextLine();
				if(menu.equalsIgnoreCase("y")) {
					//삭제메소드 호출
					int succ = dao.deleteMember(num);
					if(succ > 0) {
						System.out.println(num + "번 회원정보가 삭제 되었습니다.");
					}else {
						System.out.println(num + "번 회원정보가 삭제 실패 되었습니다.");
					}					
					break;
				}else if(menu.equalsIgnoreCase("n")) {
					System.out.println("취소 되었습니다.");
					break;
				}else {
					System.out.println("잘못 입력하셨습니다.");
					continue;
				}//if
			}//while
		}else {			//삭제할 번호가 없다.
			System.out.println("입력하신 " + num + "번 회원정보가 존재하지 않습니다.");
		}//if		
	}//deleteInput()
	
	//회원정보 수정 서브화면 : 수정하고자 하는 회원정보를 검색(기본값 설정) 후 수정작업
	public void updateInput() {
		System.out.print("수정할 회원번호를 입력하세요 : ");
		int num = Integer.parseInt(scanner.nextLine());
		MemberDAO dao = new MemberDAO();
		boolean result = dao.checkNum(num);	//회원번호의 존재유무
		if(result) {	//수정할 회원정보가 존재
			MemberDTO dto = dao.getMember(num);	//수정할 회원정보를 검색
			
			System.out.print("수정할 회원의 이름을 입력하세요 : ");
			String name = scanner.nextLine();
			if(name.trim().equals("")) {	//수정하지 않고 Pass 했을 경우
				name = dto.getName();		//기본값 설정
			}
			
			int age = 0;
			try {
				System.out.print("수정할 회원의 나이를 입력하세요 : ");
				age = Integer.parseInt(scanner.nextLine());		
			} catch (Exception e) {			//수정하지 않고 Pass 했을 경우
				age = dto.getAge();
			}
			
			System.out.print("수정할 회원의 주소를 입력하세요 : ");
			String addr = scanner.nextLine();
			if(addr.trim().equals("")) {	//수정하지 않고 Pass 했을 경우
				addr = dto.getAddr();		//기본값 설정
			}
			
			System.out.print("수정할 회원의 전화번호를 입력하세요 : ");
			String tel = scanner.nextLine();
			if(tel.trim().equals("")) {
				tel = dto.getTel();
			}
			
			dto = new MemberDTO(num, name, age, addr, tel);
			int succ = dao.updateMember(dto);
			if(succ > 0) {
				System.out.println(num + "번 회원정보가 수정 되었습니다.");
			}else {
				System.out.println(num + "번 회원정보가 수정 실패 되었습니다.");
			}			
		}else {			//수정할 회원정보가 없다.
			System.out.println(num + "번 회원정보가 존재하지 않습니다.");
		}
	}//updateInput()
	
	//전체 회원 목록 검색 서브화면
	public void getAllListMember() {
		while(true) {
			System.out.print("회원 목록을 검색하시겠습니까?(Y/N) : ");
			String menu = scanner.nextLine();
			if(menu.equalsIgnoreCase("y")) {
				//회원목록 검색 메소드 호출
				//System.out.println("회원목록 검색");
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> list = dao.searchAllMember();
				dao.display(list);
				break;
			}else if(menu.equalsIgnoreCase("n")) {
				System.out.println("회원목록 검색을 취소하셨습니다.");
				break;
			}else {
				System.out.println("잘못 입력하셨습니다!");
				continue;
			}//if
		}//while		
	}//getAllListMember()
	
	//이름 검색 서브화면
	public void nameInput() {
		System.out.print("검색할 이름을 입력하세요 : ");
		String searchName = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchNameMember(searchName);
		dao.display(list);
	}//nameInput()

	//주소 검색 서브화면
	public void addrInput() {
		System.out.print("검색할 주소를 입력하세요 : ");
		String searchAddr = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchAddrMember(searchAddr);
		dao.display(list);		
	}//addrInput()
	
	//전화번호 검색 서브화면
	public void telInput() {
		System.out.print("검색할 전화번호를 입력하세요 : ");
		String searchTel = scanner.nextLine();
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.searchTelMember(searchTel);
		dao.display(list);
	}//telInput()

}//class

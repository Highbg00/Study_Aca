package com.hanul.member;

import java.util.ArrayList;

public class MemberDAO {

	//출력메소드
	public void display(ArrayList<MemberDTO> list) {
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		System.out.println("=====================================================");
	}//display()

	//나이의 오름차순 정렬
	public void ageAscSort(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getAge() > list.get(j).getAge()) {
					MemberDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}		
	}//ageAscSort()

	//이름의 내림차순 정렬
	public void nameDescSort(ArrayList<MemberDTO> list) {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				//if(list.get(i).getName() < list.get(j).getName()) : 오류 → 문자열은 compareTo() 비교
				if(list.get(i).getName().compareTo(list.get(j).getName()) < 0) {
					MemberDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}		
	}//nameDescSort()

}//class

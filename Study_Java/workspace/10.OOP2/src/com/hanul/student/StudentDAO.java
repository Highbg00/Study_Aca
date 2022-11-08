package com.hanul.student;

import java.text.DecimalFormat;

public class StudentDAO {
	//생성자 메소드 초기화
	private StudentDTO[] student;
	public StudentDAO(StudentDTO[] student) {
		this.student = student;
	}
	
	//총점계산
	public void getSum() {
		for (int i = 0; i < student.length; i++) {
			//double sum = student[i].getCpp() + student[i].getJava();
			//student[i].setSum(sum);
			student[i].setSum(student[i].getCpp() + student[i].getJava());
		}
	}//getSum()

	//평균계산
	public void getAvg() {
		for (int i = 0; i < student.length; i++) {
			//double avg = student[i].getSum() / 2;
			//student[i].setAvg(avg);
			student[i].setAvg(student[i].getSum() / 2);
		}
	}//getAvg()
	
	//평균의 내림차순 정렬
	public void avgDescSort() {
		for (int i = 0; i < student.length; i++) {
			for (int j = i + 1; j < student.length; j++) {
				if(student[i].getAvg() < student[j].getAvg()) {
					StudentDTO temp = student[i];
					student[i] = student[j];
					student[j] = temp;
				}
			}
		}
	}//avgDescSort()
	
	//출력 메소드
	public void display() {
		DecimalFormat df = new DecimalFormat("0.0");
		System.out.println("============================================================");
		System.out.println("이름\t학번\t\t학과\tCPP\tJAVA\t총점\t평균");
		System.out.println("============================================================");
		for (int i = 0; i < student.length; i++) {
			System.out.print(student[i].getName() + "\t");
			System.out.print(student[i].getNum() + "\t");
			System.out.print(student[i].getMajor() + "\t");
			System.out.print(df.format(student[i].getCpp()) + "\t");
			System.out.print(df.format(student[i].getJava()) + "\t");
			System.out.print(df.format(student[i].getSum()) + "\t");
			System.out.print(df.format(student[i].getAvg()) + "\n");
		}
		System.out.println("============================================================");
	}//display()
	
	//이름 오름차순 정렬
	public void nameAscSort() {
		for (int i = 0; i < student.length; i++) {
			for (int j = i + 1; j < student.length; j++) {
				if(student[i].getName().compareTo(student[j].getName()) > 0) {
					StudentDTO temp = student[i];
					student[i] = student[j];
					student[j] = temp;
				}
			}
		}
	}//nameAscSort()
}//class

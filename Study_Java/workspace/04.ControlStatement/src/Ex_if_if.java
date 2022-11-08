public class Ex_if_if {
	public static void main(String[] args) {
		//점수(score)가 0 이상이고 100 이하이면, 학점을 구하여 출력
		//그외의 점수가 입력되면 오류메세지를 출력
		int score = 78;
		if(score >= 0 && score <= 100) {
			//학점구하기
			if(score >= 90) {
				System.out.println("A학점");
			} else if(score >= 80) {
				System.out.println("B학점");
			} else if(score >= 70) {
				System.out.println("C학점");
			} else if(score >= 60) {
				System.out.println("D학점");
			} else {
				System.out.println("F학점");
			}//if
		}else {
			System.out.println("점수를 잘못 입력하셨습니다!");
		}//if
	}//main()
}//class

/*
★ 중첩 if문 : if문 안에 다른 if문이 있는 문장 ▶ 전제조건을 설정

if(조건식A){
	조건식A가 참일때 실행되는 문장;
	if(조건식1){
		조건식A를 만족한 상태에서 조건식1이 참일때 실행되는 문장;
	}else if(조건식2){
		조건식A를 만족한 상태에서 조건식2가 참일때 실행되는 문장;
	}//if
}else if(조건식B){
	조건식B가 참일때 실행되는 문장;
	if(조건식3){
		조건식B를 만족한 상태에서 조건식3이 참일때 실행되는 문장;
	}else if(조건식4){
		조건식B를 만족한 상태에서 조건식4가 참일때 실행되는 문장;
	}//if
}else{
	거짓일때 실행되는 문장
}//if
*/
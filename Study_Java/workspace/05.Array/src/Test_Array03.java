public class Test_Array03 {
	public static void main(String[] args) {
		/*
		○ 비정방형 배열을 이용한 별찍기 
			★
			★★
			★★★
			★★★★
			★★★★★
		*/
		
		int[][] star = new int[5][];	//5행짜리 비정방형 배열 생성
		/*star[0] = new int[1];			//index 0번째 행의 열을 생성(1열)
		star[1] = new int[2];			//index 1번째 행의 열을 생성(2열)
		star[2] = new int[3];			//index 2번째 행의 열을 생성(3열)
		star[3] = new int[4];			//index 3번째 행의 열을 생성(4열)
		star[4] = new int[5];			//index 4번째 행의 열을 생성(5열)*/
		for (int i = 0; i < star.length; i++) {
			//star[i] = new int[i + 1];
			star[i] = new int[star.length - i];
		}		
		
		//각각의 요소에 ★을 할당 후 출력
		for (int i = 0; i < star.length; i++) {				//행
			for (int j = 0; j < star[i].length; j++) {		//열
				star[i][j] = '★';
				System.out.print((char)star[i][j]);
			} //for j
			System.out.println();
		}	//for i
		
	}//main()
}//class

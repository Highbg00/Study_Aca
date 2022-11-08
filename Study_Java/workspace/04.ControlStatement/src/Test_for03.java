public class Test_for03 {
	public static void main(String[] args) {
		//1부터 100까지의 정수 중에서 3의 배수의 누적합(sum)과
		//3의 배수의 개수(cnt)를 출력하시오.
		int sum = 0;	//3의 배수의 누적합이 저장될 변수를 초기화
		int cnt = 0;	//3의 배수의 개수가 저장될 변수를 초기화
		
		for(int i = 1; i <= 100; i++) {	//1부터 100까지 1씩 증가하면서 반복
			if(i % 3 == 0) {			//3의 배수이면
				sum += i;				//누적합 계산
				cnt++;					//개수를 계산(1씩 증가)
			}//if
		}//for
		
		System.out.println("3의 배수의 누적합 : " + sum);
		System.out.println("3의 배수의 개수 : " + cnt);
		
		//1부터 100까지의 정수 중에서 3의 배수를 출력하시오.
		//단, 한줄에 5개의 값을 출력하시오.		
		int printCnt = 0;					//출력횟수를 저장할 변수를 초기화
		for(int i = 1; i <= 100; i++) {
			if(i % 3 == 0) {
				System.out.print(i + "\t");
				printCnt++;					//출력횟수를 1씩 증가
				if(printCnt % 5 == 0) {		//출력횟수가 5의 배수이면(5번 출력되면)
					System.out.println();	//줄바꿈(빈줄삽입)
				}//if
			}//if
		}//for		
	}//main()
}//class

public class Ex_for_for {
	public static void main(String[] args) {
		for(int i = 1; i <= 5; i++) {		//for i : 1부터 5까지 동작
			for(int j = 1; j <= i; j++) {	//for j : 1부터 i까지 동작
				System.out.println("i값 : " + i + ", j값 : " + j);
			}//for j
		}//for i
		
		/*
		 	★
			★★
			★★★
			★★★★
			★★★★★
		*/
		
		for(int i = 1; i <= 5; i++) {
			for(int j = 1; j <= i; j++) {
				System.out.print("★");
			}//for j
			System.out.println();
		}//for i
		
		for(int i = 5; i >= 1; i--) {
			for(int j = 5; j >= i; j--) {
				System.out.print("★");
			}//for j
			System.out.println();
		}//for i
	}//main()
}//class

/*
★ 중첩 반복문 : 반복문 내에 다른 반복문이 존재

for(초기값; 조건식; 증감값){
	for(초기값; 조건식, 증감값){
		실행문;
	}//안쪽 for
}//바깥쪽 for
*/
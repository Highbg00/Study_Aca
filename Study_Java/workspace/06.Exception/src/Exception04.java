public class Exception04 {
	public static void main(String[] args) {
		//1부터 100까지 누적합(sum)을 구하여 출력하시오 : for(반복)
		//단, 누적합이 777 이상이 되면, 계산을 중지하고 결과를 출력 : if(조건), break(중지)
		int sum = 0;
		for(int i = 1; i <= 100; i++) {
			sum += i;
			if(sum >= 777) {
				System.out.println("누적합이 777 이상이 되었습니다.");
				System.out.println("누적합 : " + sum + ", i : " + i);				
				break;
			}//if
		}//for
		
		System.out.println("=====================================");
		
		//1부터 100까지 누적합(total)을 구하여 출력하시오 : for(반복)
		//단, 누적합이 777 이상이 되면 계산을 중지하고 결과를 출력
		//단, try~catch 블럭을 이용하여 예외처리 하시오 ▶ throw
		//throw : 강제로 예외를 발생시켜 catch 블럭으로 예외를 던진다(넘긴다)
		try {
			int total = 0;
			for(int i = 1; i <= 100; i++) {
				total += i;
				if(total >= 777) {
					System.out.println("누적합 : " + total + ", i : " + i);
					throw new Exception("누적합이 777 이상이 되었습니다.");
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());	//예외메세지만 출력
			e.printStackTrace();	//예외를 상세하게 출력
		}//try
	}//main()
}//class

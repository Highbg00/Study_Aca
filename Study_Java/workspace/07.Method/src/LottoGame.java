import java.util.Arrays;
import java.util.Random;

public class LottoGame {
	public static void main(String[] args) {
		LottoGame game = new LottoGame();
		for(int i = 0; i < 5; i++){
			int[] lotto = game.getNumber();
			System.out.println(Arrays.toString(lotto));
		}//for
	}//main()
	
	//번호 생성 메소드 정의
	public int[] getNumber() {
		int[] lotto = new int[6];		//번호가 저장될 배열 선언 및 생성
		Random random = new Random();	//무작위로 번호를 생성하기 위한 Random 객체 생성
		for (int i = 0; i < lotto.length; i++) {
			lotto[i] = random.nextInt(45) + 1;	//1~45 범위내의 번호를 할당
			for (int j = 0; j < i; j++) {		//번호 중복검사
				if(lotto[i] == lotto[j]) {
					i = i - 1;	//i -= 1;
					break;
				}//if
			}//for
		}//for
		Arrays.sort(lotto);	//배열(lotto[])의 원소값을 오름차순으로 정렬
		return lotto;
	}//getNumber()
}//class

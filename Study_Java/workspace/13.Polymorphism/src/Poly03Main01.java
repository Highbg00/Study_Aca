import com.hanul.poly03.Radio;
import com.hanul.poly03.RemoCon;
import com.hanul.poly03.Tv;

public class Poly03Main01 {
	//ReomCon Interface로 Tv, Radio 소리를 올리고 내린후에 인터넷에 접속
	public static void main(String[] args) {
		//① UpCasting
		RemoCon remoCon = new Tv();
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
		
		remoCon = new Radio();
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
		System.out.println("========================");
		
		//② 다형성 인수
		Tv tv = new Tv();
		Radio radio = new Radio();
		
		Poly03Main01 main = new Poly03Main01();
		main.play(tv);
		main.play(radio);
		System.out.println("========================");
		
		//③ 다형성 배열
		RemoCon[] remoCons = {tv, radio};
		for (int i = 0; i < remoCons.length; i++) {
			remoCons[i].volUp();
			remoCons[i].volDown();
			remoCons[i].internet();
		}
	}//main()
	
	public void play(RemoCon remoCon) {
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();		
	}//play()
}//class

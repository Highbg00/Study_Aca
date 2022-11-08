//extends(상속) : 상위클래스인 Mouse 클래스를 하위클래스인 WheelMouse 클래스가 상속
public class WheelMouse extends Mouse{	//서브 클래스, 하위 클래스, 자식 클래스
	public void scroll() {
		System.out.println("스크롤 기능 추가");
	}//scroll()
}//class

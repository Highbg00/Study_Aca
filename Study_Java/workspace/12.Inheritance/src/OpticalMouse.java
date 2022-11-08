public class OpticalMouse extends WheelMouse{
	//상위클래스인 WheelMouse를 하위클래스 OpticalMouse가 상속
	//오버라이드(Override) : 하위클래스에서 상위클래스로부터 상속받은 메소드를 재정의(수정)
	
	@Override	//직접입력
	public void clickLeft() {
		System.out.println("광마우스 왼쪽 버튼 클릭");
	}//clickLeft()

	@Override	//Source MenuBar > Override/Implement Methods...
	public void clickRight() {
		System.out.println("광마우스 오른쪽 버튼 클릭");
	}//clickRight()
	
	@Override	//Ctrl + SpaceBar : 자동완성
	public void scroll() {
		System.out.println("광마우스 스크롤 기능");
	}//scroll()
}//class

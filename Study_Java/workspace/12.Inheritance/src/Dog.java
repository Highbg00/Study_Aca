public class Dog extends Animal{	//Animal Class 상속 : 서브클래스, 하위클래스, 자식클래스
	//디폴트 생성자 메소드
	public Dog() {}
	
	//생성자 메소드 초기화
	public Dog(String name, int age) {
		super(name, age);	//Animal Class의 생성자 메소드를 호출
	}
}

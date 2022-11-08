import com.hanul.poly02.Animal;
import com.hanul.poly02.Cat;
import com.hanul.poly02.Dog;

public class Poly02Main02 {
	public static void main(String[] args) {
		Dog dog = new Dog();	//일반적인 객체 생성
		Cat cat = new Cat();
		
		Poly02Main02 poly = new Poly02Main02();
		poly.display(dog);		//메소드 호출 : 실인수
		poly.display(cat);
	}//main()
	
	/*
	public void display(Dog dog) {	//메소드 정의 : 가인수 ▶ Dog → Animal		
	}//display()
	
	public void display(Cat cat) {	//메소드 정의 : 가인수 ▶ Cat → Animal
	}//display()
	*/
	
	public void display(Animal animal) {	//메소드 정의 : 가인수 ▶ 다형성 인수
		animal.cry();
		//animal.night();			//오류 : Animal 클래스에는 night() 메소드가 없다
		//((Cat)animal).night();	//DownCasting : 예외발생
		
		//Cat Class Type으로 인수값이 전달된 경우에만 night() 메소드가 동작 → Type 비교 : instanceof
		if(animal instanceof Cat) {	//instanceof : 타입(클래스)을 정확하게 비교한다
			((Cat)animal).night();			
		}//if		
	}//display()
	
}//class

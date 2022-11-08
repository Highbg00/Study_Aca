import com.hanul.poly01.Animal;
import com.hanul.poly01.Cat;
import com.hanul.poly01.Dog;

public class Poly01Main01 {
	//Dog 객체를 생성하고 cry() 메소드를 호출하시오.
	public static void main(String[] args) {
		//상황1 : Dog 클래스를 자신이 직접 만들었다.
		//Dog 클래스안에는 무슨 동작이 있고, 그 동작이 어떻게 구동 되는지 알고 있다.
		Dog dog = new Dog();	//객체생성 : 일반적인 방식으로 객체를 생성
		dog.cry();				//메소드 호출
		
		//상황2 : Dog 클래스를 다른 사람이 만들어서 나에게 주었다(Dog.class)
		//Dog 클래스안에 무슨 동작이 있고, 어떻게 구동 되는지 알 수가 없다.
		
		//상황3 : Dog 클래스와 Animal 클래스를 나에게 주었다.(Dog.class, Animal.class)
		//Animal 클래스가 상위클래스이고 cry() 메소드를 정의했고,
		//Dog 클래스가 하위클래스이면서 Animal 클래스를 상속받아
		//cry() 메소드를 재정의(Override) 했다고 알려줌
		//객체생성 : 업캐스팅(UpCasting) ▶ 부모클래스 쪽으로 객체를 생성 → 다형성이 발생
		Animal animal = new Dog(); 
		animal.cry();
		
		animal = new Cat();	//객체생성
		animal.cry();
		//animal.night();	//동작되지 않는다 : 부모클래스(Animal)를 night() 메소드가 없다.
		
		Cat cat = new Cat();
		cat.night();
	}//main()
}//class
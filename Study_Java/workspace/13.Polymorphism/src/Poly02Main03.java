import com.hanul.poly02.Animal;
import com.hanul.poly02.Cat;
import com.hanul.poly02.Dog;

public class Poly02Main03 {
	public static void main(String[] args) {
		//Dog 객체와 Cat 객체를 생성 : 일반적인 방식
		Dog dog = new Dog();
		Cat cat = new Cat();
		
		//생성된 객체를 배열(animals[])에 초기화 하시오 ▶ 타입[] 식별자 = {~~, ~~};
		Animal[] animals = {dog, cat};	//다형성 배열
		
		//배열에 등록된 원소의 항목(원소값)의 메소드를 호출(동작)
		for (int i = 0; i < animals.length; i++) {
			animals[i].cry();
			if(animals[i] instanceof Cat) {
				((Cat)animals[i]).night();
			}//if
		}//for
	}//main()
}//class

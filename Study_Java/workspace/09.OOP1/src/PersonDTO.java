public class PersonDTO {
	//① 멤버변수 선언 ▶ 정보은닉 : private
	private String name;	//이름
	private int age;		//나이
	private double height;	//키
	private double weight;	//체중
	private char gender;	//성별
	
	//② 디폴트 생성자 메소드 : 빈깡통
	public PersonDTO() {}

	//③ 생성자 메소드 초기화 : 자동완성
	public PersonDTO(String name, int age, double height, double weight, char gender) {
		super();
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
	}

	//④ Getters & Setters 메소드 : 자동완성
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
}

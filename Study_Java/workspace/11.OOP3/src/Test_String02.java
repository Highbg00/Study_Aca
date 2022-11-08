import java.util.Arrays;

public class Test_String02 {
	//TAB("\t")을 기준으로 문자열을 분리하고 리턴하는 메소드를 호출 : strSplit()
	//리턴받은 배열(String[] fruit)을 출력하는 메소드를 호출 : display()
	//배열(fruit[])에 저장된 원소값(과일명)을 내림차순으로 정렬하는 메소드를 호출 : nameDescSort()
	public static void main(String[] args) {
		String str = "바나나\t키위\t복숭아\t사과\t파인애플";
		//String[] fruit = str.split("\t");
		//System.out.println("과일명 : " + Arrays.toString(fruit));
		
		Test_String02 test = new Test_String02();
		String[] fruit = test.strSplit(str);
		test.display(fruit);
		test.display(test.strSplit(str));	//연쇄
		test.nameDescSort(fruit);
		test.display(fruit);		
	}//main()
	
	//문자열을 분리하고 리턴하는 메소드를 정의
	public String[] strSplit(String str) {
		//String[] fruit = str.split("\t");
		//return fruit;
		return str.split("\t");
	}//strSplit()
	
	//출력메소드를 정의
	public void display(String[] fruit) {
		System.out.println("과일명 : " + Arrays.toString(fruit));
	}//display()
	
	//과일명의 내림차순으로 정렬하는 메소드를 정의
	public void nameDescSort(String[] fruit) {
		for (int i = 0; i < fruit.length; i++) {
			for (int j = i + 1; j < fruit.length; j++) {
				//if(fruit[i] < fruit[j]) ▶ 오류 : 문자열은 비교연산자를 사용할 수 없다
				if(fruit[i].compareTo(fruit[j]) < 0) {	//내림차순
					String temp = fruit[i];
					fruit[i] = fruit[j];
					fruit[j] = temp;
				}//if
			}//for j
		}//for i
	}//nameDescSort()
}//class

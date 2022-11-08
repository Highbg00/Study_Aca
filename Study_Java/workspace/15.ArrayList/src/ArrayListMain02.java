import java.util.ArrayList;

import com.hanul.array.Test;

public class ArrayListMain02 {
	public static void main(String[] args) {
		//ArrayList<> 객체 생성(list1<>) → Object : 모든 객체(클래스)
		ArrayList<Object> list1 = new ArrayList<Object>();
		list1.add(new Integer(100));	//Element(요소)는 반드시 객체 타입(클래스 타입)
		list1.add(new String("Apple"));
		list1.add(new Test());
		
		for (int i = 0; i < list1.size(); i++) {
			Object object = list1.get(i);	//list1의 i번째 index 값을 가져온다 ▶ Object Type
			
			if(object instanceof Integer) {				//object의 타입이 Integer 타입이면
				System.out.println((Integer)object);	//Integer 타입으로 Casting후 출력
			}else if(object instanceof String) {		//object의 타입이 String 타입이면
				System.out.println((String)object);		//String 탕입으로 Casting후 출력
			}else if(object instanceof Test) {			//object의 타입이 Test 타입이면
				((Test)object).display();				//Test 타입으로 Casting후 메소드 호출
			}
		}
		
		System.out.println("===========================");
		
		//ArrayList<> 객체 생성(list2<>) : 특정 클래스(Test.java)만 저장하기 위해 타입제한
		ArrayList<Test> list2 = new ArrayList<>();
		list2.add(new Test());
		//list2.add(new Integer(100));	//오류
		
		list2.get(0).display();
	}//main()
}//class

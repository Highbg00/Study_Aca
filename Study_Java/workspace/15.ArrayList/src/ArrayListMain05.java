import java.util.ArrayList;

public class ArrayListMain05 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<>();
		
		list.add(new String("AAA"));	//정상적인 구현방식
		list.add("BBB");				//AutoBoxing
		list.add("CCC");
		System.out.println(list);
		
		list.add(1, "DDD");	//index 위치에 값이 저장되고, 기존값은 뒤로 이동된다.
		System.out.println(list);
		
		list.set(1, "EEE");	//index 위치값이 수정
		System.out.println(list);
		
		list.remove(1);		//index 위치값이 삭제되면서, 뒷쪽의 값이 앞으로 이동된다.
		System.out.println(list);
		
		list.removeAll(list);	//list의 전체값이 삭제
		System.out.println(list);
	}
}

import java.util.Arrays;

public class Ex_String01 {
	//String Class : 문자열을 조작하기 위한 기능을 담고 있는 클래스
	//SunMicroSystem(Oracle) 업체에서 미리서 제작하여 제공 ▶ API(Library)
	//JRE System Library > rt.jar > java.lang > String.class
	//API문서(설명서) > www.oracle.com > Java API Documents
	//https://docs.oracle.com/javase/8/docs/api
	
	public static void main(String[] args) {
		String str1 = "apple";				//apple 문자열을 str1 변수에 할당
		String str2 = new String("APPLE");	//APPLE 문자열을 str2 객체에 할당
		
		System.out.println("str1 : " + str1);
		System.out.println("str2 : " + str2);
		
		//length() : 문자열의 길이
		System.out.println("str1의 길이 : " + str1.length());
		
		//toUpperCase() : 대문자로 변경
		System.out.println("str1을 대문자로 변경 : " + str1.toUpperCase());
		
		//toLowerCase() : 소문자로 변경
		System.out.println("str2를 소문자로 변경 : " + str2.toLowerCase());
		
		//substring() : 특정 문자 추출
		System.out.println("문자열 추출1 : " + str1.substring(1));	//index 1부터 끝까지 추출
		System.out.println("문자열 추출2 : " + str1.substring(1, 3));	//index 1부터 3의 앞까지 추출
		
		//charAt() : 문자열에서 특정 문자 한 글자만 추출
		System.out.println("문자열 추출3 : " + str2.charAt(3));	//index에 위치한 문자 추출
		System.out.println("문자열 추출4 : " + str2.substring(3, 4));	//index 3부터 4의 앞까지 추출
		
		//indexOf() : 특정 문자의 존재여부 ▶ 존재 : index 값을 반환, 실패 : -1
		System.out.println("문자열의 위치1 : " + str2.indexOf("L"));	//출력값 : 3 → index 3에 위치
		System.out.println("문자열의 위치2 : " + str2.indexOf("B"));	//출력값 : -1 → 존재하지 않는다.
		
		//split() : 문자열을 분리 ▶ 결과는 String[] 리턴
		String[] sp1 = str1.split("");
		System.out.println("문자열 분리1 : " + Arrays.toString(sp1));
		
		String str3 = "가나@다라@마바";
		String[] sp2 = str3.split("@");
		System.out.println("문자열 분리2 : " + Arrays.toString(sp2));
		
		//replace() : 문자열 치환(찾아 바꾸기)
		System.out.println("문자열 치환1 : " + str2.replace("P", "@@"));	//P → @@
		System.out.println("문자열 치환2 : " + str2.replace("PP", "@@"));	//PP → @@
		
		//trim() : 좌우 공백 제거
		String str4 = "   abc   def   ";
		System.out.println("str4 : " + str4);
		System.out.println("str4.trim() : " + str4.trim());
		System.out.println("공백 제거 전 문자열의 길이 : " + str4.length());
		System.out.println("공백 제거 후 문자열의 길이 : " + str4.trim().length());
	}//main()
}//class

public class Test_String01 {
	//주어진 문자형 숫자(str)의 각 자릿수를 분리하여, 합계(sum)를 구하시오.
	//예 : "12345" → 1 + 2 + 3 + 4 + 5 ▶ 15
	public static void main(String[] args) {
		String str = "12345";
		
		//split(), for, Integer.parseInt()
		String[] strs = str.split("");
		int sum = 0;
		for (int i = 0; i < strs.length; i++) {
			sum += Integer.parseInt(strs[i]);
		}
		
		//charAt(), for, length()
		int result = 0;
		for (int i = 0; i < str.length(); i++) {
			result += str.charAt(i) - '0';	//ASCII Code 참조
		}
		
		System.out.println("문자열 : " + str);
		System.out.println("자릿수 합계 : " + sum);
		System.out.println("자릿수 합계 : " + result);
	}//main()
}//class

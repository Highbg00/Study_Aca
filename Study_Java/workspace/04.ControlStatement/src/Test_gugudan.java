public class Test_gugudan {
	public static void main(String[] args) {
		//반복문(for, while, do~while)을 이용하여 구구단을 출력하는 프로그램
		int i = 0, j = 0;	//반복변수 i와 j를 초기화
		
		//①-1 : for 가로
		System.out.println("for 가로");
		for(i = 2; i <= 9; i++) {
			for(j = 1; j <= 9; j++) {
				if(i*j < 10) {
					System.out.print(i + "X" + j + "=0" + (i*j) + "\t");
				}else {
					System.out.print(i + "X" + j + "=" + (i*j) + "\t");
				}//if
			}//for j
			System.out.println();
		}//for i
		
		System.out.println();
		
		//①-2 : for 세로
		System.out.println("for 세로");
		for(i = 1; i <= 9; i++) {
			for(j = 2; j <= 9; j++) {
				if(i*j < 10) {
					System.out.print(j + "X" + i + "=0" + (i*j) + "\t");
				}else {
					System.out.print(j + "X" + i + "=" + (i*j) + "\t");
				}//if
			}//for j
			System.out.println();
		}//for i
		
		System.out.println();
		
		//②-1 : while 가로
		System.out.println("while 가로");
		i = 2;
		while(i <= 9) {
			j = 1;
			while(j <= 9) {
				if(i*j < 10) {
					System.out.print(i + "X" + j + "=0" + (i*j) + "\t");
				}else {
					System.out.print(i + "X" + j + "=" + (i*j) + "\t");
				}//if
				j++;
			}//while j
			System.out.println();
			i++;
		}//while i
		
		System.out.println();
		
		//②-2 : while 세로
		System.out.println("while 세로");
		i = 1;
		while(i <= 9) {
			j = 2;
			while(j <= 9) {
				if(i*j < 10) {
					System.out.print(j + "X" + i + "=0" + (i*j) + "\t");
				}else {
					System.out.print(j + "X" + i + "=" + (i*j) + "\t");
				}//if				
				j++;
			}//while j
			System.out.println();
			i++;
		}//while i		
		
		System.out.println();
		
		//③-1 : do~while 가로
		System.out.println("do~while 가로");
		i = 2;
		do {
			j = 1;
			do {
				if(i*j < 10) {
					System.out.print(i + "X" + j + "=0" + (i*j) + "\t");
				}else {
					System.out.print(i + "X" + j + "=" + (i*j) + "\t");
				}//if
				j++;
			}while(j <= 9);
			System.out.println();
			i++;
		}while(i <= 9);		
		
		System.out.println();
		
		//③-2 : do~while 세로
		System.out.println("do~while 세로");
		i = 1;
		do {
			j = 2;
			do {
				if(i*j < 10) {
					System.out.print(j + "X" + i + "=0" + (i*j) + "\t");
				}else {
					System.out.print(j + "X" + i + "=" + (i*j) + "\t");
				}//if	
				j++;
			}while(j <= 9);		
			System.out.println();
			i++;
		}while(i <= 9);
		
	}//main()
}//class

import java.util.Scanner;

public class Ex_BinSearch {
	public static void main(String[] args) {
		//이진검색(Binary Search) : low, middle, high 값을 사용
		//찾고자 하는 데이터를 중앙에 위치한 중간값과 비교하는 방법
		//데이터 목록은 반드시 사전에 오름차순으로 정렬되어 있어야 한다(전제조건)
		int[] arr = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};	//오름차순으로 정렬된 데이터 목록
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("찾는 수를 입력하세요 : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		Ex_BinSearch search = new Ex_BinSearch();
		int index = search.binSearch(arr, searchData);
		if(index == -1) {
			System.out.println("찾는 수는 " + searchData + "이며, 검색에 실패했습니다.");
		}else {
			System.out.println("찾는 수는 " + searchData + "이며, " + index + "번째에 있습니다.");
		}//if
		
	}//main()

	//이진검색 메소드
	public int binSearch(int[] arr, int searchData) {
		int index = -1;
		int low = 0, middle = 0, high = arr.length - 1;
		while(low <= high) {
			middle = (low + high) / 2;		//중간값이 저장된 배열의 index
			if(arr[middle] == searchData) {	//성공 : 검색완료
				index = middle + 1;
				break;
			}else if(arr[middle] < searchData) {
				low = middle + 1;	//low 포인터 변경 : 중간값을 기준으로 왼쪽 부분을 제외
			}else {
				high = middle - 1;	//high 포인터 변경 : 중간값을 기준으로 오른쪽 부분을 제외
			}//if
		}//while
		return index;
	}//binSearch()	
	
}//class

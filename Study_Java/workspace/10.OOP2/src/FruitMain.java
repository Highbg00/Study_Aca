import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class FruitMain {
	public static void main(String[] args) {
		//객체배열을 선언 및 생성하고 값을 할당
		FruitDTO[] fruit = new FruitDTO[5];
		fruit[0] = new FruitDTO("망고", 5000, 10);
		fruit[1] = new FruitDTO("귤", 4500, 10);
		fruit[2] = new FruitDTO("사과", 2000, 10);
		
		FruitDTO dto1 = new FruitDTO();
		dto1.setName("멜론");
		dto1.setCost(8000);
		dto1.setQty(10);
		fruit[3] = dto1;
		
		FruitDTO dto2 = new FruitDTO();
		dto2.setName("딸기");
		dto2.setCost(9900);
		dto2.setQty(3);
		fruit[4] = dto2;
		
		//FruitDAO 객체 생성 시 객체배열(fruit[])을 매개변수로 전달
		FruitDAO dao = new FruitDAO(fruit);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
	}//main()
}//class

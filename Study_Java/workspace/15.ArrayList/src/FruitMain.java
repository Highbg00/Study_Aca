import java.util.ArrayList;

import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class FruitMain {
	public static void main(String[] args) {
		ArrayList<FruitDTO> list = new ArrayList<>();
		list.add(new FruitDTO("망고", 5000, 10));
		list.add(new FruitDTO("귤", 4500, 10));
		list.add(new FruitDTO("사과", 2000, 10));
		list.add(new FruitDTO("멜론", 800, 10));
		list.add(new FruitDTO("딸기", 19900, 9));
		
		FruitDAO dao = new FruitDAO(list);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
		dao.displayPrintf();
	}
}

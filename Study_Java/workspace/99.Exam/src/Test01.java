import java.util.Arrays;

public class Test01 extends Thread {
	public String getString() {
		return "";
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
	}

	public static void main(String[] args) {
		for (int i = 2; i < 10; i++) {
			for (int j = 1; j <= 9; j++) {
				System.out.printf("%d * %d = %2d \t", i, j, (j * i));
			}
			System.out.println();
		}
	}
}

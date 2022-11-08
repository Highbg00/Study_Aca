
public class CalcDAO {

	public double getResult(CalcDTO dto) {
		double result = 0;
		if(dto.getOpcode().equals("+")) {
			result = dto.getNum1() + dto.getNum2();
		}else if(dto.getOpcode().equals("-")) {
			result = dto.getNum1() - dto.getNum2();
		}else if(dto.getOpcode().equals("*")) {
			result = dto.getNum1() * dto.getNum2();
		}else {
			result = (double)dto.getNum1() / dto.getNum2();
		}
		return result;
	}//getResult()
	
}//class

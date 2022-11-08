import com.hanul.student.StudentDAO;
import com.hanul.student.StudentDTO;

public class StudentMain {
	public static void main(String[] args) {
		StudentDTO[] student = new StudentDTO[3];
		student[0] = new StudentDTO("홍길동", 20220101, "컴공과", 95.4, 90.3);
		student[1] = new StudentDTO("나길동", 20220103, "정통과", 80.7, 85.6);
		student[2] = new StudentDTO("김길동", 20220102, "전산과", 85, 97.8);
		
		StudentDAO dao = new StudentDAO(student);
		dao.getSum();
		dao.getAvg();
		dao.avgDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	}//main()
}//class

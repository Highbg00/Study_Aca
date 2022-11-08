import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import com.hanul.member.MemberDTO;

public class MemberCopyMain {
	//member.txt 파일에서 라인단위호 내용을 읽어서 ▶ FileReader, BufferedReader, readLine()
	//라인단위의 각항목은 TAB으로 구분되어 있다 ▶ split("\t");
	//MemberDTO 타입을 갖는 ArrayList<> 컬렉션 구조 ▶ ArrayList<MemberDTO> list;
	//list의 내용을 memberCopy02.txt 파일에 출력(저장) ▶ FileWriter, BufferedWriter, flush(), close()	
	public static void main(String[] args) {
		try {
			//파일 입력을 위한 준비단계
			String inputPath = "D:\\Study_Java\\workspace\\17.IO\\member.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			//열려진 파일의 내용을 읽어서 저장할 변수를 초기화
			//TAB으로 split()한 후, MemberDTO 객체 생성
			//ArrayList<MemberDTO> 컬렉션 생성 후 저장
			String line = null;
			MemberDTO dto = null;
			ArrayList<MemberDTO> list = new ArrayList<>();
			while((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				int num = Integer.parseInt(sp[0]);
				String name = sp[1];
				int age = Integer.parseInt(sp[2]);
				String addr = sp[3];
				String tel = sp[4];
				dto = new MemberDTO(num, name, age, addr, tel);
				list.add(dto);
			}
			
			//파일출력을 위한 준비단계
			String outputPath = "D:\\Study_Java\\workspace\\17.IO\\memberCopy02.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			//ArrayList<>의 저장된 내용을 파일에 출력
			int index = 0;
			for (MemberDTO i : list) {
				if(index < list.size() - 1) {	//줄바꿈 처리
					String result = i.getNum() + "\t" + i.getName() + "\t";
					result += i.getAge() + "\t" + i.getAddr() + "\t" + i.getTel() + "\n";
					bw.write(result);
					bw.flush();
					index++;
				}else {	//마지막 라인 : 줄바꿈 처리를 하지 않는다.
					String result = i.getNum() + "\t" + i.getName() + "\t";
					result += i.getAge() + "\t" + i.getAddr() + "\t" + i.getTel();
					bw.write(result);
					bw.flush();
					System.out.println("memberCopy02.txt 파일이 생성되었습니다.");
				}
			}
			
			//스트림 종료
			bw.close();
			fw.close();
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class

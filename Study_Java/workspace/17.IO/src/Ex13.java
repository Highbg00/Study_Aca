import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex13 {
	//member.txt 파일에서 라인단위(readLine())로 내용을 읽어서
	//memberCopy01.txt 파일에 출력(저장)
	//파일복사 : member.txt → memberCopy01.txt
	public static void main(String[] args) {
		try {
			//파일입력을 위한 준비단계 : FileReader, BufferedReader
			String inputPath = "D:\\Study_Java\\workspace\\17.IO\\member.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			//파일출력을 위한 준비단계 : FileWriter, BufferedWriter
			String outputPath = "D:\\Study_Java\\workspace\\17.IO\\memberCopy01.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			//열려진 파일의 내용을 읽어서(readLine()) 저장할 변수를 초기화
			String line = null;
			
			//파일의 내용을 읽고 파일에 출력(저장)하는 로직
			while((line = br.readLine()) != null) {
				bw.write(line);
				bw.newLine();	//bw.write("\n");	//줄바꿈
			}
			System.out.println("memberCopy01.txt 파일이 생성되었습니다.");
			
			//마지막 버퍼의 내용을 강제전송(flush())후 스트림 종료(close())
			bw.flush();
			bw.close();
			fw.close();
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class

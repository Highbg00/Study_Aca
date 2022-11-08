package com.hanul.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {

	// 기존 JDBC 모델에서는 Connection(연결 객체)을 먼저 만들었지만,
	// myBatis 경우 SqlSessionFactory 객체를 먼저 생성
	// SqlSessionFactory : DB 접속 → session 활성화 → Mapper.xml(SQL 문장 처리)
	
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "com/hanul/mybatis/SqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SqlSessionFactory Exception!!!");
		}
	}//초기화 블럭
	
	// DB에서 선택한 검색조건의 검색어에 해당하는 회원 목록 조회
	public List<MemberDTO> memberSearch(SearchDTO dto) {
		// session 활성화
		SqlSession session = sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("memberSearch", dto);
		session.close();  // session 종료
		return list;
	}
	
	
	// DB에서 해당 ID의 회원 정보 수정
	public int memberUpdate(MemberDTO dto) {
		// session 활성화
		SqlSession session = sqlMapper.openSession(true);
		int succ = 0;
		succ = session.update("memberUpdate", dto);
	//	session.commit();
		session.close();
		return succ;
	}
	
	
	// DB에서 해당 ID의 회원 정보 조회
	public MemberDTO memberDetail(String id) {
		// session 활성화
		SqlSession session = sqlMapper.openSession();
		MemberDTO dto = null;
		dto = session.selectOne("memberDetail", id);
		session.close(); // session 종료
		return dto;
	}
	
	
	// 해당 ID의 회원 정보 삭제
	public int memberDelete(String id) {
		// session 활성화
		SqlSession session = sqlMapper.openSession();
		int succ = 0;	// 성공 여부 확인하기 위한 변수
		succ = session.delete("memberDelete", id);
		session.commit();  	// 커밋
		session.close(); 	// session 종료
		return succ;
	}
	
	// 회원 가입 처리 메소드
	public int memberInsert(MemberDTO dto) {
		// SqlSessionFactory(sqlMapper) 에서 SqlSession(session) 활성화
		SqlSession session = sqlMapper.openSession();	// session 활성화
		
		int succ = 0;		// 성공 여부 판단에 사용할 변수
		
		// insert 작업(SQL 문장 작성) ▶ memberMapper.xml 
		succ = session.insert("memberInsert", dto);
		session.commit();	// 커밋처리
		session.close();	// session 종료
		
		return succ;
	}
	
	// 전체 회원 목록 조회
	public List<MemberDTO> memberSearchAll() {
		// session 활성화
		SqlSession session = sqlMapper.openSession();
		
		List<MemberDTO> list = null;
		// session.selectOne(null);	조회결과가 1개 인 경우
		list = session.selectList("memberSearchAll");	// 조회결과가 여러개 인 경우
		session.close(); // session 종료
		return list;
	}
	
	
	
}















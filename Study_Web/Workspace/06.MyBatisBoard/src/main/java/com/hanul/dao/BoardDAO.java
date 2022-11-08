package com.hanul.dao;

import java.io.InputStream;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.BoardDTO;
import com.hanul.dto.SearchDTO;

public class BoardDAO {
	
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
	
	// DB에서 전체 게시글 조회 처리
	public List<BoardDTO> boardList() {
		// session 활성화
		SqlSession session = sqlMapper.openSession();		
		List<BoardDTO> list = null;
		list = session.selectList("boardList");
		session.close();
		return list;
	}
	
	// DB에 사용자가 입력한 게시글 저장(insert) 처리
	public int boardInsert(BoardDTO dto) {
		// session 활성화
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("boardInsert", dto);
		session.commit();
		session.close();
		return succ;
	}
	
	// 해당 게시글의 조회수 증가
	public void boardCount(int num) {
		SqlSession session = sqlMapper.openSession(true);
	//	int succ =0;
		session.update("boardCount", num);
	//	session.commit();
		session.close();		
	}
	
	// 해당 게시글의 상세 정보 조회
	public BoardDTO boardDetail(int num) {
		SqlSession session = sqlMapper.openSession();
		BoardDTO dto = null;
		dto = session.selectOne("boardDetail", num);
		session.close();
		return dto;
	}
	
	// 해당 게시글 삭제 처리
	public void boardDelete(int num) {
		SqlSession session = sqlMapper.openSession();
		
		session.delete("boardDelete", num);
		session.commit();
		session.close();
	}
	
	// 해당 게시글 정보 수정 처리
	public void boardUpdate(BoardDTO dto) {
		SqlSession session = sqlMapper.openSession();
		session.update("boardUpdate", dto);
		session.commit();
		session.close();
	}
	
	// 글 목록에서 검색 조건과 검색어 에 맞는 글 조회
	public List<BoardDTO> boardSearch(SearchDTO dto) {
		SqlSession session = sqlMapper.openSession();
		// 몇 개의 값이 검색될 지 모르기에 List<> 컬렉션 사용
		List<BoardDTO> list = null;
		list = session.selectList("boardSearch", dto);
		session.close();
		return list;
	}
	
}


















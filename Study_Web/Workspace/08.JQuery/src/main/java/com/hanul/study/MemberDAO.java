package com.hanul.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MemberDAO {

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
	
	
	// DB에서 전체회원 목록을 검색한 후 JSON 구조로 리턴
	public String memberList01() {
		SqlSession session = sqlMapper.openSession(true);
		List<MemberDTO> list = null;
		list = session.selectList("memberList01");
		session.close();

		JSONArray array = new JSONArray();
		JSONObject object = new JSONObject();
		for ( MemberDTO dto : list ) {
			object = new JSONObject();
			object.put("member", dto);
			array.add(object);
		}
		
		String json = array.toString();
		
		return json;
	}
	
	
	// DB에서 전체회원 목록을 검색한 후 JSON 구조로 리턴 2
	public String memberList02() {
		SqlSession session = sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("memberList01");
		session.close();
		
		JSONArray array = JSONArray.fromObject(list);
		String json = array.toString();
		return json;
	}
	
	
	
}












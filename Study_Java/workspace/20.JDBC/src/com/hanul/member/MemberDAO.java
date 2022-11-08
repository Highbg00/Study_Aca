package com.hanul.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {	//실제 DB와 연동하여 요구사항(트랜젝션) 처리후 결과를 리턴
	private Connection conn;		//연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs;			//결과객체(select)
	
	//DB접속 메소드
	public Connection getConn() {
		try {
			String user = "hanul";
			String password = "0000";
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!!");
		}
		return conn;
	}//getConn()	
	
	//DB종료 메소드 : 접속(conn) → SQL문장 전송(ps) → 결과(rs)
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose Exception!!!");
		}
	}//dbClose()
	
	
	//전체회원 목록검색 메소드 : select
	public ArrayList<MemberDTO> searchAllMember() {
		conn = getConn();	//DB접속(연결)
		String sql = "select * from tblMember order by num asc";	//SQL Query 작성
		ArrayList<MemberDTO> list = new ArrayList<>();	//최종결과
		try {
			ps = conn.prepareStatement(sql);	//SQL 문장 전송
			rs = ps.executeQuery();	//문장을 실행 후 결과객체
			while(rs.next()) {
				/*int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);*/
				
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAllMember() Exception!!!");
		} finally {
			dbClose();	//DB접속 해제
		}
		return list;
	}//searchAllMember()

	//출력메소드
	public void display(ArrayList<MemberDTO> list) {
		if(list.size() == 0) {
			System.out.println("검색결과가 없습니다.");
		}else {
			for (MemberDTO dto : list) {
				System.out.print(dto.getNum() + "\t");
				System.out.print(dto.getName() + "\t");
				System.out.print(dto.getAge() + "\t");
				System.out.print(dto.getAddr() + "\t");
				System.out.print(dto.getTel() + "\n");
			}
		}
	}//display()
	
	//번호 검색 메소드 : select
	public boolean checkNum(int num) {
		conn = getConn();	//DB접속
		String sql = "select * from tblMember where num = ?";	//SQL Query 작성
		boolean result = false;	//최종결과를 저장할 변수
		try {
			ps = conn.prepareStatement(sql);	//SQL 문장 전송
			ps.setInt(1, num);					//매개변수 값을 세팅
			rs = ps.executeQuery();				//문장을 실행 후 결과객체
			if(rs.next()) {		//검색결과가 있다.
				result = true;
			}else {				//검색결과가 없다.
				result = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkNum() Exception!!!");
		}finally {
			dbClose();	//DB접속 해제
		}
		return result;
	}//checkNum()
	
	//삭제 메소드 : delete
	public int deleteMember(int num) {
		conn = getConn();	//DB접속
		String sql = "delete from tblMember where num = ?";	//SQL 문장 작성
		int succ = 0;		//최종결과를 저장할 변수		
		try {
			ps = conn.prepareStatement(sql);	//SQL 문장 전송
			ps.setInt(1, num);					//매개변수 값을 세팅
			succ = ps.executeUpdate();			//문장을 실행			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember() Exception!!!");
		} finally {
			dbClose();	//DB접속 해제
		}
		return succ;
	}//deleteMember()
	
	//회원정보 등록 메소드 : insert
	public int insertMember(MemberDTO dto) {
		conn = getConn();	//DB접속
		String sql = "insert into tblMember(num, name, age, addr, tel) ";	//SQL 문장 작성
		sql += "values(?, ?, ?, ?, ?)";
		int succ = 0;		//최종결과가 저장될 변수
		try {
			ps = conn.prepareStatement(sql);	//SQL 문장 전송
			ps.setInt(1, dto.getNum());			//매개변수 값을 세팅
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			succ = ps.executeUpdate();			//SQL 문장 실행(동작)
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertMember() Exception!!!");
		} finally {
			dbClose();		//DB접속 해제
		}
		return succ;
	}//insertMember()
	
	//1명의 회원정보를 검색 : select
	public MemberDTO getMember(int num) {
		conn = getConn();
		String sql = "select * from tblMember where num = ?";
		MemberDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				dto = new MemberDTO(num, name, age, addr, tel);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMember() Exception!!!");
		} finally {
			dbClose();
		}
		return dto;
	}//getMember()
	
	//회원정보 수정 : update
	public int updateMember(MemberDTO dto) {
		conn = getConn();
		String sql = "update tblMember set name = ?, age = ?, addr = ?, tel = ? ";
		sql += "where num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setInt(2, dto.getAge());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setInt(5, dto.getNum());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateMember() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	}//updateMember()
	
	//이름 검색 : select ▶ like : 포함하는 데이터를 검색
	public ArrayList<MemberDTO> searchNameMember(String searchName) {
		conn = getConn();
		String sql = "select * from tblMember ";
		sql += "where upper(name) like upper(?) order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchName + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchNameMember() Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	}//searchNameMember()
	
	//주소검색 : select ▶ like
	public ArrayList<MemberDTO> searchAddrMember(String searchAddr) {
		conn = getConn();
		String sql = "select * from tblMember ";
		sql += "where upper(addr) like upper(?) order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchAddr + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAddrMember() Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	}//searchAddrMember()
	
	//전화번호 검색 : select ▶ like
	public ArrayList<MemberDTO> searchTelMember(String searchTel) {
		conn = getConn();
		String sql = "select * from tblMember ";
		sql += "where upper(tel) like upper(?) order by num asc";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchTel + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setTel(rs.getString("tel"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchTelMember() Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	}//searchTelMember()
	
	
	
}//class

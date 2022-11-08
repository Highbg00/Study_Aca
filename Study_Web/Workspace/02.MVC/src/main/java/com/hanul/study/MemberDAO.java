package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {

	private Connection conn; 		// 연결 객체
	private PreparedStatement ps; 	// 전송 객체
	private ResultSet rs; 			// 결과 객체
	
	// DB 접속 메소드 : ojdbc11.jar ▶ WEB-INF > lib 붙여넣기(등록)
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!");
		}
		return conn;
	} 
	
	// DB 접속 해제(종료) 메소드
	public void dbClose() {
		try {
			if (rs != null)	rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!");
		}
	}
	
	// 회원 가입 처리 메소드
	public int insertMember(MemberDTO dto) {
		// DB 접속
		conn = getConn();
		String sql = "insert into w_member values (?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPw());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getTel());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertMember() Exception!!");
		} finally {
			dbClose();  	// DB 접속 해제(종료)
		}
		return succ;
	}
	
	// DB(w_member)에서 전체 회원 목록 검색
	public ArrayList<MemberDTO> searchAllMember() {
		conn = getConn();
		String sql = "select * from w_member";
		ArrayList<MemberDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while ( rs.next() ) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SearchAllMember() Exception!!");
		} finally {
			dbClose();
		}
		return list;
	}

	// DB에서 전달받은 id에 해당하는 회원 정보 삭제 메소드
	public int deleteMember(String id) {
		conn = getConn();
		String sql = "delete from w_member where id = ?";
		int succ = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember() Exception!!");
		} finally {
			dbClose();
		}
		return succ;
	}
	
	
}












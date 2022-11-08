package com.and.mid;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;

import member.MemberDAO;
import member.MemberVO;


@Controller
public class MemberController {
	//멤버컨트롤러에 login이라는 맵핑 만들고 크롬에 연결하고 콘솔에 찍어보기
	@Autowired Common common;
	@Autowired MemberDAO dao;
	Gson gson = new Gson();
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(HttpServletRequest req) {
		MemberVO vo = new MemberVO();
		
		vo.setId(req.getParameter("id"));
		vo.setPw(req.getParameter("pw"));
	 	vo =  dao.login(vo);
		return gson.toJson(vo);
	}
	
	@ResponseBody
	@RequestMapping(value ="/file.f", produces = "application/json;charset=UTF-8")
	public String fileTest(HttpServletRequest req, HttpSession ss) {
		MemberVO vo= new MemberVO(); 
		String server_path = "";
		MultipartRequest mreq = (MultipartRequest) req;
		MultipartFile file = mreq.getFile("file");
		if(file != null) {
			System.out.println("파일이 들어왔습니다.");
			System.out.println(file.getOriginalFilename());
			server_path
			= "http://" +req.getLocalAddr() + ":" + req.getLocalPort()
			+ req.getContextPath() + "/resources/" + common.fileUpload("and", file, ss); 
		}
		System.out.println(server_path);
		vo.setId(req.getParameter("id"));
		vo.setPw(req.getParameter("pw"));
		vo.setName(req.getParameter("name"));
		vo.setImg_path(server_path);
		dao.join(vo);
		return "adfad";
		
	}
	
}

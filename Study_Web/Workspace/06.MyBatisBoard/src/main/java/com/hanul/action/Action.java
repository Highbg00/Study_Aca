package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 실제 처리할 비지니스 로직에서 구현할 메소드 정의
	public abstract ActionForward execute(HttpServletRequest request
			, HttpServletResponse response) throws IOException, ServletException;
}

package com.hanul.action;

public class ActionForward {
	// 페이지 전환과 관련된 정보를 갖고 있는 클래스
	// 동적 또는 정적 페이지 전환 정보 가짐
	private String path;		// View Page(*.jsp)의 경로와 파일명
	private boolean isRedirect;	// 페이지 전환 방식 ▶ true : sendRedirect()
								//					▶ false : forward()
	
	// getter & setter 생성
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}

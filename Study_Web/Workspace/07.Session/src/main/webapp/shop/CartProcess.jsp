<%@page import="com.hanul.cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String price = request.getParameter("price");

	// 몇 개의 상품이 들어올지 모르기에 ArrayList<> 를 사용
	// 또한 여러 항목의 값을 담아야 하므로 DTO를 생성
	ArrayList<CartDTO> cart = null;
	Object obj = session.getAttribute("cart");	// 세션 객체에서 cart 값을 가져옴
	
	// 세션 정보 유무 : 없다면... 최초 주문 ▶ cart list 생성
	if ( obj == null ) {
		cart = new ArrayList<CartDTO>();
	} else {	// 있다면 ... 추가 주문 ▶ obj 의 값을 cart list 타입으로 캐스팅(받는다)
		cart = (ArrayList<CartDTO>) obj;
	}
	
	// cart 에 등록된 제품 존재 유무
	int pos = -1;	// 등록된 제품이 없다.
	
	// 장바구니 세션(cart)에 등록된 제품이 있을 경우 : 수량 (cnt) 증가
	for( CartDTO dto : cart ) {
		if ( dto.getName().equals(name) ) {
			pos = 1;	// 등록된 제품이 있음 pos 에 1을 할당
			dto.setCnt(dto.getCnt() + 1);
			break;
		}
	}
	
	/* JAVA (일반 for문)  */
// 	for (int i = 0; i < cart.size(); i++ ) {
// 		if ( cart.get(i).getName().equals(name) ) {
// 			pos = 1;
// 			cart.get(i).setCnt(cart.get(i).getCnt() + 1);
// 			break;
// 		}
// 	}
	
	// 장바구니 세션(cart)에 등록된 제품이 없다면... CartDTO 객체를 생성하여 
	// dto에 값을 담은 후 list에 등록(추가)
	if ( pos == -1 ) {	// 등록된 제품이 없다면...
		CartDTO dto = new CartDTO();
		dto.setName(name);
		dto.setPrice( Integer.parseInt(price.replace(",", "")) );  // 1,500 → 1500 (치환)
		dto.setCnt(1);
		cart.add(dto);
	}
	
	// cart 세션 객체를 갱신 : 장바구니 내용이 변경될 때마다 세션 갱신
	session.setAttribute("cart", cart);	
%>

<script>
	alert("장바구니에 담았습니다.");
	location.href='ShopMain.jsp';
</script>

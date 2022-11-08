$(document).ready(function() {
	
	var refreshInterval = null;
	var time = null;
	var imgCnt = $(".slider_panel").children().length;
	var imgIdx = 1; //3초 보여주고 setInterval로 3초후에 2번째 보여주려고 
	
	
	
	function moveSlider(index) {
		//이동할 변수 선언
		var willMoveLeft = -1000 * index;
		//slider_panel 이동
		$(".slider_panel").animate({
			left: willMoveLeft //세미콜론 없음
			
		},"slow");//animate는 객체씀
		
		//slider_text 이동
		$(".slider_text[data-index=" + index +"]").show("fast").animate({
			left: 0 //세미콜론없음 객체니깐 
		},"slow");
		
		$(".slider_text[data-index!=" + index +"]").show("fast").animate({
			left: -300 //세미콜론없음 객체니깐 
		},"slow");
		
		//control_button클릭시 올라오기
		$(".control_button[data-index=" + index + "]").addClass("active");
		$(".control_button[data-index!=" + index + "]").removeClass("active");
		
	}//moveSlider
	
	timer = function() {
		
		moveSlider(imgIdx);
		
		if (imgIdx < imgCnt-1) { //0부터 시작하니깐 -1 붙여서 1부터 시작하게
			imgIdx++;
			
		} else {
			imgIdx = 0; //0으로 초기화
		}
		
	}//timer
	
	//켄버스에 올려놨을때 정지 후 켄버스 나왔을때 다시 실행
	$(".animation_canvas").on({
		"mouseenter" : function() {
			clearInterval(refreshInterval);
		},
		
		"mouseleave" : function() {
			refreshInterval = setInterval(timer,3000);
		}
		
	});//mouseenter
	
	
	
	
	
	//컨트롤버튼의 클릭 리스너 지정 및 data-index 할당
	$(".control_button").each(function(index) {
		$(this).attr("data-index",index);
	}).click(function() {
		var index = $(this).attr("data-index");
		imgIdx = index; //반드시 필요, 내가 클릭한 index번호를 3초마다 돌리는 imgIdx 변수값으로 전달
										//랜덤하게 클릭했을때 다음 그림으로 이동
		//그림 및 텍스트 불러오기 : moveSlider()함수
		moveSlider(index);
		
	});

	
	//초기 텍스트 위치지정 및 data-index 할당
	$(".slider_text").css("left",-300).each(function(index) {
		$(this).attr("data-index",index);//data가 들어가면 사용자 정의
	});//each
	
	//초기 0번째 인덱스 텍스트 가져오기 및 컨트롤 버튼 설정 
	$(".slider_text[data-index=" + 0 +"]").show("fast").animate({
		left: 0 //세미콜론없음 객체니깐 
	},"slow");
	
	$(".control_button[data-index=" + 0 + "]").addClass("active");
	
	//3초마다 자동으로 움직이는 timer 함수 호출
	refreshInterval = setInterval(timer,3000);
	
	
	
});
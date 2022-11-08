$(document).ready(function() {
	var check = 0;
	var imgCnt = $(".slider_panel").children().length;
	var imgIdx = 1;
	var refreshInterval = null;
	var timer = null;
	
	//moveSlider 함수
	function moveSlider(index) {
		//그림 불러오기
		var willMoveLeft = -(index * 1000);
		$(".slider_panel").animate({
			left : willMoveLeft //세미콜론 없음
		}, "slow");

		//텍스트 가져오기
		$(".slider_text[data-index=" + index + "]").show("fast").animate({
			left : 0 	//세미콜론 없음
		});

		$(".slider_text[data-index!=" + index + "]").hide("fast").animate({
			left : -500
		});
		
		//controll버튼 active하기
		$(".control_button[data-index=" + index + "]").addClass("active");

		$(".control_button[data-index!=" + index + "]").removeClass("active");
	}//moveSlider
	
	//timer 함수로 돌리기 위해서
	timer = function() {
		moveSlider(imgIdx);
		if(check == 1){
			if (imgIdx > 0) {
				imgIdx--;
			} else {
				imgIdx++;
				check = 0;
			}//if
		}else{
			if (imgIdx < imgCnt - 1) {
				imgIdx++;
			} else {
				imgIdx--;
				check = 1;
			}//if
		}//if
	}; //timer
	
	//canvas에 올려놨을 때 그림 정지
	$(".animation_canvas").on({
		"mouseenter": function() {
			clearInterval(refreshInterval);
		},
		"mouseleave": function() {
			refreshInterval = setInterval(timer, 3000);
		}
	});
	
	//controll_button data-index 할당, 슬라이더 그림 불러오기
	$(".control_button").each(function(index) {
		$(this).attr("data-index", index);	
	}).click(function() {
		var index = $(this).attr("data-index");
		imgIdx = index; //내가 클릭한 index번호를 3초마다 돌리는 imgIdx로 전달
		//해당 인덱스에 대한 그림 및 텍스트 불러오기
		moveSlider(index);
	});//control_button each click
	
	//초기 텍스트 위치 지정 및 data-index 할당
	$(".slider_text").css("left", -500).each(function(index) {
		$(this).attr("data-index", index); //data-index라는 이름으로 index 할당
	});//slider_text each

	//초기 0번째 텍스트 가져오기
	$(".slider_text[data-index=" + 0 + "]").show("fast").animate({
		left: 0 //세미콜론 없음
	}, "slow");
	
	//초기 0번째 controll_button을 active로 설정
	$(".control_button[data-index=" + 0 + "]").addClass("active");
	moveSlider(0);
	
	//3초마다 자동으로 움직이는 timer함수 호출
	refreshInterval = setInterval(timer, 3000);
	
	$("#login").click(function() {
		location.href = "login.html";
	})//login click
	
	$("#sign_Up").click(function() {
		location.href = "signup.html";
	})
});
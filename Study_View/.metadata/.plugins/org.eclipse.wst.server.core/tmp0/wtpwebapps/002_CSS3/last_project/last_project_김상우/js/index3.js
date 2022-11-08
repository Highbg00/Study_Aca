$(document).ready(function() {
//***main**********************************************************************************************************		
		var refreshInterval = null;
		var timer = null;
		var imgCnt = $(".slider_panel").children().length;
		var imgIdx = 1;	//처음에 3초 보여주고 setInterval로 3초 후에 2번째 보여주려고
		
		function moveSlider(index) {
			//이동할 변수 선언
			var willMoveLeft = -1000 * index
			
			//slider-panel 이동
			$(".slider_panel").animate({
				left : willMoveLeft			
			},"slow");//animate
			
			//slider_text 이동
			$(".slider_text[data-index=" + index + "]").show("fast").animate({
				left : 0								
			},"slow");//slider-text animate

			$(".slider_text[data-index!=" + index + "]").hide("fast").animate({
				left : -300								
			},"slow");//slider-text animate
			
			//control_button 클릭시 올라오기
			$(".icon[data-index=" + index + "]").addClass("active");

			$(".icon[data-index!=" + index + "]").removeClass("active");
			
		}//moveSlider

		timer = function() {
			moveSlider(imgIdx);
			if (imgIdx < imgCnt - 1) {
				imgIdx++;
			} else {
				imgIdx = 0;
			}//if
		}//timer
		
		//캔버스에 올려놨을때 정지 후 다시 실행
		$(".animation_canvas").on({
			"mouseenter" : function() {
				clearInterval(refreshInterval);					
			},
			"mouseleave" : function() {
				refreshInterval = setInterval(timer,3000);
			}
		});//on
		
		
		
		
		//컨트롤버튼의 클릭 리스너 지정 및 data-index 할당		
		$(".icon").each(function(index) {
			$(this).attr("data-index", index);//attr
		}).click(function() {
			var index = $(this).attr("data-index");//click 변수 설정
			imgIdx = index; //반드시 필요 내가 클릭한 index번호를 3초마다 돌리는 imgIdx 변수값으로 전달
											//랜덤하게 클릭했을때 다음 그림으로 이동
			//그림 및 텍스트 불러오기 : moveSlider()함수
			moveSlider(index);//moveSlider
		
		});//click	

		
		
		//초기 테스트 위치 지점 및 date-index 할당
		$(".slider_text").css("left", -300).each(function(index) {
			$(this).attr("data-index", index);//attr
		});//each		
		
		
		//초기 0번째 인덱스 텍스트 가져오기 및 컨트롤 버튼 설정 
		
		$(".slider_text[data-index=" + 0 + "]").show("fast").animate({
			left : 0								
		},"slow");//slider-text animate

		//초기 0번째 인덱스 텍스트 가져오기 및 0번째 인덱스 컨트롤 버튼 설정
		$(".icon[data-index=" + 0 + "]").addClass("active");
		
		
		//3초마다 자동으로 움직이는 timer 함수 호출
		refreshInterval = setInterval(timer,3000);
		
//*****modal*************************************************************************************		
		window.onload = function() {

			function onClick() {
				document.querySelector('.modal_wrap').style.display = 'block';
				document.querySelector('.black_bg').style.display = 'block';
			}
			function offClick() {
				document.querySelector('.modal_wrap').style.display = 'none';
				document.querySelector('.black_bg').style.display = 'none';
			}

			document.getElementById('modal_btn').addEventListener('click', onClick);
			document.querySelector('.modal_close').addEventListener('click',offClick);

		};
//*****login***************************************************************************************	
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var idCheck;
		var idpwCheck;
		
		$("#loginBtn").click(function() {
			
			if (!$("#id").val()) {
				alert("아이디를 입력하세요");
				$("#id").focus();
				return false;
			}
			
			if (!$("#pw").val()) {
				alert("비밀번호를 입력하세요");
				$("#pw").focus();
				return false;
			}
			
			
			idCheck = false;
			
			$.ajax({
				
				url: "loginCheck.json", 
				dataType: "json",
				async: false, //동기적으로 통신
				success: function(result) {
					
					$(result).each(function(key, value) {
						
						if ($("#id").val() == (value.id) && $("#pw").val() == (value.pw)) {
							idCheck = true;
						}//if
						
					});//each
					
				} //succes
				
			}); //ajax
			
			if(idCheck == true) {
				alert($("#id").val() + "님 로그인 하셨습니다.");
				
				location.href="index3.html";
				return false;
				
			} else {
				alert("존재하지 않은 아이디이거나 패스워드를 잘못 입력하셨습니다.")
				$("#id").val("");
				$("#pw").val("");
				$("#id").focus();
				return false;
			}//if
			
			
		}); //loginBtn click
		
		$("#resetBtn").click(function() {
			
			var loginCancel = confirm("로그인을 취소하시겠습니까?");
			
			if (loginCancel == true) {
				alert("로그인이 취소 되었습니다. \n메인페이지로 이동합니다.");
				location.href = "index3.html";
				return false;
			} else {
				alert("로그인이 계속됩니다.");
				$("#id").focus();
				return false;
			}
			
		}); //resetBtn click
		
		$("#close").click(function() {
			
			var close = confirm("로그인을 취소하시겠습니까?");
			
			if (close == true) {
				alert("로그인이 취소 되었습니다. \n메인페이지로 이동합니다.");
				location.href = "index3.html";
				return false;
			} else {
				alert("로그인이 계속됩니다.");
				$("#id").focus();
				return false;
			}
			
		}); //close click
		
		$("#id").focus(function() {
			$("#id").attr("placeholder","");
		});//focus
		$("#id").blur(function() {
			$("#id").attr("placeholder","아이디(이메일)을 입력하세요");
			$("#idspan").html("");
		});//blur
		
		$("#pw").focus(function() {
			$("#pw").attr("placeholder","");
			
			if (!$("#id").val()) {
				$("#idspan").html("아이디(이메일)을 먼저 입력하셔야 합니다.").css("color","red");
				alert("아이디(이메일)을 먼저 입력하셔야 합니다.");
				$("#id").focus();
			} else {
				$("#idspan").html("");	
			}//if
			
		});//focus
		
		$("#pw").blur(function() {
			$("#pw").attr("placeholder","비밀번호를 입력하세요");
		});//blur
		

		$("#id").keyup(function() {
			
			idCheck = false;
			
			$.ajax({
				
				url: "loginCheck.json",
				dataType: "json",
				async: false,
				
				success: function(result) {
					$(result).each(function(key, value) {
						
						if ($("#id").val() == value.id) {
							idCheck = true;
						}
						
					});//each
					
				}//success
				
			});//ajax
			
			if(!$("#id").val()) {
				$("#idspan").html("");
			} else if (idCheck == true) {
				$("#idspan").html("사용 가능한 아이디입니다.").css("color","yellowgreen");
			} else {
				$("#idspan").html("사용 불가능한 아이디입니다.").css("color","red");
			}//if
			
		});//keyup
		
		$("#pw").keyup(function() {
			
			idpwCheck = false;
			
			$.ajax({
				
				url: "loginCheck.json",
				dataType: "json",
				async: false,
				
				success: function(result) {
					$(result).each(function(key, value) {
						
						if ($("#id").val() == value.id && $("#pw").val() == value.pw) {
							idpwCheck = true;
						}
						
					});//each
					
				}//success
				
			});//ajax
			
			if(!$("#pw").val()) {
				$("#pwspan").html("");
			} else if (idpwCheck == true) {
				$("#pwspan").html("사용 가능한 비밀번호니다.").css("color","yellowgreen");
			} else {
				$("#pwspan").html("사용 불가능한 비밀번호입니다.").css("color","red");
			}//if
			
		});//keyup

		//눈모양
		
		$("#nun").click(function() {
			
			$("input").toggleClass("active");
			
			if ($("input").hasClass("active")) {
				$("#nun").attr("class","fa fa-eye-slash fa-lg").prev().attr("type","text");
			} else {
				$("#nun").attr("class","fa fa-eye fa-lg").prev().attr("type","password");
			}
			
		});//click
		
		$("#eye").on({
			"mouseenter" : function() {
				$("#pw").attr("type","text");
				$("#eye").html("비번감추기");
			},
			"mouseleave" : function() {
				$("#pw").attr("type","password");
				$("#eye").html("비번보이기");
			}
			
			
		});//on
//********signup***************************************************************************************		
		
	});//ready
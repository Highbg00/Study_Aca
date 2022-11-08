$(document).ready(function() {
	var imgCnt = $(".left_slider").children().length;
	var imgIdx = 1;
	var refreshInterval = null;
	var timer = null;

	function moveSlider(index) {
		var willMoveLeft = -(index * 450);
		$(".left_slider").animate({
			left : willMoveLeft
		}, "slow");

		$(".control_button1[data-index=" + index + "]").addClass("active");
		$(".control_button1[data-index!=" + index + "]").removeClass("active");
	}

	timer = function() {
		moveSlider(imgIdx);

		if (imgIdx < imgCnt - 1) {
			imgIdx++;
		} else {
			imgIdx = 0;
		}
	};

	$(".animation_canvas1").on({
		mouseenter : function() {
			clearInterval(refreshInterval);
		},
		mouseleave : function() {
			refreshInterval = setInterval(timer, 3000);
		}

	});

	$(".control_button1").each(function(index) {
		$(this).attr("data-index", index);
	}).click(function() {
		var index = $(this).attr("data-index");
		imgIdx = index;
		moveSlider(index);
	});

	$(".control_button1[data-index=" + 0 + "]").addClass("active");

	refreshInterval = setInterval(timer, 3000);
	

}); //ready1

$(document).ready(function() {
	var imgCnt = $(".right_slider").children().length;
	var imgIdx = 1;
	var refreshInterval = null;
	var timer = null;

	function moveSlider(index) {
		var willMoveLeft = -(index * 450);
		$(".right_slider").animate({
			left : willMoveLeft
		}, "slow");

		$(".control_button2[data-index=" + index + "]").addClass("active");
		$(".control_button2[data-index!=" + index + "]").removeClass("active");
	}

	timer = function() {
		moveSlider(imgIdx);

		if (imgIdx < imgCnt - 1) {
			imgIdx++;
		} else {
			imgIdx = 0;
		}
	};

	$(".animation_canvas2").on({
		mouseenter : function() {
			clearInterval(refreshInterval);
		},
		mouseleave : function() {
			refreshInterval = setInterval(timer, 3000);
		}

	});

	$(".control_button2").each(function(index) {
		$(this).attr("data-index", index);
	}).click(function() {
		var index = $(this).attr("data-index");
		imgIdx = index;
		moveSlider(index);
	});

	$(".control_button2[data-index=" + 0 + "]").addClass("active");

	refreshInterval = setInterval(timer, 3000);
	
}); //ready2



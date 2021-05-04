$(document).ready(function(){
	
	//메인버튼 hover 이벤트
	$('.main_button').hover(function(){
		$(this).css("background-color", "#2b2b2b");
	}, function(){
		$(this).css("background-color", "#444444");
	});
	//서브버튼 hover 이벤트
	$('.sub_button').hover(function(){
		$(this).css("background-color", "#f6f6f6");
	},function(){
		$(this).css("background-color", "#ffffff");
	});
	//후기 문의 게시물 hover 이벤트
	$('.userPage_area').hover(function(){
		$(this).css("background-color", "#f6f6f6");
	},function(){
		$(this).css("background-color", "#ffffff");
	});	
	
	//후기 문의 게시물 클릭시 글 내용 출력
	$('#review_01_content').hide();
	$('#review_02_content').hide();
	
	$('#review_01').on('click', function(){
		$('#review_02_content').hide();
		
		$('#review_01_content').toggle();
	});
	$('#review_02').on('click', function(){
		$('#review_01_content').hide();
		
		$('#review_02_content').toggle();
	});
	
	
	//후기 문의 버튼 hover 이벤트
	$('.userPage_sub_button').hover(function(){
		$(this).css("background-color", "#f6f6f6");
	}, function(){
		$(this).css("background-color", "#ffffff");
	});
	$('.userPage_main_button').hover(function(){
		$(this).css("background-color", "#2b2b2b");
	}, function(){
		$(this).css("background-color", "#444444");
	});
	//후기 작성 페이지 띄우기
	$('#review_regist_btn').click(function(){
		window.open("/kokonutStationery/review/goods_review_register.do", "_blank", "width=605, height=600");
	});

});



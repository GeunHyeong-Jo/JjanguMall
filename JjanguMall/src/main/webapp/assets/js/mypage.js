// 공통
$('#close_btn_img').click(function(){
	window.close();
});



//mypage_review.jsp
$('.review_content').click(function(){
  $('.review').toggleClass('hide');
});
//class이름에 seq를 추가하거나 번호를 추가해야할 듯

$('#close_btn_img').click(function(){
  window.close();
});

$('#review_deleteBtn').click(function(){
  window.open('mypage_review_delete.html',
              '상품후기삭제',
              'width=500, height=280');
});

$('#review_modifyBtn').click(function(){
  window.open('mypage_review_modify.html',
              '상품후기수정',
              'width=560, height=630');
});


/* maypage_qna.jsp */
/*$('#qna_deleteBtn').click(function(){
  window.open('mypage_qna_delete.html',
              '상품문의삭제',
              'width=500, height=280');
});

$('#qna_modifyBtn').click(function(){
  window.open('mypage_qna_modify.html',
              '상품문의수정',
              'width=950, height=650');
});

$('#qna_replyBtn').click(function(){
  window.open('mypage_qna_reply.html',
              '상품문의답변',
              'width=950, height=650');
});*/

$(function(){ //비동기 문서가 실행되기 전에 로드 하는 것을 방지
	
	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});
	
	$(".selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
			var checkArr = new Array();
			
			// 체크된 체크박스의 갯수만큼 반복
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
			});
				
			$.ajax({
				url : "/shop/deleteCart",
				type : "post",
				data : { chbox : checkArr },
				success : function(result){
					
					if(result == 1) {												
						location.href = "/shop/cartList";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}	
	});

	$(".orderOpne_bnt").click(function(){
		$(".orderInfo").slideDown();  // $(".orderInfo")를 나타내고
		$(".orderOpne_bnt").slideUp();  // $(".orderOpne_bnt")를 숨김
	});	
	
	$(".cancel_btn").click(function(){
		$(".orderInfo").slideUp();  // $(".orderInfo")를 숨기고
		$(".orderOpne_bnt").slideDown();  // $(".orderOpne_bnt")를 나타냄
	});	

});
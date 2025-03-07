<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../include/header.jsp" />

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
<jsp:include page="../include/aside.jsp" />		
		</div>
<div class="col-md-9">

<div class="mt-5 pt-5">
<jsp:include page="../include/breadcrumbs.jsp"/>
</div>

<form role="form">
<input type="hidden" name="gdsNum" value="${view.gdsNum}"/>
<!-- 익스프레션 자바 표현식 el 익스프레션 랭귀지 -->
</form>

<div class="my-3">
<img src="${view.gdsImg}" class="img-thumbnail"/>
</div>

<div class="my-3">
	<label class="form-label fw-bold">상품명</label>
	<span class="mx-3">${view.gdsName}</span>
</div>

<div class="my-3">
	<label class="form-label fw-bold text-orange">단백질</label>
	<span class="mx-3 fw-bold text-orange">${view.gdsProtein}g</span>
</div>

<div class="my-3">
<label class="form-label fw-bold">가격</label>
<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}"/>원</span>
</div>

<div class="my-3">
<label class="form-label fw-bold">상품수량</label>
<span class="mx-3"><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}"/>개</span>
</div>

<c:if test="${view.gdsStock != 0 }">
<span class="fw-bold">구입 수량</span>
<div class="d-flex w-25">
<button type="button" class="plus btn btn-light">+</button>
<input type="number" class="numBox form-control text-center" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
 <button type="button" class="minus btn btn-light">-</button>
</div>
<input type="hidden" value="${view.gdsStock }"/>
<script src="/resources/js/stockBtn.js"></script>
</c:if>

<!-- 장바구니에 담기 -->
<div class="my-3">
<button type="button" class="addCart_btn btn btn-outline-success">
카트에 담기
</button>
<script src="/resources/js/cart.js"></script>
</div>
<c:if test="${view.gdsStock == 0 }">
<p>상품 수량이 부족합니다</p>
</c:if>

<div class="my-3">
<label class="form-label fw-bold">상품설명</label>
<span class="mx-3">${view.gdsDes}</span>
</div>

<div id="reply">
<c:if test="${member == null}">
	<p>상품평을 남기시려면 <a href="/member/signin">로그인</a>해주세요</p>
</c:if>

<c:if test="${member != null}"><!-- 로그인을 하면 댓글을 사용 -->
<section class="replyForm">
<!-- 히든으로 제품번호가 들어가야됨 -->
<form role="form" method="post" autocomplete="off">

<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
<!-- 댓글쓰기 -->
<div class="my-3">
<textarea name="repCon" id="repCon" class="form-control">상품평을 남겨주세요</textarea>
</div>

<div class="d-flex justify-content-end">
<button type="button" id="reply_btn" class="btn btn-outline-primary">
상품평쓰기
</button>
<script src="/resources/js/reply.js"></script>
</div>

</form>
</section>
</c:if>

<section class="replyList">
<ul class="list-group list-group-flush">

</ul>
<script>
replyList();//헤더에서 만들 함수 호출
</script>
<!-- 댓글 수정관련 스크립트 -->

</section>
</div>



	
		</div>
	</div>
</div>


<!-- 리플리에 수정창 탑재 -->
<div class="replyModal">

<div class="modalContent">

	<div class="">
	<textarea class="modal_repCon form-control" name="modal_repCon"></textarea>
	</div>

	<div class="d-flex justify-content-end my-2">
	<button type="button" class="modal_modify_btn btn btn-success mx-2">
	수정
	</button>
	<button type="button" class="modal_cancel btn btn-secondary">
	취소
	</button>
	</div>

</div>
<script src="/resources/js/replyDelete.js"></script>
<script src="/resources/js/replyEdit.js"></script>

<div class="modalBackground"></div><!-- 검정색 바탕에 투명도 80 -->
</div>













<jsp:include page="../include/footer.jsp" />
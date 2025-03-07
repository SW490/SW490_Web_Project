<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/header.jsp" flush="false"/>
<script>
alert("팝업창");
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
<jsp:include page="../include/aside.jsp" />		
		</div>
		<div class="col-md-9">
<h1 class="my-5">장바구니</h1>		
<ul class="list-group list-group-flush">
	<li class="list-group-item">
	<!-- 모두선택 -->
		<div class="allCheck">
			
			<div class="d-flex">
				<input type="checkbox" name="allCheck" id="allCheck" class="form-check"/>
				<label for="allCheck" class="form-label mx-2">모두 선택</label>
			</div>
			
			<div class="">
				<button 
				type="button" 
				class="selectDelete_btn btn btn-outline-danger btn-lg"
				>
				선택삭제
				</button>
			</div>
		
		</div>
	</li>
	
	<!-- 변수선언 -->
	<c:set var="sum" value="0"/>
	<c:forEach items="${cartList}" var="cartList">
	<li class="list-group-item">
		<div class="checkBox">
			<input 
			type="checkbox" 
			name="chBox" 
			class="chBox form-check"	
			data-cartNum="${cartList.cartNum}"
			/>	
		</div>

<div class="img-thumbnail">
	<img src="${cartList.gdsThumbImg }"/>
</div>
<pre>
상품명    ${cartList.gdsName}
개당 가격 <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}"/> 원
구입 수량  ${cartList.cartStock} 개
최종 가격 <fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}"/> 원  

</pre>
<div class="delete">
<button 
type="button" 
class="delete_${cartList.cartNum}_btn btn btn-outline-danger"
data-cartNum="${cartList.cartNum}"
>
삭제
</button>
</div>
</li>
<!-- 반복할때 마다 sum에 상품가격(gdsPrice) * 상품갯수(cartStock)만큼을 더함 -->
<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock) }"/>
</c:forEach>

<div class="my-3">
	<div class="sum my-3">
		결제 예정 금액 :&nbsp;<fmt:formatNumber pattern="###,###,###" value="${sum}"/>&nbsp;원	
	</div>
	<div class="orderOpen mt-3 mb-3">
		<a href="#"	class="orderOpen_btn btn btn-outline-success">
		주문 정보입력
		</a>
	</div>
</div>

<div class="orderInfo">
<form role="form" method="post" autocomplete="off">
<input type="hidden" name="amount" value="${sum}"/>

<div class="input-group mb-3">
	<label for="" class="form-label">수령인</label>
	<input
	type="text"
	class="form-control"
	required="required"
	/>
</div>

<div class="input-group mb-3">
	<label for="" class="form-label">수령인 연락처</label>
	<input
	type="text"
	class="form-control"
	required="required"
	/>
</div>

<div class="">
<div class="input-group">
	<input type="text" id="" class="form-control">
	<a href="#" onclick="sample_PostCode()" class="btn btn-outline-success">
	우편번호 찾기
	</a>
</div>

<pre>
<input type="text" name="userAddr1" id="sample2_address" class="form-control">
<input type="text" name="userAddr2" id="sample2_detailAddress" class="form-control">
<input type="text" name="userAddr3" id="sample2_extraAddress" class="form-control">
</pre>

	<div id="layer" 
	style="display:none; position:fixed; overflow:hidden; z-index:1; -webkit-overflow-scrolling:touch;"
	>
	<img 
	src="//t1.daumcdn.net/postcode/resource/images/close.png" 
	id="btnCloseLayer"
	style="corsor:pointer; position:absolute; right:-3px; z-index:1; "
	onclick="closeDaumPostcode()"
	/>
	</div>
	
	<div class="">
	<div class="my-5 d-flex justify-content-end">
	<div class="btn-group">
	<input type="submit" class="order_btn btn btn-outline-success" value="주문"/>
	<a ref="#" class="cancel_btn btn-outline-danger">취소</a>
	</div>
	</div>
	</div>
	
</div>

</form>
</div>
	
	
	
	
	
	
	
	
	
</ul>


<script src="${contextPath}/resources/js/cartlist.js"></script>
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />
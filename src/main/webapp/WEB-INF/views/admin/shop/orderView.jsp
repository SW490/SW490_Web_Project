<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/header.jsp"/>"

<div class="container-fluid">
	<div class="row">
	    <div class="col-md-3">
	        <jsp:include page="../include/lnb.jsp"/>
	    </div>
	    <div class="col-md-9">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}">
					<pre>
						<span class="fw-bold">주문자</span>${orderView.userId}
						<span class="fw-bold">수령인</span>${orderView.orderRec}
						<span class="fw-bold">주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}
						<span class="fw-bold">가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}"/>원
						<span class="fw-bold">상태</span>${orderView.delivery}
					</pre>
					<div class="">
						<form role="form" method="post" class="deliveryForm" autocomplete="off" name="form">
							<input type="hidden" name="orderId" value="${orderView.orderId}"/>
							<input type="hidden" name="delivery" class="delivery" value=""/>
							<div class="d-flex justify-content-end">
								<button type="button" class="delivery1_btn btn btn-primary">배송중</button>
								<button type="button" class="delivery2_btn btn btn-success">배송완료</button>
							</div>
							<script src="resources/js/delivery.js"></script>
						</form>
						<ul class="orderView bg-white list-group">
							<c:forEach items="${orderView}" var="orderView">
								<li class="list-group-item">
									<div class="">
										<img src="${orderView.gdsThumbImg}" class="img-thumbnail"/>
									</div>
									<pre>
										<span class="fw-bold">상품명</span>${orderView.gdsName}
										<span class="fw-bold">상품가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}"/>원
										<span class="fw-bold">구입수량</span>${orderView.cartStock}개
										<span class="fw-bold">결제금액</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}"/>원
									</pre>
								</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
			</c:forEach>
	    </div>
	</div>
</div>

<jsp:include page="../../include/footer.jsp"/>"
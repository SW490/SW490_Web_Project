<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../include/header.jsp"/>"

<div class="container-fluid">
	<div class="row">
	    <div class="col-md-3">
	        <jsp:include page="../include/aside.jsp"/>
	    </div>
	    <div class="col-md-9">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">
				<c:if test="${status.first}">
					<pre>
						<span class="fw-bold">주문자</span>${orderView.orderId}
						<span class="fw-bold">수령인</span>${orderView.orderRec}
						<span class="fw-bold">주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}
						<span class="fw-bold">가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}"/>원
						<span class="fw-bold">상태</span>${orderView.delivery}
					</pre>
				</c:if>
			</c:forEach>
			<ul class="orderView list-group mt-3">
				<c:forEach items="${orderView}" var="orderView">
				<li class="list-group-item">
					<div class="">
						<img src="${orderView.gdsThumbImg}" class="img-thumbnail"/>
					</div>
					<div class="">
						<pre>
							<span class="fw-bold">상품명</span>${orderView.gdsName}
							<span class="fw-bold">개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}"/>원
							<span class="fw-bold">구입 수량</span>${orderView.cartStock}개
							<span class="fw-bold">총 금액</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}"/>원
						</pre>
					</div>
				</li>
				</c:forEach>
			</ul>
	    </div>
	</div>
</div>

<jsp:include page="../include/footer.jsp"/>"
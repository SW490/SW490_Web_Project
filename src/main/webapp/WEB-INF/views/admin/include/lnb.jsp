<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="mt-3">&nbsp;</div>
<ul class="list-group mt-5">
	<li class="list-group-item">
		<a href="${contextPath}/admin/goods/register" class="a-link text-decoration-none">
		상품등록
		</a>
	</li>
	<li class="list-group-item">
		<a href="${contextPath}/admin/goods/list" class="a-link text-decoration-none">
		상품목록
		</a>
	</li>
	<li class="list-group-item">
		<a href="${contextPath}/admin/shop/orederList" class="a-link text-decoration-none">
		주문목록
		</a>
	</li>
	<li class="list-group-item">
		<a href="${contextPath}/admin/shop/allReply" class="a-link text-decoration-none">
		상품후기
		</a>
	</li>
	<li class="list-group-item">
		<a href="${contextPath}/admin/shop/allReply" class="a-link text-decoration-none">
		유저목록
		</a>
	</li>
</ul>
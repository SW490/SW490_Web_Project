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
<ul class="list-group list-group-horizontal mt-5">
<c:forEach items="${list}" var="list">
<li class="list-group-item mt-5">
	<div class="">
	<img src="${list.gdsThumbImg}" class="img-thumbnail"/>
	</div>
	<div class="">
	<a href="/shop/view?n=${list.gdsNum}" class="">
	${list.gdsName}
	</a>
	</div>
</li>
</c:forEach>	
	</ul>	
		</div>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />
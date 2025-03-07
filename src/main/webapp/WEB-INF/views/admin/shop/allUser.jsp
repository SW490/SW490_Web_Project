orderList.jsp<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../../include/header.jsp"/>"

<div class="container-fluid">
	<div class="row">
	    <div class="col-md-3">
	        <jsp:include page="../../include/aside.jsp"/>
	    </div>
	    <div class="col-md-9">
	    	<h1 class="my-5">회원목록</h1>
	    	<table class="table table-hover">
				<colgroup>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
					<col style="width: 8.33%;"/>
				</colgroup>
				<thead>
					<tr>
						<th>유저아이디</th>
						<th>패스워드</th>
						<th>패스워드확인</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>주소1</th>
						<th>주소2</th>
						<th>주소3</th>
						<th>가입일</th>
						<th>회원등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td class="text-center">${list.userId}</td>
							<td class="text-center">${list.userPw}</td>
							<td class="text-center">${list.userPwChk}</td>
							<td class="text-center">${list.userName}</td>
							<td class="text-center">${list.userEmail}</td>
							<td class="text-center">${list.userPhone}</td>
							<td class="text-center">${list.userAddr1}</td>
							<td class="text-center">${list.userAddr2}</td>
							<td class="text-center">${list.userAddr3}</td>
							<td class="text-center">${list.userDate}</td>
							<td class="text-center">${list.userLevel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	    </div>
	</div>
</div>

<jsp:include page="../../include/footer.jsp"/>"
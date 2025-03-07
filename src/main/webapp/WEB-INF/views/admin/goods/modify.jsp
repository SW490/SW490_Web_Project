<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../../include/header.jsp"/>

<div class="container-fluid bg-gradient-primary">
<div class="row">
<div class="col-md-12">
<div class="d-flex">
	<div class="w-25">
		<div class="mt-1"></div>
		<jsp:include page="../include/lnb.jsp"/>
	</div>
	<div class="w-75">
		<form role="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="gdsNum" value="${goods.gdsNum}"/>
			
			<div class="d-flex my-3">
				<div class="text-white">기등록 카테고리</div>
				<div class="text-white mx-3">${goods.cateName}</div>
				<div class="text-white mx-3">${goods.cateCode}</div>
			</div>
			
			<!-- category -->
			<div class="d-flex">
				<label class="form-label fw-bold text-white">1st categorization
					<select name="cateName" id="" class="form-select category1">
						<option value="${goods.cateName}" selected>${goods.cateName}</option>
					</select>
				</label>
				<label class="form-label fw-bold mx-3 text-white">2nd categorization
					<select name="cateCode" id="" class="form-select category2">
						<option value="${goods.cateCode}" selected>${goods.cateCode}</option>
					</select>
				</label>
			</div>
			<!-- 수정과 쓰기의 다른 점 
			 	: 기존에 썼던 내용을 불러와야 함. 따라서 el로 밸류 지정.
			-->
			<div class="input-group my-3">
				<label class="form-label fw-bold w-25 text-white">상품명</label>
				<input type="text" name="gdsName" id="gdsName" value="${goods.gdsName}" class="form-control">
			</div>
			<div class="input-group mb-3">
				<label class="form-label fw-bold w-25 text-white">상품가격</label>
				<input type="text" name="gdsPrice" id="gdsPrice" value="${goods.gdsPrice}" class="form-control">
			</div>
			<div class="input-group my-3">
				<label class="form-label fw-bold w-25 text-white">상품수량</label>
				<input type="text" name="gdsStock" id="gdsStock" value="${goods.gdsStock}" class="form-control">
			</div>
			<div class="input-group mb-3">
				<label class="form-label fw-bold w-25 text-white">상품소개</label>
				<textarea name="gdsDes" id="gdsDes" rows="5">${goods.gdsDes}</textarea>
				<script src="${contextPath}/resources/js/ckeditorConfig.js">
				</script>
			</div>
			<div class="input-group mb-3">
				<label class="form-label fw-bold w-25 text-orange">단백질</label>
				<input type="text" name="gdsProtein" id="gdsProtein" value="${goods.gdsProtein}" class="form-control">
			</div>
			<!--이미지 추가 업로드-->
			<div class="input-group mt-3">
				<label class="form-label fw-bold w-25 text-white">이미지</label>
				<input type="file" name="file" id="gdsImg" class="form-control">
				<div class="my-3">
					<div class="select_img d-flex justify-content-end">
						<img src="${goods.gdsImg}" alt="이미지를 불러올 수 없음." class="thumb img-thumbnail">
						<input type="hidden" name="gdsImg" value="${goods.gdsImg}"/>
						<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}"/>
					</div>
				<script src="${contextPath}/resources/js/changeImgFunction.js"></script>
				<div class="text-white"><%=request.getRealPath("/")%></div>
			</div>
			<!--btn set-->
			<div class="d-flex justify-content-end my-5">
				<div class="btn-group">
					<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
					<button type="button" id="back_Btn" class="btn btn-secondary">취소</button>
				</div>
			</div>
			<script src="${contextPath}/resources/js/backBtn.js"></script>
			<script>
				let jsonData = JSON.parse('${category}');
			</script>
			<script src="${contextPath}/resources/js/jsonDrop2.js"></script>
		</form>
	</div>
</div>
</div>
</div>
</div>


<jsp:include page="../../include/footer.jsp"/>
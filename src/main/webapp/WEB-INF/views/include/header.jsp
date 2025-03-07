<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<meta charset="UTF-8">
	<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
	<title>=== SHOP ===</title>
	<script>
		function replyList(){
		   var gdsNum = ${view.gdsNum};
		
		   //비동기식 데이터 요청
		   $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
		      var str = "";//초기화
		      $(data).each(function(){
		    	  console.log(data);
		          
		    	  //날짜 데이터를 보기 쉽게 변환
		          var repDate = new Date(this.repDate);
		          repdate = repDate.toLocaleDateString("ko-KR");
		          
			 	  //html코드 조립
			 	  str += "<li data-repNum='" + this.repNum + "'class='list-group-item'>"
			 	  + "<div class=''>"
			 	  + "<p class=''>" + this.userName + "</p>"
			 	  + "<p class='mx-3'>" + repDate + "</p>"
			 	  + "</div>"
			 	  + "<div class='replyContent'>"+this.repCon+"</div>"
			 	  +"<c:if test='${member != null}'>"//세션이 있어야만 수정삭제가 가능
			 	  + "<div class='replyFooter my-3'>"
			 	  + "<button type='button' class='modify btn btn-secondary' data-repNum='"+this.repNum+"'>M</button>"
			 	  + "<button type='button' class='delete btn btn-secondary mx-3' data-repNum='"+this.repNum+"'>D</button>"
			 	  + "</div>"
			 	  +"</c:if>"
			 	  +"</li>";
				});
			 	$("section.replyList ul").html(str);
			 	});
		      }
	</script>
</head>
<body class="">
<nav class="navbar navbar-expand-sm bg-light fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">Shop</a>
		<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav me-auto align-items-center">
				<c:if test="${member == null}"><!-- 미로그인 -->
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/member/signin">login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/member/signup">join</a>
					</li>
					<li class="nav-item">
						<a class="" href="${contextPath}/shop/list?c=101&l=2">상품보러가기</a>
					</li>
				</c:if>
				<!-- 로그인을 했을때 -->
				<c:if test="${member != null }">

				    <!-- Nav Item - User Information -->
				    <li class="nav-item dropdown no-arrow">
				        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				            <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
				            <img class="img-profile rounded-circle" src="${contextPath}/resources/images/crono.png" style="width:30px; height:30px;">
				        </a>
				        <!-- Dropdown - User Information -->
				        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				            <a class="dropdown-item" href="#">
				                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
				                Profile
				            </a>
				            <a class="dropdown-item" href="#">
				                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
				                Settings
				            </a>
				            <a class="dropdown-item" href="#">
				                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
				                Activity Log
				            </a>
				            <div class="dropdown-divider"></div>
				            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
				                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
				                Logout
				            </a>
				        </div>
				    </li>
				
				    <li class="nav-item">
				        <span class="fw-bold">
				        ${member.userName}&nbsp;님 환영합니다
				        </span>
				    </li>
			
			        <div class="topbar-divider d-none d-sm-block"></div>
			     
					<li class="nav-item">
						<a class="nav-link fw-bold" href="${contextPath}/shop/list?c=1&l=2">쇼핑몰 상품보러가기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/shop/cartList">카트리스트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/shop/orderList">주문리스트</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/member/signout">logout</a>
					</li>
			
		           <!-- Nav Item - Search Dropdown (Visible Only XS) -->
		           <li class="nav-item dropdown no-arrow d-sm-none">
		           		<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                	<i class="fas fa-search fa-fw"></i>
			            </a>
			            <!-- Dropdown - Messages -->
			            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
			                <form class="form-inline mr-auto w-100 navbar-search">
			                    <div class="input-group">
			                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
			                        <div class="input-group-append">
			                            <button class="btn btn-primary" type="button"></button>
			                        </div>
			                    </div>
			                </form>
			            </div>
			        </li>
			
			        <!-- Nav Item - Alerts -->
			        <li class="nav-item dropdown no-arrow mx-1">
			            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                <i class="fas fa-bell fa-fw"></i>
			                <!-- Counter - Alerts -->
			                <span class="badge badge-danger badge-counter">3+</span>
			            </a>
			            <!-- Dropdown - Alerts -->
			            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
			                <h6 class="dropdown-header">Alerts Center</h6>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="mr-3">
			                        <div class="icon-circle bg-primary">
			                            <i class="fas fa-file-alt text-white"></i>
			                        </div>
			                    </div>
			                    <div>
			                        <div class="small text-gray-500">December 12, 2019</div>
			                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
			                    </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="mr-3">
			                        <div class="icon-circle bg-success">
			                            <i class="fas fa-donate text-white"></i>
			                        </div>
			                    </div>
			                    <div>
			                        <div class="small text-gray-500">December 7, 2019</div>
			                        $290.29 has been deposited into your account!
			                    </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="mr-3">
			                        <div class="icon-circle bg-warning">
			                            <i class="fas fa-exclamation-triangle text-white"></i>
			                        </div>
			                    </div>
			                    <div>
			                        <div class="small text-gray-500">December 2, 2019</div>
			                        Spending Alert: We've noticed unusually high spending for your account.
			                    </div>
			                </a>
			                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
			            </div>
			        </li>
			
			        <!-- Nav Item - Messages -->
			        <li class="nav-item dropdown no-arrow mx-1">
			            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                <i class="fas fa-envelope fa-fw"></i>
			                <!-- Counter - Messages -->
			                <span class="badge badge-danger badge-counter">7</span>
			            </a>
			            <!-- Dropdown - Messages -->
			            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
			                <h6 class="dropdown-header">Message Center</h6>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="dropdown-list-image mr-3">
			                        <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
			                        <div class="status-indicator bg-success"></div>
			                    </div>
			                    <div class="font-weight-bold">
			                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
			                            problem I've been having.</div>
			                        <div class="small text-gray-500">Emily Fowler · 58m</div>
			                    </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="dropdown-list-image mr-3">
			                        <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
			                        <div class="status-indicator"></div>
			                    </div>
			                    <div>
			                        <div class="text-truncate">I have the photos that you ordered last month, how
			                            would you like them sent to you?</div>
			                        <div class="small text-gray-500">Jae Chun · 1d</div>
			                    </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="dropdown-list-image mr-3">
			                        <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
			                        <div class="status-indicator bg-warning"></div>
			                    </div>
			                    <div>
			                        <div class="text-truncate">Last month's report looks great, I am very happy with
			                            the progress so far, keep up the good work!</div>
			                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
			                    </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                    <div class="dropdown-list-image mr-3">
			                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
			                        <div class="status-indicator bg-success"></div>
			                    </div>
			                    <div>
			                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
			                            told me that people say this to all dogs, even if they aren't good...</div>
			                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
			                    </div>
			                </a>
			                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
			            </div>
			        </li>
	        		<!-- 로그인을 했는데 관리자라면 -->
					<c:if test="${member.verify == 9 }">
						<a class="nav-link mx-3" href="${contextPath}/admin/index">ADMIN으로 가기</a>
					</c:if>
				</c:if>
			</ul>
		</div>
		<form class="d-flex ">
			<div class="btn-group">
				<input class="form-control" type="text" placeholder="Search"/>
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
			</div>
		</form>
	</div>
</nav>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${contextPath}/resources/js/daum.js"></script>
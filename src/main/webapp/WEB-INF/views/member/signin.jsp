<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" flush="false"/>

<div class="container-fluid bg-gradient-primary2">
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image">
                        <!--배경이미지-->
                        </div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                <form method="post" class="was-validated">
                                    <div class="my-3">
                                        <input
                                        type="text"
                                        class="form-control form-control-user" 
                                        placeholder="아이디를 입력하세요"
                                        name="userId"
                                        required="required"
                                        />
                                    </div>
                                    <div class="mb-3">
                                        <input
                                        type="password"
                                        class="form-control form-control-user" 
                                        placeholder="비밀번호를 입력하세요"
                                        name="userPass"
                                        required="required"
                                        />
                                    </div>
                                    <div class="my-3">
                                    	<div class="custom-control custom-checkbox small">
                                    		<input
                                    		type="checkbox"
                                    		class="custom-control-input"
                                    		id="customCheck"
                                    		/>
                                    		<label class="custom-control-label" for="customCheck">Remember Me</label>
                                    	</div>
                                    </div>
                                    <p class="mb-3">
                                        <input 
                                        type="submit" 
                                        class="btn btn-primary btn-user btn-block"
                                        value="로그인"
                                        id="signin_btn"
                                        name="signin_btn"
                                        />
                                    </p>
                                    <hr/>
                                    <p class="mb-3">
                                    	<a href="${contextPath}/member/google" class="btn btn-google btn-user btn-block">
                                    		<i class="fab fa-google fa-fw"></i>
                                    		&nbsp;Login with Google
                                    	</a>
                                    </p>
                                    <p class="mb-3">
                                    	<a href="${contextPath}/member/face" class="btn btn-facebook btn-user btn-block">
                                    		<i class="fab fa-facebook fa-fw"></i>
                                    		&nbsp;Login with Facebook
                                    	</a>
                                    </p>
                                    <hr/>
                                    <div class="mb-3">
                                    	<a class="small" href="${contextPath}/member/forgot">
                                    	Forgot Password?
                                    	</a>
                                    </div>
                                    <div class="mb-3">
                                    	<a class="small" href="${contextPath}/member/signup">
                                    	Join
                                    	</a>
                                    </div>
                                </form>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                            
    </div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- (1) page directive include -->
<%@ include file="../include/header.jsp"%>

<div class="container-fluid bg-gradient-primary2">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block bg-register-image">
						</div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="">
									회원가입
									</h1>
									<form method="post" class="was-validated">
										<div class="mb-4">
											<input
											type="text"
											placeholder="id"
											name="userId"
											class="form-control form-control-user"
											required="required"
											/>
										</div>
										<div class="mb-4">
											<input
											type="password"
											placeholder="pw"
											name="userPass"
											class="form-control form-control-user"
											required="required"
											/>
										</div>
										<div class="mb-4">
											<input
											type="password"
											placeholder="pwre"
											name="userPassRe"
											class="form-control form-control-user"
											required="required"
											/>
										</div>
										<div class="mb-4">
											<input
											type="text"
											placeholder="name"
											name="userName"
											class="form-control form-control-user"
											required="required"
											/>
										</div>
										<div class="mb-4">
											<input
											type="text"
											placeholder="email"
											name="userEmail"
											class="form-control form-control-user"
											required="required"
											/>
										</div>
										<div class="mb-4">
											<input
											type="text"
											placeholder="hp"
											name="userPhone"
											class="form-control form-control-user"
											required="required"
											/>
										</div>
										<div class="mb-4">
											<label class="form-label">주소</label>
											<div class="d-flex">
												<input
												type="text"
												placeholder="search the address"
												name="userAddr1"
												readonly="readonly"
												class="form-control form-control-user address_input_1 w-75"
												/>
												<a class="btn btn-outline-primary border-radius-top-right-sm w-25" onclick="go_daum_address()">주소찾기</a>
											</div>
										</div>
										<div class="mb-4">
											<input
											type="text"
											placeholder=""
											name="userAddr2"
											readonly="readonly"
											class="form-control form-control-user address_input_2"
											/>
										</div>
										<div class="mb-4">
											<input
											type="text"
											placeholder=""
											name="userAddr3"
											readonly="readonly"
											class="form-control form-control-user address_input_3"
											/>
										</div>
										<div class="mb-4">
											<div class="btn-group">
												<label class="btn border-0 active">
													<input type="radio" name="userGender" value="남자" autocomplete="off" checked>남자
												</label>
												<label class="btn border-0">
													<input type="radio" name="userGender" value="여자" autocomplete="off">여자
												</label>
											</div>
										</div>
										<div class="my-3">
											<input
											type="submit"
											class="btn btn-primary btn-user btn-block"
											value="회원가입"
											/>
										</div>
										<p class="mb-3">
											<a href="https://kauth.kakao.com/oauth/authorize?client_id={REST_API_KEY}&redirect_uri={REDIRECT_URI}&response_type=code" class="btn btn-kakao btn-user btn-block">
												<i class="fab fa-google fa-fw w-100">
												코코아톡으로 회원가입
												</i>											
											</a>
										</p>
										<div class="mb-3">
											<a class="small" href="/member/forgot.jsp">Forgot Password?</a>
										</div>
										<div class="mb-3">
											<a class="small" href="/member/login.jsp">Already have an account? login!</a>
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
</div>
<!-- (2) jsp include -->
<jsp:include page="../include/footer.jsp" flush="false"/>

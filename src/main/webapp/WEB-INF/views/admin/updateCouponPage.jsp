<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@100;300;400;500;700;900&family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/leftNavi.css">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-2" id="naviBack">
				<jsp:include page="../common/leftNavi.jsp"></jsp:include>
			</div>
			<c:if test="${!empty sessionUser}">
			<div class="col-8 mx-auto">
				<div class="row mt-5 pageTitle border-dark-subtle border-bottom border-2">
					<div class="col">쿠폰 수정</div>
				</div>
					<form action="updateCouponProcess" method="post" enctype="multipart/form-data">
				<div class="row d-flex mt-3">  
				  <div class="col-6 mx-auto">
				    <label for="inputText1" class="form-label">쿠폰명</label>
				    <input type="text" class="form-control" value="${couponDto.coupon_title}" id="intputText1" name="coupon_title">
				  </div>
				</div>
				<div class="row">
				  <div class="col-6 mx-auto mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">쿠폰 공지</label>
					  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="coupon_content">${couponDto.coupon_content}</textarea>
					</div>
				</div>
				<div class="row">
				  <div class="col-6 mx-auto mb-3">
				    <label for="formFile" class="form-label" >쿠폰 이미지</label>
  					<input class="form-control" type="file" id="formFile"  name="couponImage" accept="image/*">
  					<img src="/uploadFiles/${couponDto.coupon_image}" alt="Coupon Image" width="200" height="200">
				  </div>
				</div>
				<div class="row">
				  <div class="col-6 mx-auto mb-3">
					  <label for="issueDate" class="form-label">발급 기한</label>
					  <div class="input-group">
					    <input class="form-control" id="issueStartDate" type="date" value="<fmt:formatDate value="${couponDto.coupon_issue_start}" pattern="yyyy-MM-dd" />" name="coupon_issue_start">
					    <span class="input-group-text">~</span>
					    <input class="form-control" id="issueDate" type="date" value="<fmt:formatDate value="${couponDto.coupon_issue_end}" pattern="yyyy-MM-dd" />" name="coupon_issue_end">
					  </div>
				  </div>
				</div>
				<div class="row mb-3">
				  <div class="col-6 mx-auto">
						<label for="useEndDate" class="form-label">사용 종료일</label>
					    <input class="form-control" id="useEndDate" type="date" value="<fmt:formatDate value="${couponDto.coupon_use_end}" pattern="yyyy-MM-dd" />" name="coupon_use_end">
				  </div>
				</div>
				<div class="row">
				  <div class="col-6 mx-auto mb-3">
				    <label for="discount" class="form-label">할인 금액</label>
				    <div class="input-group">
				      <input class="form-control" id="discount" value="${couponDto.coupon_discount}" type="text" name="coupon_discount">
				      <span class="input-group-text">원</span>
				    </div>
				  </div>
				</div>
				<div class="row">
				  <div class="col-6 mx-auto mb-3">
				    <label for="totalAmount" class="form-label">총 수량</label>
				    <div class="input-group">
				      <input class="form-control" id="totalAmount" value="${couponDto.coupon_amount}" type="text" name="coupon_amount">
				      <span class="input-group-text">개</span>
				    </div>
				  </div>
				</div>
				<div class="row mb-2">
					  <div class="col-6 mx-auto text-center">
					  	<span>					 
					    <button type="submit" class="btn btn-secondary">수정</button>
					    </span>
					    <span>
					    <button type="button" class="btn btn-secondary" onclick="location.href='registedCouponPage'">취소</button>
					    </span>
					  </div>	
				 </div> 			
				  <input type="hidden" value="${couponDto.coupon_id}" name="coupon_id">		  
				</form>
			</div>
			</c:if>
		</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
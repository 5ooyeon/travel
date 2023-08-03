<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>메인 페이지</title>
<style>
        #opencrewhome {
           	background-image: linear-gradient(98deg,#03c75a,#38a877);
            color: white;
        }
       #opencrewhome:hover {
		   	background-image: linear-gradient(98deg,#1e9f58,#0e8a69);
		   	color: #f0f0f0;
		}

		.card-mycrew {
			min-height:300px;
		}
        .crewinfo {
            font-size: 16px
        }


        body {
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
            font-size: 24px;
            font-weight: bold;
        }

        .card {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #fff;
        }

        .card-notitable {
            padding: 0;
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .sticky-header {
        position: sticky;
        top: 0;
        background-color: #fff;
        z-index: 1;
        }
        
        .bi-bell {
        	
        }

          /* Scrollbar 커스터마이징 */
        ::-webkit-scrollbar {
            width: 8px;
        }
        
        ::-webkit-scrollbar-track {
            background-color: #f1f1f1;
        }
        
        ::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 4px;
        }
        
        ::-webkit-scrollbar-thumb:hover {
            background-color: #555;
        }
        
        .crewmember {
            font-size: 13px;
        }

        .crewmembercount{
            font-style: normal;
        }

        .crewname {
            font-size: 23px;
            font-weight: bold;
        }
        
       .crewname2 {
            font-size: 15px;
            font-weight: bold;
        }

        .crewlistcard {

            transition: transform 0.3s ease; /* 변화가 일어날 때 애니메이션 효과를 주기 위한 CSS transition 속성 */
        }
        .crewlistcard:hover {
		  /* 마우스 커서를 올렸을 때의 스타일 지정 (애니메이션 효과를 추가할 부분) */
		  transform: scale(1.02); /* 카드 크기를 약간 확대하여 애니메이션 효과를 줍니다. */
		}
        .card-mycrew {
        	height: 361px;
        }
        .card-notitable {
        	height: 361px;
        }
        
        .bi-bell {
        	font-style: normal;
        }
        a:hover {
		  color: inherit; /* 링크 텍스트의 색상을 부모 요소로부터 상속 받습니다. */
		  text-decoration: none; /* 텍스트에 밑줄을 제거합니다. */
		}
        
		a {
		  color: inherit; /* 링크 텍스트의 색상을 부모 요소로부터 상속 받습니다. */
		  text-decoration: none; /* 텍스트에 밑줄을 제거합니다. */
		}
		.noti {
			transition: transform 0.3s ease; /* 변화가 일어날 때 애니메이션 효과를 주기 위한 CSS transition 속성 */
		}
		.noti:hover {
			/* 마우스 커서를 올렸을 때의 스타일 지정 (애니메이션 효과를 추가할 부분) */
		  transform: scale(1.01); /* 카드 크기를 약간 확대하여 애니메이션 효과를 줍니다. */
		}
		
.text-container {
overflow: hidden; -webkit-box-orient: vertical; text-overflow: ellipsis; display: -webkit-box;  -webkit-line-clamp: 3;
}

.text-container2 {
overflow: hidden; -webkit-box-orient: vertical; text-overflow: ellipsis; display: -webkit-box;  -webkit-line-clamp: 2;
}

.name {
	font-weight: bold;
	font-size:18px;

}

.textoverflow {
  white-space: nowrap; /* 줄 바꿈 없이 한 줄로 표시 */
  overflow: hidden; /* 넘치는 부분을 숨김 */
  text-overflow: ellipsis; /* 넘치는 부분에 ... 표시 */
}

.text-grey {
	color:#6C757D;
	font-size:15px;
}

.background-color-change{
    background-color: var(--tier2SurfaceBoxLv04);
}

.categoryname{
	font-weight: bold;
	font-size: 24px;
}
</style>
<script type="text/javascript">


	document.addEventListener("DOMContentLoaded", function() {
	    var searchCrewInput = document.getElementById("searchCrew");
	    searchCrewInput.addEventListener("input", function() {
	        var searchCrew = searchCrewInput.value;
	        
	        if(searchCrew === '') {
	        	console.log('AAA');
                $.ajax({
                    url: "/travel/crew/getallcrewlist",
                    type: "POST",
                    success: function(response) {
                    	getallcrewlist(response);
                    },
                    error: function(err) {
                        console.error("이름 확인 실패", err);
                    }
                });
	        	
	        	
	        } else {
	        	console.log(searchCrew);
                $.ajax({
                    url: "/travel/crew/searchCrew",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({
    	                "searchCrew": searchCrew
    	            }),
                    success: function(response) {
                    	getallcrewlist(response);
                    },
                    error: function(err) {
                        console.error("이름 확인 실패", err);
                    }
                });
	        }
	    });
	});
	
	function getallcrewlist(res) {
		document.getElementById('crewlistarea').innerHTML = ``;
		
		for(var i = 0; i < res.length; i++) {
			var crew_name= res[i].crew.crew_name;
			var crew_desc = res[i].crew.crew_desc;
			var crew_domain = res[i].crew.crew_domain;
			var crew_thumbnail = res[i].crew.crew_thumbnail;
			var crewppl = res[i].crewppl;
			
			document.getElementById('crewlistarea').innerHTML += `
				<div class="col-6">
                <div class="card crewlistcard  shadow-sm p-3 mb-3 bg-body-tertiary rounded" onclick="gocrewpage( '\${crew_domain}')">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-3">
                                <img src="/uploadFiles/crewFiles/crewthumbnail/\${crew_thumbnail}" width="100px" height="100px">
                            </div>
                            <div class="col">
                                <div class="row crewname">
                                    \${crew_name }
                                </div>
                                <div class="row">
                                   \${crew_desc }
                                </div>
                                <div class="row mt-2">
                                    <div class="col text-secondary ps-0 crewmember">
                                        인원수 <em class="crewmembercount">\${crewppl } / 20</em>
                                    </div>
                                    <div class="col text-end">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			`;
		}
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="container">
			<jsp:include page="../common/mainTopNavi2.jsp"></jsp:include>
		</div>
	</div>
	
	
	<div class="container py-4 px-5">
		<div class="row mb-3">
			<div class="col">
				<span class="categoryname">나의 크루</span>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col">
				<div class="card mb-5" style="
    border-style: none;
    border-radius: 20px;
">
				<div class="row">
                    <div class="col-6">
                    	<div class="card card-mycrew shadow-sm bg-body-tertiary rounded">
						<c:choose>
							<c:when test="${empty crewDto}">
								<div class="card-body">
									<div class="row ">
										<div class="col-3">
											<img src="/travel/resources/img/padeng.png" width="100px" height="100px">
										</div>
										<div class="col pt-3">
											<div class="row pb-3">
												<span style=" font-size: 19px;font-weight: bold;">가입된 크루가 없습니다</span>
											</div>
											<div class="row">
												<div class="col-6">
													<button class="btn btn-outline-success form-control">크루 찾아보기</button>	
												</div>
												<div class="col">
													<a href="/travel/crew/createcrew"><button class="btn btn-success form-control">크루 생성하기</button></a>
												</div>
											</div>
											
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col"  style=" font-size: 17px;font-weight: bold;">
											이런 크루는 어때요?
										</div>
									</div>
																<div  class="card cSearchStyleItem crewlistcard shadow-sm p-3 mt-3" style="
    border-style: none;
    background-color: #f2f2f2;
    border-radius: 20px;
">
							<div class="row">
                            <div class="col-auto">
                                <img src="/travel/resources/img/롯데타워.png" width="100px" height="100px" style="border-radius: 10px;">
                            </div>
                            <div class="col">
                                <div class="row name">
                                    둘레여행
                                </div>
                                <div class="row">
                                    <span class="text-container2 ps-0">카페탐방.폰카사진.둘레길산책.여행정보</span>
                                </div>
                                <div class="row mt-2">
                                    <div class="col text-secondary ps-0 crewmember">
                                        인원수 <em class="crewmembercount">1 / 20</em>
                                    </div>
                                    <div class="col text-end">
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
								</div>
							</c:when>
							<c:when test="${!empty crewDto && applied == null}">
								<div class="card-body ">
	                                <div class="row">
	                                    <div class="col-3">
	                                        <img src="/uploadFiles/crewFiles/crewthumbnail/${crewDto.crew_thumbnail }" width="100px" height="100px">
	                                    </div>
	                                    <div class="col">
	                                        <div class="row crewname">
	                                            ${crewDto.crew_name }
	                                        </div>
	                                        <div class="row text-container">
	                                            ${crewDto.crew_desc }
	                                        </div>
	                                    </div>
	                                </div>
	                                <hr>
	                                <div class="row">
	                                    <div class="col-4 text-secondary">크루마스터</div>
	                                    <div class="col">${master }</div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-4 text-secondary">인원수</div>
	                                    <div class="col">${crewamount } / 20</div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-4 text-secondary">가입일자</div>
	                                    <div class="col"><fmt:formatDate
																			value="${crewMemberDto.crew_member_log_date }"
																			pattern="yyyy.MM.dd." var="formattedDate" />
																		${formattedDate }</div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-4 text-secondary">나의 직위</div>
	                                    <div class="col">${myGrade }</div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-4 text-secondary">나의 기여포인트</div>
	                                    <div class="col">${myPoint }</div>
	                                </div>
	                                <div class="row mt-3">
	                                    <a href="/travel/crew/crewhome/${crewDto.crew_domain }"><button class="btn form-control" id="opencrewhome">크루 홈 이동</button></a>
	                                </div>
	                            </div>
							</c:when>
							<c:otherwise>
                            <div class="card-body ">
                            	<div class="row">
                            		<div class="col">
                            			현재 가입신청 중입니다.
                            		</div>
                            	</div>
                            	<hr>
                                <div class="row">
                                    <div class="col-3">
                                        <img src="/uploadFiles/crewFiles/crewthumbnail/${crewDto.crew_thumbnail }" width="100px" height="100px">
                                    </div>
                                    <div class="col">
                                        <div class="row crewname">
                                            ${crewDto.crew_name }
                                        </div>
                                        <div class="row text-container">
                                            ${crewDto.crew_desc }
                                        </div>
                                        <div class="row">
		                                    <div class="col-4 text-secondary px-0">크루마스터</div>
		                                    <div class="col">${master }</div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-4 px-0 text-secondary">인원수</div>
		                                    <div class="col">${crewamount } / 20</div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-4 px-0 text-secondary">가입신청일자</div>
		                                    <div class="col">
			                                    <fmt:formatDate value="${applied.crew_member_request_date }" pattern="yyyy.MM.dd" var="formattedDate" />
													${formattedDate }
											</div>
                                		</div>
                                    </div>
                                </div>
                                <hr>

								<div class="row mt-3">
	                            	<a href="/travel/crew/crewhome/${crewDto.crew_domain }"><button class="btn form-control" id="opencrewhome">크루 홈 이동</button></a>
	                           	</div>
                            </div>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					<div class="col">
                        <div class="card card-notitable  shadow-sm bg-body-tertiary rounded">
                        	<div class="row sticky-header pt-2">
                        		<div class="col-auto ms-2">
                        			<i class="bi bi-bell"> 알림</i>
                        		</div>
                        		<div class="col text-end me-2">
                        			자세히보기
                        		</div>
                        	</div>
                        	<hr>
                        	
                        	<c:choose>
                        		<c:when test="${!empty notice }">
                        		
	                        		<c:forEach var="notifications" items="${notice}" varStatus="status">
	                        			<a href="${notifications.user_notification_link }">
	                        				<div class="row noti">
			                        			<div class="col-auto ms-2" >
			                        				<img src="${notifications.sender_image }" width="40px" height="40px" class="rounded-circle">
			                        			</div>
			                        			<div class="col">
			                        				<div class="row pe-3">
			                        					${notifications.user_notification_content }
			                        				</div>
			                        				<div class="row text-secondary">
				                        				<fmt:formatDate value="${notifications.user_notification_date }" pattern="yyyy.MM.dd HH:mm" var="user_notification_date" />
													${user_notification_date }
			                        				</div>
			                        			</div>
		                        			
		                        			</div>
		                        			<hr>
		                        		</a>
		                        	</c:forEach>

                        		</c:when>
                        		<c:otherwise>
                        		<div class="row pt-5">
                        			<div class="col text-center">
                        				알림이 없습니다.
                        			</div>
                        		</div>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
				</div>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<span class="categoryname">오늘의 인기글</span>
			</div>
			<div class="col text-end">
				<span>모두보기</span>
			</div>
		</div>
		<div class="row  mb-5">
			
			<c:forEach var="ppost" items="${ppost}" varStatus="status">
			<c:if test= "${status.index==0 || status.index == 1 }">
			<div class="col-6">
				<div  class="card cSearchStyleItem px-4 pb-4 shadow-sm" style="
    border-style: none;
    border-radius: 20px;
">

    				<div class="content-photo">
    					<div class="row">
    						<div class="col">
    							<span class="crewname2">${ppost.crewDto.crew_name }</span>
    						</div>
    					</div>
    					<hr style="margin-top: 5px;">
    					<div class="row">
    						<div class="col-9">
    							<div class="row">
    								<span class="name textoverflow pb-2">${ppost.crewBoardDto.crew_board_title }</span>
    							</div>
    							<div class="row">
    								<span class="text-container">${ppost.crewBoardDto.crew_board_content }</span>
    							</div>
    						</div>
    						<div class="col-3">
    							<img src="/uploadFiles/crewFiles/crewboard/${ppost.crewBoardDto.crew_board_id }/${ppost.crewBoardAttachedDto.crew_board_attached }" width="100px" height="100px">
    						</div>
    					</div>
    					<div class="row pt-2">
    						<div class="col-auto text-grey">
    							좋아요 ${ppost.likecount }
    						</div>
    						<div class="col text-grey">
    							댓글 ${ppost.commentcount }
    						</div>
    					</div>
    				</div>
    			</div>
    			</div>
    			</c:if>
    			</c:forEach>
			
			<div class="col">
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-9 categoryname">
				이런 크루는 어때요
			</div>
			<div class="col text-end">
			
				<input type="text" class="form-control searchbar nonboarder" placeholder="크루명으로 검색" id="searchCrew">
			</div>
		</div>
		<div class="row" id="crewlistarea">
			<c:forEach var="crew" items="${crewList}" varStatus="status">
			
			<div class="col-6">
							<div  class="card cSearchStyleItem crewlistcard shadow-sm p-4 mb-3" style="
    border-style: none;
    border-radius: 20px;
">
				<a href="/travel/crew/crewhome/${crew.crew.crew_domain }">
                        <div class="row">
                            <div class="col-auto">
                                <img src="/uploadFiles/crewFiles/crewthumbnail/${crew.crew.crew_thumbnail }" width="100px" height="100px" style="border-radius: 10px;">
                            </div>
                            <div class="col">
                                <div class="row name">
                                    ${crew.crew.crew_name }
                                </div>
                                <div class="row">
                                    <span class="text-container2 ps-0">${crew.crew.crew_desc }</span>
                                </div>
                                <div class="row mt-2">
                                    <div class="col text-secondary ps-0 crewmember">
                                        인원수 <em class="crewmembercount">${crew.crewppl } / 20</em>
                                    </div>
                                    <div class="col text-end">
                                    </div>
                                </div>
                            </div>
                        </div>

                </a>
                </div>
            </div>
			</c:forEach>
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
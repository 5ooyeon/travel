<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@300;700;900&family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
   
   body {
		font-family: 'Noto Sans KR', sans-serif;	
	}
   
   .startButton {
	     width: auto;
	     height: auto;
	     background-image: linear-gradient(30deg,#00b078,#00b067);
	     border-radius: 10px;
	     border: none;
	     color: rgb(255, 255, 255);
	     padding: 0.8em 0.9em;
	     font-size: 0.9em;
	     text-align: center;
	     text-decoration: none;
  }
   
   .startButton:hover {
	   	background-image: linear-gradient(98deg,#1e9f58,#0e8a69);
	   	
	   	color: #f0f0f0;
}

   .box {
       width: auto;
       height: auto;
       border: solid rgb(205, 205, 205) 1px;
       border-radius: 10px;
       padding: 17px 15px;

   }
    </style>
</head>
<body>

 <div class="container-fluid">
        <div class="row align-items-center py-4" style="position: fixed; top: 0; width: 100%; background-color: white; z-index: 1;">
            <div class="col px-5">
                <img class="navbar-brand" src="/travel/resources/img/tripstationLOGO.png" style="width: 6em;">
            </div>
            <div class="col"></div>
            <div class="col-auto px-5">
            </div>
        </div>

        <div class="row" style="padding-top: 10em;">
            <div class="col"></div>
            <div class="col-auto pe-5 me-5">
                <div class="row">
                    <div class="col">
                        <span style="font-size: 50px; font-weight: 600;">
                        	간단하게<br>
                        	트립스테이션<br>
                        	호스팅을 시작할 수<br>
                        	있습니다
                        </span>
                    </div>
                </div>
               <!--  <div class="row">
                    <div class="col">
                        <span style="font-size: 50px; font-weight: 600;">트립스테이션</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <span style="font-size: 50px; font-weight: 600;">호스팅을 시작할 수</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <span style="font-size: 50px; font-weight: 600;">있습니다</span>
                    </div>
                </div> -->
            </div>
            <div class="col-auto ps-5 ms-5">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col-auto pe-0">
                                <span style="font-size: 19px; font-weight: 600;">1</span>
                            </div>
                            <div class="col-auto">
                                <div class="row">
                                    <div class="col">
                                        <span style="font-size: 19px; font-weight: 600;">숙소 정보를 알려주세요</span>
                                    </div>
                                </div>
                                <div class="row mt-1">
                                    <div class="col">
                                        <span style="font-size: 15px; color: gray;">숙소 위치와 숙박 가능 인원 등 기본 정보를 알려주세요</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <img src="/uploadFiles/35777.jpg" alt="" style="width: 120px;">
                            </div>
                        </div>
                        <hr class="my-4">
                        <div class="row">
                            <div class="col-auto pe-0">
                                <span style="font-size: 19px; font-weight: 600;">2</span>
                            </div>
                            <div class="col-auto">
                                <div class="row">
                                    <div class="col">
                                        <span style="font-size: 19px; font-weight: 600;">숙소를 돋보이게 하세요</span>
                                    </div>
                                </div>
                                <div class="row mt-1">
                                    <div class="col">
                                        <span style="font-size: 15px; color: gray;">사진을 5장 제출하고 제목과 설명을 추가해주시면</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span style="font-size: 15px; color: gray;">숙소가 돋보일 수 있도록 도와드릴게요</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col d-flex justify-content-end">
                                <img src="/uploadFiles/35777.jpg" alt="" style="width: 120px;">
                            </div>
                        </div>
                        <hr class="my-4">
                        <div class="row">
                            <div class="col-auto pe-0">
                                <span style="font-size: 19px; font-weight: 600;">3</span>
                            </div>
                            <div class="col-auto">
                                <div class="row">
                                    <div class="col">
                                        <span style="font-size: 19px; font-weight: 600;">등록을 완료하세요</span>
                                    </div>
                                </div>
                                <div class="row mt-1">
                                    <div class="col">
                                        <span style="font-size: 15px; color: gray;">사진을 5장 제출하고 제목과 설명을 추가해주시면</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span style="font-size: 15px; color: gray;">숙소가 돋보일 수 있도록 도와드릴게요</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col d-flex justify-content-end">
                                <img src="/uploadFiles/35777.jpg" alt="" style="width: 120px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
                
        <div class="row align-items-center py-4" style="position: fixed; bottom: 0; width: 100%; z-index: 1;">
            <div class="col-auto px-5">
            	<a href="./hotelPage" style="text-decoration: none; color: gray;">
            		 <span style="font-size: 14px; font-weight: 500;">취소하기</span>
            	</a>
            </div>
            <div class="col"></div>
            <div class="col-auto px-5">
            	<a href="./hotelRegisterPage2" class="startButton px-5">
               		<span>시작하기</span>
            	</a>
            </div>
        </div>
    </div>

            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
        
</body>
</html>
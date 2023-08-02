<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="theiaStickySidebar" style="position: fixed; min-width: 304px;">
	<div data-viewname="DGroupBandSideCoverView" class="sideCover">
		<div class=" flex-column flex-shrink-0">
			<div class="row">
				<div class="col align-items-center text-center">
					<a href="/travel/crew/crewhome/${crewDto.crew_domain }" class=" mb-3">
						<img src="/uploadFiles/crewFiles/crewthumbnail/${crewDto.crew_thumbnail }" width="300" height="200">
					</a>
				</div>	
			</div>
			<div class="row pt-2">
				<span class="text-center crewname pb-1" style="font-size: 20px;font-weight: bold;">${crewDto.crew_name }</span>
			</div>

			<div class="row pb-1">
				<div class="col text-center">멤버 ${membersize } / 20 ・ 리더 ${masterName }</div>
			</div>
			<c:choose>
				<c:when test="${!empty crewMemberDto && crewMemberDto.crew_domain == crewDto.crew_domain}">
					<button class="btn btn-success form-control">크루 설정</button>
				</c:when>
				<c:when test="${!empty crewMemberDto && crewMemberDto.crew_domain != crewDto.crew_domain}">
					<a href="/travel/crew/crewhome/${crewMemberDto.crew_domain }"><button class="btn btn-success form-control">내크루가기</button></a>
				</c:when>
				<c:when test="${!empty applied && applied.crew_domain != crewDto.crew_domain}">
					<a href="/travel/crew/crewhome/${applied.crew_domain }"><button class="btn btn-success form-control">내크루가기</button></a>
				</c:when>
				<c:when test="${!empty applied && applied.crew_domain == crewDto.crew_domain}">
					<button class="btn btn-success form-control" id="cancelapply">가입신청중</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-success form-control" id="joincrew">가입하기</button>
				</c:otherwise>
			</c:choose>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item"><a
					href="/travel/crew/crewhome/${crewDto.crew_domain }" 
					class="nav-link textcolourdefault" id="crewmain" aria-current="page">
						<svg class="bi pe-none me-2" width="16" height="16">
								<use xlink:href="#home"></use>
							</svg> 게시글
				</a></li>
				<li><a
					href="/travel/crew/crewhome/${crewDto.crew_domain }/notice"
					class="nav-link textcolourdefault" id="crewnotice"  > <svg
							class="bi pe-none me-2" width="16" height="16">
								<use xlink:href="#speedometer2"></use>
							</svg> <i class="bi bi-bookmark-star"></i> 공지</i>
				</a></li>
				<li><a href="/travel/crew/crewhome/${crewDto.crew_domain }/calendar" class="nav-link textcolourdefault" id="crewcalendar">
						<svg class="bi pe-none me-2" width="16" height="16">
								<use xlink:href="#grid"></use>
							</svg> <i class="bi bi-calendar2-date"> 일정</i>
				</a></li>
				<li><a
					href="/travel/crew/crewhome/${crewDto.crew_domain }/crewmember"
					class="nav-link textcolourdefault" id="crewmember" > <svg
							class="bi pe-none me-2" width="16" height="16">
								<use xlink:href="#table"></use>
							</svg> <i class="bi bi-people-fill"> 멤버</i>
				</a></li>
				<li><a href="#" class="nav-link textcolourdefault" id="crewshop">
						<svg class="bi pe-none me-2" width="16" height="16">
								<use xlink:href="#grid"></use>
							</svg> <i class="bi bi-basket2"> 상점</i>
				</a></li>
				<li><a href="#" class="nav-link textcolourdefault" id="crewchat">
						<svg class="bi pe-none me-2" width="16" height="16">
								<use xlink:href="#people-circle"></use>
							</svg> <i class="bi bi-chat-dots"> 채팅</i>
				</a></li>

			</ul>

		</div>
	</div>
	</div>
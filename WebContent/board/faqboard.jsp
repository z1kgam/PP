<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주 묻는 질문</title>




<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<script type="text/javascript">
	$(function() {
		$(".bt").on(
				'click',
				function() {
					$(".card").attr("style", "display:none");
					var index = $(".bt").index(this);
					if (index == 0) {
						$(".card").attr("style", "display:flex");

					} else {
						index = index * 5;
						for (var i = 1; i < 6; i++) {
							$(".card:eq(" + (index - i) + ")").attr("style",
									"display:flex");
						}

					}

				});
		$("[name=searchbtn]").on(
				"click",
				function() {
					$(".card").attr("style", "display:none");
					var leng = $(".card").length;
					for (var i = 0; i < leng; i++) {

						var cardlink = $(".card-link:eq(" + i + ")").text();
						var cardbody = $(".card-body:eq(" + i + ")").text();
						var search = $("[name=search]").val();
						if (cardlink.indexOf(search) != -1
								|| cardbody.indexOf(search) != -1) {
							$(".card:eq(" + i + ")").attr("style",
									"display:flex");
						}

					}

				});
	});
</script>

</head>
<body>

	<%-- Top Start --%>
<%-- 	<jsp:include page="../include/Top.jsp"></jsp:include> --%>
	<%-- Top End --%>

	<div class="container-flude mb-3">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1 w-100" style="padding-top: 120px" >
				<a href="Board.Notice" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="ChatStart.chat" class="btn btn-dark w-100 mb-1">1:1 문의</a><br>
				<a href="../question/Cscenter.jsp" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="Question.Board" class="btn btn-dark w-100 mb-1">문의 게시판</a>
				<c:if test="${user_id == 'admin' }">
					<a href="ChattingSystem.jsp"  class="btn btn-danger mb-1 w-100">1:1문의시스템</a><br>
				</c:if>
			</div>

			<div class="col-sm-6 border pb-3 mt-2">
				<br>
				<h2 class="ml-3" align="center">자주 묻는 질문</h2>
				<br> <br>
				<div class="btn-group w-100">
					<a href="#" class="btn btn-dark btn-lg bt">전체</a> <a href="#" class="btn btn-dark btn-lg bt">티켓예매</a> 
					<a href="#" class="btn btn-dark btn-lg bt">취소/환불</a> <a href="#"	class="btn btn-dark btn-lg bt">티켓수령</a> 
					<a href="#" class="btn btn-dark btn-lg bt">회원</a> <a href="#" class="btn btn-dark btn-lg bt">이벤트</a>
				</div>
				<br> <br>
				<div class="row mx-2">
					<div class="input-group">
						<input type="text" class="form-control" name="search" placeholder="검색어">
						<div class="input-group-prepend">
							<span class="input-group-prepend"><button class="btn btn-danger" type="button" name="searchbtn">검색</button> </span>
						</div>
					</div>
				</div>
				<br> <br>
				<div id="service" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse1"> [티켓예매] 공연 예매는 어디서 할 수 있나요? </a>
						</div>
						<div id="collapse1" class="collapse" data-parent="#service">
							<div class="card-body">티켓예매는 티켓서비스 예매와 고객센터를 통한 예매가 가능합니다.
							<티켓서비스 예매>
							
							티켓에서는 PC와 Mobile에서 예매 서비스를 제공하고 있습니다.
							IE 10/11 및 크롬최신 버전 브라우저에 최적화되어 있으며 파이어폭스,Mac OS 환경에서는
							원활한 결제 기능을 지원하지 못하오니, 이점 양지하여 주시기 바랍니다.
							사용하시는 OS와 브라우저 환경을 확인하시어 이용에 차질 없으시길 바랍니다.
							자세한 예매방법은 이용안내 페이지를 통해 확인하실 수 있습니다
							이용안내 자세히보기>
							
							<전화예매>
							
							티켓 고객센터(1899-0042)를 통해 전화예매도 가능합니다.
							고객센터를 통해 예매 진행 시에는 장당 2,000원의 예매수수료가 부과됩니다.
							- 운영시간 : 평일,주말 09:00 -18:00 / 1899-0042(유료)
							* 휠체어석 예매는 멜론티켓 고객센터(1899-0042)로 문의 주시면 상세히 안내 드립니다.
							   (단, 공연에 따라 휠체어석 진행여부가 다를 수 있습니다.)
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse2"> [티켓예매] 공연예매 후 좌석을 변경할 수 있나요? </a>
						</div>
						<div id="collapse2" class="collapse" data-parent="#service">
							<div class="card-body">예매 완료 후에는 좌석을 변경할 수 없습니다.
							변경을 원하시는 경우 [마이티켓 > 예매/취소] 메뉴에서 해당 예매 건을 취소하시고 재 예매하셔야 합니다.
							예매 건을 취소하는 경우 예매수수료, 취소수수료는 멜론티켓 수수료 정책에 따라 발생합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse3"> [티켓예매] 모바일 티켓 예매는 어떻게 하나요? </a>
						</div>
						<div id="collapse3" class="collapse" data-parent="#service">
							<div class="card-body">내 멜론아이디와 통합된 카카오계정으로 모바일티켓이 발급됩니다.

							통합된 카카오계정이 없으면 모바일티켓을 예매가 불가능합니다.
							멜론 티켓 예매화면 > 배송/결제 단계에서 티켓수령방법을 ‘모바일티켓’으로 선택하고 결제를 완료 해주세요.
							예매하신 모바일티켓은 결제완료(입금완료) 기준으로 최대 1일이내 카카오콘으로 발급됩니다.
							(단, 현장수령만 가능한 공연의 경우 모바일 티켓 선택 불가합니다.)
							
							그 외 상세내용은 아래 링크에서 확인해주세요.
							
							- pc : https://ticket.melon.com/plan/mobileTicketGuide.htm
							- 모바일 : https://m.ticket.melon.com/public/index.html#plan.index?planId=100051
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse4"> [티켓예매] 무통장입금 결제수단은 언제까지 이용가능 한가요? </a>
						</div>
						<div id="collapse4" class="collapse" data-parent="#service">
							<div class="card-body">
							일반적으로 공연 관람일 4일 전 예매 시까지만 결제 수단으로 무통장입금 수단을 이용하실 수 있습니다.
							단, 공연상품별 결제가능일이 다를 수 있습니다.
							
							무통장입금으로 예매 한 경우, 입금 계좌와 금액이 SMS로 발송되며, 입금은 익일 오후 11시 59분까지만 가능합니다.
							단, 은행에 따라 오후 11시 30분 이후로는 온라인 입금이 제한될수 있습니다. 입금 전, 은행 이용 마감 시간을 꼭 확인해주세요.
							
							ATM기기로는 가상 계좌 입금이 불가할 수 있으므로 인터넷 뱅킹, 폰뱅킹 사용이 불가능한 경우엔 다른 결제 수단을 선택해 주시기 바랍니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse5"> [티켓예매] 무통장입금 시 예매자와 입금자가 달라도 되나요?</a>
						</div>
						<div id="collapse5" class="collapse" data-parent="#service">
							<div class="card-body">
							무통장입금 계좌는 예매 건별로 부여된 고유번호이기 때문에, 
							입금계좌와 입금액만 정확하다면 예매자와 입금자가 달라도 정상적으로 입금처리가 됩니다.
							단, 입금 완료 후 2시간 안에 입금 완료 문자가 발송되오니
							문자를 받지 못하신 경우 고객센터 또는 1:1문의하기로 문의해주시기 바랍니다.
							</div>
						</div>
					</div>

				</div>
				<div id="reserve" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse6"> [티켓예매] 배송지 변경이 가능한가요? </a>
						</div>
						<div id="collapse6" class="collapse" data-parent="#reserve">
							<div class="card-body">
							예매 전 기본 배송지는 [마이티켓 & 배송지 관리] 메뉴에서 확인 하실 수 있으며, 예매 후에는 [마이티켓 & 예매/취소] 메뉴를 통해 배송정보(수령인, 연락처, 주소)를 변경하실 수 있습니다. 단, 티켓이 발권된 이후에는 배송지 변경이 불가합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse7"> [티켓예매] 예매 가능한 결제수단이 어떤게 있나요? </a>
						</div>
						<div id="collapse7" class="collapse" data-parent="#reserve">
							<div class="card-body">
							저희티켓에서는 신용카드, 무통장입금, 휴대폰결제 총 3가지의 결제수단을 제공하고 있습니다.단,휴대폰결제는 당월 공연만 결제가 가능합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse8"> [티켓예매] 예매 완료 후에도 쿠폰을 적용할 수 있나요? </a>
						</div>
						<div id="collapse8" class="collapse" data-parent="#reserve">
							<div class="card-body">
							이미 예매/결제가 완료된 건에는 쿠폰을 적용할 수 없습니다.
							마이티켓의 예매/취소 내역에서 예매하셨던 내역을 취소한 후 재 예매하실 때에만 적용이 가능합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse9"> [티켓예매] 예매 후 결제수단 변경이 가능한가요? </a>
						</div>
						<div id="collapse9" class="collapse" data-parent="#reserve">
							<div class="card-body">
							무통장미입금 예매 건에 한해 신용카드로 변경이 가능합니다.단, 그 외에결제수단이나 할부 개월을 변경하시려면 예매 건을 취소하고,원하는 결제방법으로 재예매하셔야 합니다.
							(해당 공연의 취소마감시간이 남아 있는 경우에만 가능합니다.)
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse10"> [티켓예매] 예매 후에도, 관람일시를 변경할 수 있나요? </a>
						</div>
						<div id="collapse10" class="collapse" data-parent="#reserve">
							<div class="card-body">
							예매를 완료하신 후에는 공연 관람 일시를 변경할 수 없습니다.변경을 원하시는 경우 [마이티켓 > 예매/취소] 메뉴에서 해당 예매 건을 취소하시고 재 예매하셔야 합니다.예매 건을 취소하는 경우 예매수수료, 취소수수료는 멜론티켓 수수료 정책에 따라 발생합니다.
							</div>
						</div>
					</div>

				</div>
				<div id="pay" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse11"> [티켓예매] 예매내역은 어디에서 확인 가능한가요? </a>
						</div>
						<div id="collapse11" class="collapse" data-parent="#pay">
							<div class="card-body">
							마이티켓>예매확인/취소에서 확인 가능합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse12"> [티켓예매] 좌석을 선택한 상태에서 다른 사람이  먼저 예매할 수 있나요? </a>
						</div>
						<div id="collapse12" class="collapse" data-parent="#pay">
							<div class="card-body">
							동시 접속자 수가 많은 공연의 경우, 여러 회원들이 동일한 좌석을 중복 선택하실 수 있습니다.
							이런 경우 결제를 먼저 완료하는 회원이 좌석을 확보하게 됩니다.
							
							(단, 무통장입금으로 좌석을 예매하시면, 입금 마감시간 이전까지 
							다른 회원이 해당 좌석 좌석을 선택할 수 없습니다.)
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse13"> [티켓예매] 쿠폰은 어디서 발급받나요? </a>
						</div>
						<div id="collapse13" class="collapse" data-parent="#pay">
							<div class="card-body">
							쿠폰은 각종 이벤트 진행을 통해 발급하고 있습니다.
							비상시적으로 운영하는 이벤트 페이지를 통해 발급받으 실 수 있고,
							각 공연상품페이지에서 사용가능한 쿠폰을 받으실 수도 있습니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse14"> [티켓예매] 쿠폰은 어떻게 사용하나요? </a>
						</div>
						<div id="collapse14" class="collapse" data-parent="#pay">
							<div class="card-body">
							콘서트 결제 페이지에서, 쿠폰 영역에서 고객님이 보유중인 쿠폰 & 사용가능한 쿠폰을 보실 수 있습니다. 사용가능한 쿠폰 중, 이번 결제 건에서 사용을 원하시는 쿠폰을 선택하시면 사용됩니다. 다른 할인수단과 중복 사용이 불가할 수 있으니 참고해 주세요.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse15"> [티켓예매] 티켓예매는 언제까지 할 수 있나요? </a>
						</div>
						<div id="collapse15" class="collapse" data-parent="#pay">
							<div class="card-body">
							기본 예매 마감시간은 취소마감시간과 동일하게 진행하고 있습니다. [일요일~금요일 : 오후 17:00까지 / 토요일 : 오전 11:00까지]
							</div>
						</div>
					</div>
				</div>
				<div id="other" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse16"> [취소/환불] 티켓 취소를 하려면 어떻게 해야 되나요? </a>
						</div>
						<div id="collapse16" class="collapse" data-parent="#other">
							<div class="card-body">
							마이티켓>예매확인/취소 메뉴를 통해 취소를 진행하실 수 있습니다. 
							콜센터를 통해 예매를 진행하신 경우, 콜센터(1899-0042)로 문의하시면 상담원을 통해 취소하실 수 있습니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse17"> [취소/환불] 취소수수료는 어떻게 부과되나요? </a>
						</div>
						<div id="collapse17" class="collapse" data-parent="#other">
							<div class="card-body">
							취소시점에 따라 취소수수료가 다르게 부과됩니다.
							*상품 특성에 따라 취소수수료 정책이 달라질 수 있습니다.
							*취소 시 예매수수료는 환불되지 않으며 취소는 취소마감시간 이전까지만 가능합니다.
							*예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 관람일 기준의 취소수수료가 부과됩니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse18"> [취소/환불] 공연이 취소되었는데 이후 처리는 어떻게 되나요? </a>
						</div>
						<div id="collapse18" class="collapse" data-parent="#other">
							<div class="card-body">
							주최측의 사유로 공연이 취소될 경우, 결제하신 전체 금액을 환불해드리게 됩니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [취소/환불] 취소 마감 시간은 어떤건가요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							예매 건을 취소하실 수 있는 기한을 의미합니다.
							보통 공연관람 하루 전을 기준으로 하며, 자세한 시간은아래 이미지를 참고해주세요.
							취소 마감 시간 이후에는 예매와 취소가 모두 불가능합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse20"> [취소/환불] 배송 티켓을 수령한 후, 어떻게 취소할 수 있나요? </a>
						</div>
						<div id="collapse20" class="collapse" data-parent="#other">
							<div class="card-body">
							티켓을 배송받은 후 취소를 원하시는 경우, 상품의 취소마감시간 전까지 멜론티켓 고객센터로 반송해주셔야 합니다.
							티켓 반송 시 참고하셔야 하는 사항은 아래와 같습니다.
							
							- 해당 공연의 취소마감일시를 확인 후 아래 주소로 반송처리해 주세요
							
							  [고객센터(반송) 주소]
							서울특별시 중구 후암로 110 서울시티타워빌딩 2층 트랜스코스모스코리아 멜론티켓고객센터 앞
							
							- 티켓반송 시 반송 비용은 고객님께서 부담하셔야 하며, 티켓이 정확하게 도착되도록 등기우편을 이용해 주시기 바랍니다. 
							
							- 공연 전날이 휴일인 경우 공연 2일전 평일 오후5시, 토요일 11시까지 받으신 티켓을 보내주셔야 합니다. 
							
							- 부분취소를 원하실 경우 취소하실 티켓만 보내주시면 됩니다.
							  (단, 특정 가격에 따라 부분취소가 불가능하오니 고객센터를 통해 부분취소 여부를 문의해 주시기 바랍니다.)
							
							- 무통장입금으로 결제하신 경우, 반송하는 우편물 안에 예매자 본인 명의 계좌번호를 동봉하여 보내주시기 바랍니다.
							  (본인 명의 계좌번호를 보내주시지 않을 경우 환불이 지연될 수 있습니다.)
							
							- 취소 시 예매수수료와 취소수수료는 부담하셔야 하며, 배송비는 환불되지 않습니다. 
							  취소수수료는 멜론티켓 고객센터에 도착된 일자 기준으로 부과됩니다. 
							</div>
						</div>
					</div>
					
					
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [취소/환불] 쿠폰 적용한 결제 건을 취소하면 쿠폰은 복원되나요?  </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							할인 쿠폰을 적용한 예매 건을 결제 취소하면,
							사용 가능한 기간 내에 있는 할인쿠폰은 복원됩니다.
							할인 쿠폰을 적용한 예매 건은 전체 수량에 대한 취소만 가능하고
							부분 취소는 불가하니 참고해 주세요
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [티켓/수령] 모바일 티켓은 어디서 볼 수 있나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							카카오톡APP > 더보기 > 카카오콘 화면에서 카카오콘 서비스가입 후 모바일티켓을 확인할 수 있습니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [티켓/수령] 모바일 티켓은 전달은 어떻게 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							모바일 티켓 전달이 가능한 상품에 한하여 모바일 티켓 전달이 가능합니다.
							공연 별로 모바일티켓의 전달 가능기간이 상이 하니,모바일티켓을 전달하기 전에, 예매하신 공연의 상세페이지 > 공지 사항에서 모바일티켓 전달 가능기간 확인 부탁드립니다.
							카카오톡 모바일앱 > 더보기 탭 > 카카오콘에 발급된 모바일티켓 화면에서 [보내기] 버튼을 클릭하고, 모바일티켓을 전달하고 싶은 카카오톡 친구를 선택하세요.
							(최종 결제를 완료한 모바일티켓만 전달이 가능합니다.)
							다만, 전달 받은 티켓의 경우 티켓의 취소는 원 예매자만 가능합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [티켓/수령] 배송 신청을 했는데, 티켓은 언제쯤 받을 수 있나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							보통 결제 완료 후 영업일 기준 4-5일 이내에 받아보실 수 있습니다.
							일괄 배송 상품의 경우, 상품 페이지에서 공지된 일괄 배송일로부터 4-5일 정도 소요됩니다.
							(단, 공연에 따라 다소 차이가 발생될 수 있습니다.)
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [티켓/수령] 배송된 티켓은 본인수령만 가능한가요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							티켓은 유가증권으로 일반 우편물과 같이 부재 시 우편함에 넣을 수 없기 때문에 
							본인에게 직접 전달해 드리고 있습니다.
							부득이한 사정으로 본인수령이 어려울 경우 대리인이 서명 후 수령하실 수는 있습니다. 
							단, 수령 후 분실한 티켓은 재발권이 되지 않으며, 이 경우 공연 관람이 불가능하오니 티켓보관에 유의해주시기 바랍니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [티켓/수령] 티켓 분실 시 재발권이 가능한가요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
								티켓은 재발권이 불가능합니다. 티켓 보관에 유의해주시기 바랍니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 19금 공연을 예매하고 싶은데 어떻게 해야 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							19금 공연은 청소년보호법에 의해 19세 이상일 경우에 한하여 이용 할 수 있습니다.
							
							저희티켓에서는 성인인증을 통해 19세 이상 나이 확인을 하고 있으며,
							19금 컨텐츠 마크가 표기된 공연을 예매 시 성인인증을 할 수 있습니다.
							성인인증은 본인명의 휴대폰인증을 통해 진행되며
							
							성인인증을 통해 확인 된 나이가 19세 이상이면 19금 공연 예매가 가능하며, 19세 미만일 경우 이용이 불가합니다.
							단, 마지막 본인인증 완료 날짜가 1년을 초과했을 경우, 성인 재인증 후 19금 공연을 예매하실 수 있습니다.  
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 개명을 했어요. 회원정보에서 이름을 변경하려면 어떻게 해야 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							이름변경을 진행하기 전에 반드시 본인명의 휴대폰통신사에 개명신청이 되어 있어야 합니다.
							단, 개명과 함께 주민등록번호가 변경된 경우는 고객센터 문의전화 1566-7727(유료)로 문의 바랍니다.
							
							1. 카카오계정으로 신규가입/통합하여 사용중인 회원(카카오계정으로 로그인한 경우만 진입 가능)
							  - 모바일 : 내 정보 > 카카오계정 관리 > 본인인증 > 개명하셨나요? 에서 진행해 주세요.
							
							2. 아이디/비밀번호를 사용 중인 회원
							  - 내 정보 > 정보수정 > 본인인증에서 진행해 주세요
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 회원가입은 어떻게 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							저희 티켓사이트 메인 상단에 [회원가입]을 통하여 회원가입 하실 수 있습니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 회원탈퇴는 어떻게 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							저희 사이트 회원가입으로 서비스 이용 중이시라면 내 정보 > 정보수정 > 탈퇴 에서 회원탈퇴하실 수 있습니다.
							탈퇴 후에는 회원님의 이용정보가 삭제되어 복구가 불가능하오니 아래 안내사항을 꼭 확인하신 후 신중히 선택하시기 바랍니다.
							- 회원정보 및 개인 이용기록 삭제 안내 회원정보 및 개인 이용기록은 모두 삭제되며, 삭제된 데이터는 복구 불가능합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 비밀번호를 잊어버렸어요. 어떻게 확인할 수 있나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							비밀번호 찾기를 통해 본인임이 확인되면 비밀번호를 즉시 변경하실 수 있습니다.

							1. 회원정보에 등록된 정보(휴대폰번호, 이메일)로 찾기
							
							① 아이디/이름/회원정보에 등록된 정보(휴대폰번호 또는 이메일)를 입력 후 인증번호를 요청해주세요.
							   회원정보에 등록된 정보와 다를 경우, 본인확인이 완료되지 않았기 때문에 인증번호를 받을 수 없습니다.
							②입력하신 인증번호가 정확할 경우, 비밀번호를 변경할 수 있습니다.
							
							2. 본인확인(본인명의 휴대폰인증) 정보로 찾기
							
							① 본인확인(실명인증)이 완료된 아이디는 본인명의 휴대폰인증을 통해 찾을 수 있습니다.
							   해당 인증방법은 본인확인이 완료된 아이디에 한하여 제공됩니다.
							② 본인확인 정보와 동일한 정보가 있을 경우, 비밀번호 재설정을 진행할 수 있습니다.
							
							* 회원정보가 정확하지 않거나 본인확인 정보가 없는 아이디는 아이디/비밀번호 찾기를 진행할 수 없습니다.
							</div>
						</div>
					</div>
					
					
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 아이디를 잊어버렸어요. 어떻게 확인할 수 있나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							1. 회원정보에 등록된 정보(휴대폰번호, 이메일)로 찾기

							① 인증번호를 수신하실 수 있는 방법(휴대폰번호 또는 이메일)을 선택 후 인증번호를 요청해주세요.
							입력하신 휴대폰번호, 이메일 정보와 이름이 동일할 경우 인증번호를 발송해 드립니다.
							② 입력하신 인증번호가 정확할 경우, 아이디 확인할 수 있습니다.
							
							2. 본인확인(본인명의 휴대폰인증) 정보로 찾기
							
							① 본인확인(실명인증)이 완료된 아이디는 본인명의 휴대폰인증을 통해 찾을 수 있습니다.
							② 아이디 찾기를 진행하신 본인확인 정보와 동일한 정보가 있을 경우, 아이디 확인할 수 있습니다.
							
							* 회원정보가 정확하지 않거나 본인확인 정보가 없는 아이디는  아이디/비밀번호 찾기를 진행할 수 없습니다.
							</div>
						</div>
					</div><div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 제 명의의 휴대폰이 아니라도 휴대폰 인증이 가능한가요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							네, 가능합니다. 회원정보의 휴대폰 번호는 연락처의 개념으로 결제와 관련된 것이 아니기 때문에 명의자 본인에 대한 정보입력 없이 인증번호 입력만으로 휴대폰번호 등록이 가능합니다.
							</div>
						</div>
					</div><div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [회원] 회원가입과 로그인을 하지 않고 예매할 수 있나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							해당 회원만 저희 티켓의 PC/모바일 서비스를 통해 예매 서비스를 이용하실 수 있습니다.
							</div>
						</div>
					</div><div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [이벤트] 제가 응모한 이벤트 당첨여부를 확인하고 싶어요. </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							로그인 후 [이벤트] - [참여 이벤트] 메뉴에서 당첨 내역을 확인하실 수 있습니다.
							</div>
						</div>
					</div><div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> 
							<a class="card-link" data-toggle="collapse" href="#collapse19"> [이벤트] 현재 진행되고 있는 이벤트는 어디서 확인하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">
							티켓 서비스 메뉴에 있는 [이벤트] 에서 전체 이벤트 내용을 확인할 수 있습니다. 각 이벤트 페이지의 이벤트 기간 및 사은품 등 공지내용을 꼭 확인하시고 구매 이용해 주시기 바랍니다.
							</div>
						</div>
					
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<%-- Footer Start --%>
<%-- 	<jsp:include page="../include/Footer.jsp"></jsp:include> --%>
	<%-- Footer End --%>

</body>
</html>
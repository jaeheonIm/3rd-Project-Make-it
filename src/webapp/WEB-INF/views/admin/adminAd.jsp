<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<title>Admin</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/common/AdminHeader.jsp"%>
<script>
function updateGo(Idx) {
	console.log(Idx);
	if (!confirm('승인하시겠습니까?')) {
        alert('취소되었습니다.');
    } else {
		vo = {};
		vo.adIdx = Idx;
		console.log(vo);
		$.ajax("adCheckUpdate.do", {
			type: "post",
			data: JSON.stringify(vo),
			contentType: "application/json",
			async:false,
			success: function(data){
				if (data != null) {
					console.log(data);
					alert('승인되었습니다');
					let buttonHtml="";
					$.each(data, function(index, item){
						buttonHtml += "<tr><td>" + item.adIdx + "</td>";
						buttonHtml += "<td><a href='productDetailView.do?fundIdx=" +item.fundIdx+ "'>" + item.fundTitle + "</a></td>";
						buttonHtml += "<td>" + item.memberId + "</td>";
						buttonHtml += "<td>" + item.fundCategory + "</td>";
						buttonHtml += "<td>" + item.adStartDate + "</td>";
						buttonHtml += "<td>" + item.adEndDate + "</td>";
						buttonHtml += "<td>" + item.adPosition + "</td>";
						buttonHtml += "<td>" + item.adPrice + "</td>";
						buttonHtml += "<td style='text-align: center;'>";
						if (item.adCheck == 0) {
							buttonHtml += "<button id='ok' type='button' class='btn btn-primary btn-sm' value='" + item.adIdx + "'onclick='javascript:updateGo("+this.adIdx+");'>승인</button>";
						} else if (item.adCheck == 1) {
							buttonHtml += "<button id='ok' type='button' class='btn btn-primary btn-sm' value='" + item.adIdx + "'onclick='javascript:updateZero("+this.adIdx+");'>취소</button>";
						} else if (item.adCheck > 1) {
							buttonHtml += "<button id='ok' type='button' class='btn btn-primary btn-sm'>결제완료</button>";
						}
						buttonHtml += "</td></tr>";
						$('#Check').html(buttonHtml);
					});
				}	
			},
			error: function(){
				alert("실패~~");
			}
		});
    }
}
function updateZero(Idx) {
	console.log(Idx);
	if (!confirm('취소하시겠습니까?')) {
        alert('취소되었습니다.');
    } else {
		vo = {};
		vo.adIdx = Idx;
		console.log(vo);
		$.ajax("adCheckUpdate2.do", {
			type: "post",
			data: JSON.stringify(vo),
			contentType: "application/json",
			async:false,
			success: function(data){
				if (data != null) {
					console.log(data);
					alert('승인이 취소되었습니다');
					let buttonHtml="";
					$.each(data, function(index, item){
						buttonHtml += "<tr><td>" + item.adIdx + "</td>";
						buttonHtml += "<td><a href='productDetailView.do?fundIdx=" +item.fundIdx+ "'>" + item.fundTitle + "</a></td>";
						buttonHtml += "<td>" + item.memberId + "</td>";
						buttonHtml += "<td>" + item.fundCategory + "</td>";
						buttonHtml += "<td>" + item.adStartDate + "</td>";
						buttonHtml += "<td>" + item.adEndDate + "</td>";
						buttonHtml += "<td>" + item.adPosition + "</td>";
						buttonHtml += "<td>" + item.adPrice + "</td>";
						buttonHtml += "<td style='text-align: center;'>";
						if (item.adCheck == 0) {
							buttonHtml += "<button id='ok' type='button' class='btn btn-primary btn-sm' value='" + item.adIdx + "'onclick='javascript:updateGo("+this.adIdx+");'>승인</button>";
						} else if (item.adCheck == 1) {
							buttonHtml += "<button id='ok' type='button' class='btn btn-primary btn-sm' value='" + item.adIdx + "'onclick='javascript:updateZero("+this.adIdx+");'>취소</button>";
						} else if (item.adCheck > 1) {
							buttonHtml += "<button id='ok' type='button' class='btn btn-primary btn-sm'>결제완료</button>";
						}
						buttonHtml += "</td></tr>";
						$('#Check').html(buttonHtml);
					});
				}	
			},
			error: function(){
				alert("실패~~");
			}
		});
    }
}
</script>	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">광고</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">광고승인 및 광고 매출을 확인할 수 있습니다</li>
				</ol>
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 월 매출 현황
							</div>
							<div class="card-body">
								<canvas id="myAreaChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 일 매출 현황
							</div>
							<div class="card-body">
								<canvas id="areaChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 광고 승인 현황
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>Idx</th>
									<th>Title</th>
									<th>ID</th>
									<th>Category</th>
									<th>StartDate</th>
									<th>EndDate</th>
									<th>Position</th>
									<th>Price</th>
									<th>Approve</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Idx</th>
									<th>Title</th>
									<th>ID</th>
									<th>Category</th>
									<th>StartDate</th>
									<th>EndDate</th>
									<th>Position</th>
									<th>Price</th>
									<th>Approve</th>
								</tr>
							</tfoot>
							<tbody id="Check">
								<c:if test="${ empty adminAd}">
									<tr>
										<td>데이터가 없습니다</td>
									</tr>
								</c:if>
								<c:if test="${ not empty adminAd}">
									<c:forEach var="list" items="${adminAd}">
										<tr>
											<td>${list.adIdx}</td>
											<td><a href="productDetailView.do?fundIdx=${list.fundIdx }">${list.fundTitle}</a></td>
											<td>${list.memberId}</td>
											<td>${list.fundCategory}</td>
											<td>${list.adStartDate }</td>
											<td>${list.adEndDate }</td>
											<td>${list.adPosition }</td>
											<td>${list.adPrice }</td>
											<td style="text-align: center;">
												<c:if test="${list.adCheck == 0 }">
													<button id='ok' type='button' class='btn btn-primary btn-sm' value='${list.adIdx }' onclick='javascript:updateGo(this.value);'>승인</button>
												</c:if>
												<c:if test="${list.adCheck == 1 }">
													<button id='ok' type='button' class='btn btn-primary btn-sm' value='${list.adIdx }' onclick='javascript:updateZero(this.value);'>취소</button>
												</c:if>
												<c:if test="${list.adCheck > 1 }">
													<button id='ok' type='button' class='btn btn-primary btn-sm'>결제완료</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="js_jh/scripts.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
<script>
window.addEventListener('DOMContentLoaded', event => {

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple);
    }
    
});

var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ["${getAdMonth[0].monthDate}", "${getAdMonth[1].monthDate}", "${getAdMonth[2].monthDate}", "${getAdMonth[3].monthDate}", "${getAdMonth[4].monthDate}", "${getAdMonth[5].monthDate}", "${getAdMonth[6].monthDate}", "${getAdMonth[7].monthDate}", "${getAdMonth[8].monthDate}", "${getAdMonth[9].monthDate}", "${getAdMonth[10].monthDate}", "${getAdMonth[11].monthDate}", "${getAdMonth[12].monthDate}"],
    datasets: [{
      label: "월 매출액",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [${getAdMonth[0].adMonthPrice}, ${getAdMonth[1].adMonthPrice}, ${getAdMonth[2].adMonthPrice}, ${getAdMonth[3].adMonthPrice}, ${getAdMonth[4].adMonthPrice}, ${getAdMonth[5].adMonthPrice}, ${getAdMonth[6].adMonthPrice}, ${getAdMonth[7].adMonthPrice}, ${getAdMonth[8].adMonthPrice}, ${getAdMonth[9].adMonthPrice}, ${getAdMonth[10].adMonthPrice}, ${getAdMonth[11].adMonthPrice}, ${getAdMonth[12].adMonthPrice}],
    },{
        label: '월 평균 매출액',
        type : 'line',
        fill : false,
        borderColor: 'rgb(255, 204, 102)',
        data: [${getAdMonth[0].adMonthAvg}, ${getAdMonth[1].adMonthAvg}, ${getAdMonth[2].adMonthAvg}, ${getAdMonth[3].adMonthAvg}, ${getAdMonth[4].adMonthAvg}, ${getAdMonth[5].adMonthAvg}, ${getAdMonth[6].adMonthAvg}, ${getAdMonth[7].adMonthAvg}, ${getAdMonth[8].adMonthAvg}, ${getAdMonth[9].adMonthAvg}, ${getAdMonth[10].adMonthAvg}, ${getAdMonth[11].adMonthAvg}, ${getAdMonth[12].adMonthAvg}]
    }]
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
         
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 10000000,
          stepSize: 2000000,
          callback: function(value, index, ticks) {
              return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
          }
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: { 
        callbacks: { 
            label: function(tooltipItem, data) { //그래프 콤마
                return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
                } 
	    	},
    }
  }
});

var ctx2 = document.getElementById("areaChart");
var myLineChart = new Chart(ctx2, {
  type: 'bar',
  data: {
    labels: ["${getAdDaily[0].dailyDate}", "${getAdDaily[1].dailyDate}", "${getAdDaily[2].dailyDate}", "${getAdDaily[3].dailyDate}", "${getAdDaily[4].dailyDate}", "${getAdDaily[5].dailyDate}", "${getAdDaily[6].dailyDate}", "${getAdDaily[7].dailyDate}", "${getAdDaily[8].dailyDate}", "${getAdDaily[9].dailyDate}", "${getAdDaily[10].dailyDate}", "${getAdDaily[11].dailyDate}", "${getAdDaily[12].dailyDate}"],
    datasets: [{
      label: "일 매출액",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [${getAdDaily[0].adDailyPrice}, ${getAdDaily[1].adDailyPrice}, ${getAdDaily[2].adDailyPrice}, ${getAdDaily[3].adDailyPrice}, ${getAdDaily[4].adDailyPrice}, ${getAdDaily[5].adDailyPrice}, ${getAdDaily[6].adDailyPrice}, ${getAdDaily[7].adDailyPrice}, ${getAdDaily[8].adDailyPrice}, ${getAdDaily[9].adDailyPrice}, ${getAdDaily[10].adDailyPrice}, ${getAdDaily[11].adDailyPrice}, ${getAdDaily[12].adDailyPrice}],
    },{
        label: '일 평균 매출액',
        type : 'line',
        fill : false,
        borderColor: 'rgb(255, 204, 102)',
        data: [${getAdDaily[0].adDailyAvg}, ${getAdDaily[1].adDailyAvg}, ${getAdDaily[2].adDailyAvg}, ${getAdDaily[3].adDailyAvg}, ${getAdDaily[4].adDailyAvg}, ${getAdDaily[5].adDailyAvg}, ${getAdDaily[6].adDailyAvg}, ${getAdDaily[7].adDailyAvg}, ${getAdDaily[8].adDailyAvg}, ${getAdDaily[9].adDailyAvg}, ${getAdDaily[10].adDailyAvg}, ${getAdDaily[11].adDailyAvg}, ${getAdDaily[12].adDailyAvg}]
    }]
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 10000000,
          stepSize: 2000000,
          callback: function(value, index, ticks) {
              return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
          }
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: { 
        callbacks: { 
            label: function(tooltipItem, data) { //그래프 콤마
                return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
                } 
	    	},
    }
  }
});


</script>
</body>
</html>
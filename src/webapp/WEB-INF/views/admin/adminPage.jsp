<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="/common/AdminHeader.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">매출현황</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">매출현황 및 인기상품을 확인할 수 있습니다</li>
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
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> 스토어 인기 카테고리 현황
							</div>
							<div class="card-body">
								<canvas id="myPieChart" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-pie me-1"></i> 펀드 인기 카테고리 현황
							</div>
							<div class="card-body">
								<canvas id="pieChart" width="100%" height="50"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 인기 판매 순위
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>Rank</th>
									<th>Title</th>
									<th>Price</th>
									<th>Category</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Rank</th>
									<th>Title</th>
									<th>Price</th>
									<th>Category</th>
								</tr>
							</tfoot>
							<tbody>
								<c:if test="${ empty rank}">
									<tr>
										<td>데이터가 없습니다</td>
									</tr>
								</c:if>
								<c:if test="${ not empty rank}">
									<c:forEach var="list" items="${rank}">
										<tr>
											<td>${list.rank}</td>
											<td><a href="detail.do?storeIdx=${list.storeIdx }">${list.storeTitle}</a></td>
											<td><fmt:formatNumber value="${list.storePrice}"/></td>
											<td>${list.storeCategory}</td>
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
	<script src="js_jh/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<!-- <script src="js_jh/datatables-simple-demo.js"></script> -->
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
    labels: ["${getMonth[0].monthDate}", "${getMonth[1].monthDate}", "${getMonth[2].monthDate}", "${getMonth[3].monthDate}", "${getMonth[4].monthDate}", "${getMonth[5].monthDate}", "${getMonth[6].monthDate}", "${getMonth[7].monthDate}", "${getMonth[8].monthDate}", "${getMonth[9].monthDate}", "${getMonth[10].monthDate}", "${getMonth[11].monthDate}", "${getMonth[12].monthDate}"],
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
      data: [${getMonth[0].monthPrice}, ${getMonth[1].monthPrice}, ${getMonth[2].monthPrice}, ${getMonth[3].monthPrice}, ${getMonth[4].monthPrice}, ${getMonth[5].monthPrice}, ${getMonth[6].monthPrice}, ${getMonth[7].monthPrice}, ${getMonth[8].monthPrice}, ${getMonth[9].monthPrice}, ${getMonth[10].monthPrice}, ${getMonth[11].monthPrice}, ${getMonth[12].monthPrice}],
    },{
        label: '월 평균 매출액',
        type : 'line',
        fill : false,
        borderColor: 'rgb(255, 204, 102)',
        data: [${getMonth[0].monthAvg}, ${getMonth[1].monthAvg}, ${getMonth[2].monthAvg}, ${getMonth[3].monthAvg}, ${getMonth[4].monthAvg}, ${getMonth[5].monthAvg}, ${getMonth[6].monthAvg}, ${getMonth[7].monthAvg}, ${getMonth[8].monthAvg}, ${getMonth[9].monthAvg}, ${getMonth[10].monthAvg}, ${getMonth[11].monthAvg}, ${getMonth[12].monthAvg}]
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
    labels: ["${getDaily[0].dailyDate}", "${getDaily[1].dailyDate}", "${getDaily[2].dailyDate}", "${getDaily[3].dailyDate}", "${getDaily[4].dailyDate}", "${getDaily[5].dailyDate}", "${getDaily[6].dailyDate}", "${getDaily[7].dailyDate}", "${getDaily[8].dailyDate}", "${getDaily[9].dailyDate}", "${getDaily[10].dailyDate}", "${getDaily[11].dailyDate}", "${getDaily[12].dailyDate}"],
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
      data: [${getDaily[0].dailyPrice}, ${getDaily[1].dailyPrice}, ${getDaily[2].dailyPrice}, ${getDaily[3].dailyPrice}, ${getDaily[4].dailyPrice}, ${getDaily[5].dailyPrice}, ${getDaily[6].dailyPrice}, ${getDaily[7].dailyPrice}, ${getDaily[8].dailyPrice}, ${getDaily[9].dailyPrice}, ${getDaily[10].dailyPrice}, ${getDaily[11].dailyPrice}, ${getDaily[12].dailyPrice}],
    },{
        label: '일 평균 매출액',
        type : 'line',
        fill : false,
        borderColor: 'rgb(255, 204, 102)',
        data: [${getDaily[0].dailyAvg}, ${getDaily[1].dailyAvg}, ${getDaily[2].dailyAvg}, ${getDaily[3].dailyAvg}, ${getDaily[4].dailyAvg}, ${getDaily[5].dailyAvg}, ${getDaily[6].dailyAvg}, ${getDaily[7].dailyAvg}, ${getDaily[8].dailyAvg}, ${getDaily[9].dailyAvg}, ${getDaily[10].dailyAvg}, ${getDaily[11].dailyAvg}, ${getDaily[12].dailyAvg}]
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

//파이
var ctx3 = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx3, {
  type: 'pie',
  data: {
    labels: ["${getPie[0].category}", "${getPie[1].category}", "${getPie[2].category}", "${getPie[3].category}" , "${getPie[4].category}", "${getPie[5].category}", "${getPie[6].category}" ],
    datasets: [{
      data: [${getPie[0].categoryCnt}, ${getPie[1].categoryCnt}, ${getPie[2].categoryCnt}, ${getPie[3].categoryCnt}, ${getPie[4].categoryCnt}, ${getPie[5].categoryCnt}, ${getPie[6].categoryCnt}],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#7E5917', '#757E17', '#7E172B'],
    }],
  },
});

var ctx4 = document.getElementById("pieChart");
var myPieChart = new Chart(ctx4, {
  type: 'pie',
  data: {
    labels: ["${getFundPie[0].fundCategory}", "${getFundPie[1].fundCategory}", "${getFundPie[2].fundCategory}", "${getFundPie[3].fundCategory}", "${getFundPie[4].fundCategory}", "${getFundPie[5].fundCategory}", "${getFundPie[6].fundCategory}"],
    datasets: [{
      data: [${getFundPie[0].fundCategoryCnt}, ${getFundPie[1].fundCategoryCnt}, ${getFundPie[2].fundCategoryCnt}, ${getFundPie[3].fundCategoryCnt}, ${getFundPie[4].fundCategoryCnt}, ${getFundPie[5].fundCategoryCnt}, ${getFundPie[6].fundCategoryCnt}],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#7E5917', '#757E17', '#7E172B'],
    }],
  },
});

</script>
</body>
</html>
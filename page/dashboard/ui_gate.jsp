<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>대시보드 - Aegis</title>
	<meta charset="UTF-8" http-equiv="Content-Type">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=3.0">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no" />
	
	<!-- TODO: search engine info -->
	<meta name="robots" content="Aegis" />
	<meta name="keywords" content="Aegis" />
	<meta name="title" content="Aegis" />
	<meta name="description" content="Aegis" />
	
	<!-- TODO: social url link image -->
	<meta property="og:url" content="">
	<meta property="og:title" content="Aegis">
	<meta property="og:type" content="website">
	<meta property="og:image" content="">
	<meta property="og:description" content="Aegis 홈페이지입니다.">
	
	<!-- TODO: favicon -->
	<link rel="icon" href="./assets/images/favicon.png" type="image/png" />
	
	<!-- TODO: import -->
	<%@ include file="/page/layout/common_sample.jsp"%>
	
	<script src="./js/common/page_common.js?v=${version}"></script>
    
	<script src="./js/service/dashboards/dashboardChart.js?v=${version}"></script>
	<script src="./js/service/dashboards/dashboard.js?v=${version}"></script>
	
	<!-- 230103 Image Security 추가 -->
	<script src="./js/service/dashboards/imageSecurity/dashboardScanStatus.js?v=${version}"></script>
	<script src="./js/service/dashboards/clusterCompliance/dashboardClusterComplianceChart.js?v=${version}"></script>
	
	<script type="text/javascript">
    function createDim(){
        if (!$('.dim').length) {
            $('body').append('<div class="dim"></div>');
        }
        $('.dim').fadeIn(250);
        if (window.matchMedia('(min-width: 1340px) and (max-width: 1920px)').matches){
            $('body').css({
                overflow : 'hidden'
            }).bind('touchmove', function(e) {
                e.preventDefault();
            });
        }
        if (window.matchMedia('(min-width: 0) and (max-width: 1340px)').matches){
            $('body').css({
                overflowX : 'scroll'
            }).bind('touchmove', function(e) {
                e.preventDefault();
            });
        }
    }
    function removeDim(){
        $('.dim').fadeOut(250);
        if (window.matchMedia('(min-width: 1340px) and (max-width: 1920px)').matches){
            $('body').css({
                overflow : 'inherit'
            }).bind('touchmove', function(e) {
                e.preventDefault();
            });
        }
        if (window.matchMedia('(min-width: 0) and (max-width: 1340px)').matches){
            $('body').css({
                overflowX : 'auto'
            }).bind('touchmove', function(e) {
                e.preventDefault();
            });
        }
    }
    </script>
</head>
<body>

<h1>Aegis ADMIN</h1>
<div class="skip_navigation">
	<ul>
		<li>
			<a href="#Content" class="go_content">본문 바로가기</a>
		</li>
		<li>
			<a href="#Gnb">메뉴 바로가기</a>
		</li>
	</ul>
</div>

<jsp:include page="/page/layout/sidebar_sample.jsp" flush="false">
	<jsp:param name="menuId" value="dashboard" />
</jsp:include>

<jsp:include page="/page/layout/topbar_sample.jsp" flush="false">
	<jsp:param name="menuId" value="dashboard" />
</jsp:include>
	

<section class="dashboard mscrollbar">
	<div class="dashboard_main">
		<div class="tab_box">
			<a href="#" class="prev-slide" style="display:none;">왼쪽으로</a>
			<div class="tab">
			<ul class="tab_lst" style="max-width: calc(100% - 42px);">
				<li onclick="javascript:lf_tabEventClickLoadDashboard(1);" ondblclick="javascript: lf_openTabEditDialog(this);" rel="dashboardTabMgmt_1" class="on open">
				<a href="#" class="tab_link" title="">Dashboard1</a>
				<a href="#" onclick="javascript: lf_openDashboardFullWindow();" class="full" title="새창열기">새창열기</a>
				<a href="#" onclick="javascript: lf_removeTab(1);" class="tab_cls">close</a>
				</li><li onclick="javascript: lf_tabEventClickLoadDashboard(2);" ondblclick="javascript: lf_openTabEditDialog(this);" rel="dashboardTabMgmt_2" class="on">
				<a href="#" class="tab_link" title="">Dashboard2</a>
				<a href="#" onclick="javascript: lf_openDashboardFullWindow();" class="full" title="새창열기">새창열기</a>
				<a href="#" onclick="javascript: lf_removeTab(2);" class="tab_cls">close</a>
				</li>
			</ul>
			<a href="#" class="tab_add" onclick="javascript: lf_tabadd();">
				<span>탭 추가</span>
			</a>
			</div>
			<a href="#" class="next-slide" style="display:none;">오른쪽으로</a>
			<%--<div class="tab_set">
				<a href="#" class="tab_set_btn">설정</a>
				<div class="tab_set_list">
					<ul>
						<li><a href="#" class="tab_cls_on">탭 삭제</a></li>
						<li><a href="#" class="tab_edit_on">탭 이름 변경</a></li>
					</ul>
				</div>
			</div>	--%>
		</div>
		<!-- s:컨텐츠 내용-->
		<div id="dashboardTabMgmt" class="tab_container">
			<div class="dashboardTabMgmt_1 tab_cont open">
				<div class="dashboard_box">
					<div class="dashboard_box_top">
						<div class="dashboard_title">
							<h3>Dashboard1</h3>
						</div>
						<div class="dashboard_btn_box">
							<a href="#" onclick="javascript: lf_dashboardCreateChart();" class="btn bline" title="차트 &amp; 데이터 선택"><span>차트 &amp; 데이터</span></a>
							<a href="#" onclick="javascript: lf_dashboardAllConfiguration(this);" class="btn bline" title="자동 리로딩 설정"><span>리로딩설정</span></a>
							<a href="#" onclick="javascript:lf_removeChartAll();" class="btn del" title="전체 삭제"><span>삭제</span></a><!-- 2023-10-11 save -> del로 교체-->
						</div>
					</div>
					<div class="dashboard_option_select_box">

						<div class="dashboard_box_registry">
							<div class="registry_title">
								<p>Registry</p>
							</div>
							<div class="registry_select_box sel_box">
								<select class="popup_sel registryList" onchange="registryChangeEvent()">
									<option value="de71636f-7e48-4a79-914f-727dc0a8edb4">sga-solregistry2</option>
									<option value="4d842add-ad81-4e7d-a7fb-c39c836dabe2">sga-solregistry</option>
									<option value="4e1d4b15-a3ce-4358-9f34-28bdf9c8ee63">sga-solregistry3</option>
									<option value="887dc39c-401f-4ad3-857a-48bb39f10c34">63-regi-test</option>
								</select>
							</div>
						</div><!--//dashboard_box_registry-->
		
						<div style="display:none" class="dashboard_box_cluster">
							<div class="cluster_title">
								<p>Cluster</p>
							</div>
							<div class="cluster_select_box sel_box">
								<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
								<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
								<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
								<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
								<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
								</select>
							</div>
						</div><!--//dashboard_box_cluster-->
					</div><!--//dashboard_option_select_box-->

					<div class="dashboard_box_cont">
						<ul class="dashboard_cont ui-sortable">
							<li class="w_25 ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">1</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div>
									<!-- s : 게이지 테스트-->
									 <div id="chart-container" class="gauge_box" style="height:350px">
											<script>
											var dom = document.getElementById('chart-container');
var myChart = echarts.init(dom, null, {
  renderer: 'canvas',
  useDirtyRect: false
});
var app = {};
var option;
option = {
	color: ["#55BC55", "#E01E5F"],

  
  legend: {
    /*data: ['Email', 'Union Ads'],
	label: ['12', '12'],
	icon : 'none',
	textStyle : {
					color : '#fff',
					fontWeight: 500,
					fontSize : 12,
					padding:10,
					backgroundColor:['red','blue'],
					borderRadius: [30, 30, 30, 30],
				},*/

	icon: 'none',
    label: '212',
	date: ['Email', 'Union Ads'],
	/*formatter: function(name){
		 return name+'\n'+label2[name];
		 },*/
	
    //orient: 'vertical',

	   formatter: (name) => {
	        var label2 = {'Email':'7.6K (32%)', 'Union Ads':'21.6K (68%)'};
      		return name + '\n' + label2[name];
        },
   
    textStyle: {
        color: "#fff",
		fontWeight: 500,
		fontSize : 12,
		padding:10,
		backgroundColor:['red','blue'],
		borderRadius: [30, 30, 30, 30]
	}
},
 
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },

  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: 'Email',
      type: 'line',
      stack: 'Total',
      data: [120, 132, 101, 134, 90, 230, 210],
		
    },
    {
      name: 'Union Ads',
      type: 'line',
      stack: 'Total',
      data: [220, 182, 191, 234, 290, 330, 310]
    }
  ]
};

if (option && typeof option === 'object') {
  myChart.setOption(option);
}

window.addEventListener('resize', myChart.resize);
											</script>
										</div>
										<!-- e: jung 2023-10-24 : 컨텐츠 내용 -->
									</div>
								</div>
							</li>
							
							<!-- e : 2023-10-24 jung 작업시작-->
														
														
														
					</ul>
                </div><!--//dashboard_box_cont-->
				</div><!--//dashboard_box-->
			</div><!--//tab_cont-->
			
        </div>

</div>
		<!-- e:컨텐츠 내용-->
										
									<!-- e : 게이지 테스트-->	
									</div>
								</div>
							</li>

							<li class="w_75 h_2n ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">2</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div></div>
								</div>
							</li>

							<li class="w_25 ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">3</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div></div>
								</div>
							</li>

							<li class="w_25 ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">4</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div></div>
								</div>
							</li>

							<li class="w_25 ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">5</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div></div>
								</div>
							</li>

							<li class="w_50 ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">6</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div></div>
								</div>
							</li>

							<li class="w_25 ui-sortable-handle">
								<div class="dashboard_cont_top">
							
									<div class="cluster_select_box sel_box">
										<h4 class="cont_title">7</h4>
										<select class="popup_sel cluster_list" onchange="clusterChangeEvent()">
										<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Cluster-61</option>
										<option value="2f4b443e-d0c4-455f-9664-c6f6fbe5f5d1">Cluster-67</option>
										<option value="a75a5634-7d01-4eb4-9c49-8ad8259bd937">dev-k8s</option>
										<option value="ddf01bce-f79c-4dfb-b1c8-777778e04ab7">K8S v1.19.14_Cluster</option>
										</select>
									</div>
							

									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected">Day</li>
													<li data-value="WEEK" class="option">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li>
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li>
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li>
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_top5_box">
									<div></div>
								</div>
							</li>
								
														
														
					</ul>
                </div><!--//dashboard_box_cont-->
				</div><!--//dashboard_box-->
			</div><!--//tab_cont-->
			
        </div>

</div>
		<!-- e:컨텐츠 내용-->
	</div>
</section>

<input id="dashboardData" type="hidden"></input>
<!-- 삭제 필요. dashboardCspData에 데이터 저장하도록 로직 수정 필요 -->
<input id="dashboardScanCount" type="hidden"/>
<!-- 0808 추가. 차트 상세보기 데이터 저장 -->
<input id="dashboardCspData" type="hidden"></input>
<input id="complianceDetailData" type="hidden"/>



</body>
</html>

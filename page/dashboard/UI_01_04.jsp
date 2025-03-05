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
	

<section class="renewal dashboard mscrollbar">
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
							<li class="w_100 ui-sortable-handle">
								<div class="dashboard_cont_top">
									<h4 class="cont_title">Evaluation trend</h4>
									<div class="cont_btn_box">
										<div class="sel_box fl" style="padding: 10px 10px 10px 10px;">
											<select onchange="javascript: lf_chartTermSelectEvent(this);" class="popup_sel small" style="display: none;">
												<option selected="selected" value="DAY">Day</option>
												<option value="WEEK">Weekly</option>
											</select>
											<div class="nice-select popup_sel small" tabindex="0">
												<span class="current">Day</span>
												<ul class="list">
													<li data-value="DAY" class="option selected ui-sortable-handle">Day</li>
													<li data-value="WEEK" class="option ui-sortable-handle">Weekly</li>
												</ul>
											</div>
										</div>
										<div class="cont_btn fl">
											<a href="#" class="cont_btn_link"><span class="linktext">메뉴</span></a>
											<div class="cont_btn_list">
												<ul>
													<li class="ui-sortable-handle">
														<a onclick="javascript: lf_dashboardConfiguration(this);">Configuration</a>
													</li>
													<li class="ui-sortable-handle">
														<a onclick="javascript: lf_refreshChartEvent(this);">Refresh</a>
													</li>
													<li class="ui-sortable-handle">
														<a onclick="javascript: lf_removeChartEvent(this);">Delete</a>
													</li>
												</ul>
											</div><!--//cont_btn_list-->
										</div>
									</div>
								</div><!--//dashboard_cont_top-->
								<div class="dashboard_table_box">
									<div id="cloudvm_table_2908" class="chart_box ui_o1_04 dashboard_table need_cluster_select dashboard_compliance_table h_auto" style="display: block;"><!-- h_auto 클래스 추가-->
										<div class="compliance_option_box">
											<div class="left">
												<div class="sel_box">
													<select id="NamespaceList" class="popup_sel" onchange="selectFrameworkList()" style="display: none;">
														<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">Namespace</option>
													</select>
													<div class="nice-select popup_sel" tabindex="0">
														<span class="current">Namespace</span>
														<ul class="list">
															<li data-value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d" class="option selected focus">Namespace</li>
														</ul>
													</div>
												</div><!--//sel_box-->

												<div class="sel_box">
													<select id="PODList" class="popup_sel" onchange="selectFrameworkList()" style="display: none;">
														<option value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d">POD</option>
													</select>
													<div class="nice-select popup_sel" tabindex="0">
														<span class="current">POD</span>
														<ul class="list">
															<li data-value="4b761c20-030f-4b3c-89b2-08d58ebf0d8d" class="option selected focus">POD</li>
														</ul>
													</div>
												</div><!--//sel_box-->
											</div><!--//left-->
											<div class="sc_info_search_box">
												<div class="ipt_box">
													<input class="" type="search" placeholder="Name 검색 키워드를 입력해주십시오." id="searchKeyword" name="searchKeyword" style="width:300px;">
												</div>
												<a id="searchBtn" href="#" class="btn serch">검색</a>
											</div><!--//sc_info_search_box-->

											
										</div><!--//compliance_option_box-->
										<div class="tbl">
											<input type="hidden" id="complianceTaskEventPaging_cloudvm_table_2908" value="24_5_0">
											<input type="hidden" id="searchValue_cloudvm_table_2908" value="">
											<div id="event_complianceScan_cloudvm_table_2908_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
												<table id="event_complianceScan_cloudvm_table_2908" class="dataTable no-footer" role="grid">
													<colgroup>
														<col width="15%">
														<col width="12%">
														<col width="12%">
														<col width="20%">
														<col width="12%">
														<col width="12%">
														<col width="450px">
														<col width="12%">
														<col width="12%">
													</colgroup>
													<thead>
														<tr role="row">
															<th class="sorting_disabled">Namespace</th>
															<th class="sorting_disabled">Kind</th>
															<th class="sorting_disabled">Name</th>
															<th class="sorting_disabled">ServicAccount</th>
															<th class="sorting_disabled">Status</th>
															<th class="sorting_disabled">Restarts</th>
															<th class="sorting_disabled">Security lssue</th>
															<th class="sorting_disabled">Containers</th>
															<th class="sorting_disabled">Age</th>
														</tr>
													</thead>
													<tbody>
														<tr onclick="window.open('UI_01_04-wp.jsp', '컨테이너 워크로드 현황-상세정보', 'width=1400px, height=800px')" role="row" class="odd">
															<td class="long_w">sga-ns</td>
															<td class="long_w">POD</td>
															<td class="long_w">my-pod</td>
															<td class="long_w">sga-sa</td>
															<td class="long_w">Running</td>
															<td class="long_w">3</td>
															<td class="long_w">
																<div class="security">
																	<p class="cve_box">
																		<span class="tit">CVE</span>
																		<span class="bc_critical">26</span>
																		<span class="bc_high">96</span>
																		<span class="bc_medium">96</span>
																		<span class="bc_low">96</span>
																	</p>
																	<p>
																		<span class="bc_sensitive">5</span>
																	</p><!--민감정보-->
																	<p>
																		<span class="bc_malware non">0</span>
																	</p><!--멀웨어-->
																	<p>
																		<span class="bc_image non">0</span>
																	</p><!--미보증 이미지-->
																	<p>
																		<span class="bc_detection non">0</span>
																	</p><!--Container Event-->
																</div>
															</td>
															<td class="long_w">3/3</td>
															<td class="long_w">3</td>
														</tr>
													</tbody>
												</table>
											</div><!--//dataTables_wrapper-->
										</div><!--//tbl-->
									</div>
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

<!--s:모달창-->
<div id="dashboardFirewallEventDialog" style="display:none;">
<!--  modal :: 차트 이벤트 상세정보  -->
<div class="modal wide" id="" tabindex="0" >
    <div class="modal_header">
        <h3 id="">컨테이너 워크로드 현황-상세정보</h3>
    </div>
    <div class="modal_body popup_view_cont">
      
        <div class="modal_cont ui_01_04_01">
			<div class="view_info">
				<!--s:컨텐츠내용-->
				<ul>
					<li>
						<span class="label">Cluster</span>
						<span>Cluster-61</span>
					</li>
					<li>
						<span class="label">Namespace</span>
						<span>caegis-system</span>
					</li>
					<li>
						<span class="label">Kind</span>
						<span>Pod</span>
					</li>
					<li>
						<span class="label">Name</span>
						<span>Base Rule - System</span>
					</li>
				</ul>
			</div>
			<!--e:컨텐츠내용-->
			<div class="tab_box">
				<ul class="tab_item">
					<li class="on" data-tab="tab_cont01"><a href="javascript:void(0);">Security Issue</a></li>
					<li data-tab="tab_cont02"><a href="javascript:void(0);">Vulnerabilities</a></li>
					<li data-tab="tab_cont03"><a href="javascript:void(0);">Malware</a></li>
					<li data-tab="tab_cont04"><a href="javascript:void(0);">Sensitive Data</a></li>
					<li data-tab="tab_cont05"><a href="javascript:void(0);">Event</a></li>
					<li data-tab="tab_cont06"><a href="javascript:void(0);">Audit</a></li>
				</ul>
				<!-- s:Security Issue-->
				<div id="tab_cont01" class="tab_content overfow_ly">
					<div class="card_box">
						<h4 class="tit">Sga-tomcat 8.0</h4>
						<ul class="card_list w5">
							<li class="total erro">
								<h5 class="tit">Total Vulnerabilities</h5>
								<p>5</p>
							</li>
							<li class="malware">
								<h5 class="tit">Malware</h5>
								<p>0</p>
							</li>
							<li class="sensitive">
								<h5 class="tit">Sensitive Data</h5>
								<p>0</p>
							</li>
							<li class="image">
								<h5 class="tit">image Assurance</h5>
								<p>0</p>
							</li>
							<li class="detection">
								<h5 class="tit">Detection Event</h5>
								<p>0</p>
							</li>
						</ul>
					</div><!--//card_box-->
					<div class="card_box">
						<h4 class="tit">Sga-ubuntu</h4>
						<ul class="card_list w5">
							<li class="total">
								<h5 class="tit erro">Total Vulnerabilities</h5>
								<p>5</p>
							</li>
							<li class="malware">
								<h5 class="tit ok">Malware</h5>
								<p>0</p>
							</li>
							<li class="sensitive">
								<h5 class="tit ok">Sensitive Data</h5>
								<p>0</p>
							</li>
							<li class="image">
								<h5 class="tit ok">image Assurance</h5>
								<p>0</p>
							</li>
							<li class="detection">
								<h5 class="tit ok">Detection Event</h5>
								<p>0</p>
							</li>
						</ul>
					</div><!--//card_box-->
				
				</div>
				<!-- e:Security Issue-->
				<!-- s:Vulnerabilities-->
				<div id="tab_cont02" class="tab_content overfow_ly dp_none">
					<div class="card_box vulnerabilities_info">
						<ul class="card_list w6">
							<li class="tc_critical">
								<p>
									<span class="label">Critical</span>
									<span>5</span>
								</p>
							</li>
							<li class="tc_high">
								<p>
									<span class="label">hight</span>
									<span>0</span>
								</p>
							</li>
							<li class="tc_medium">
								<p>
									<span class="label">medium</span>
									<span>0</span>
								</p>
							</li>
							<li class="tc_low">
								<p>
									<span class="label">low</span>
									<span>0</span>
								</p>
							</li>
							<li class="tc_info">
								<p>
									<span class="label">info</span>
									<span>0</span>
								</p>
							</li>
							<li class="tc_non">
								<p>
									<span class="label">Unknown</span>
									<span>0</span>
								</p>
							</li>
						</ul>
					</div><!--//card_box-->

					<div class="tbl vul_detail_tbl">
						<!--s : jung form 클래스 추가 및 search_box 클래스 변경-->
						<div class="form">
							<div class="left">
								<div class="search_box">
									<div class="ipt_box">
										<input class="" type="text" placeholder="Image Tag 혹은 Identifier,Description 키워드를 입력해 주세요" id="searchKeyword" name="vulSearchKeyword" style="width:450px;">
									</div>
									<a id="vulSearchBtn" href="#" class="btn serch" onclick="vulSearchBtnClick()">검색</a>
								</div>
							</div>
						</div>
						<!--e : jung form 클래스 추가 및 search_box 클래스 변경-->
							
						<div id="event_vulnerability_detail_result_table_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<table id="event_vulnerability_detail_result_table" class="dataTable no-footer" role="grid">
								<colgroup>
									<col width="8%">
									<col width="10%">
									<col width="auto">
									<col width="8%">
									<col width="10%">
									<col width="8%">
									<col width="auto">
									<col width="auto">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr role="row">
										<th class="sorting">Container</th>
										<th class="sorting">Registry</th>
										<th class="sorting">Digest</th>
										<th class="sorting">Image Tag</th>
										<th class="sorting">Identifier</th>
										<th class="sorting">Severity</th>
										<th class="sorting">CVSS Score</th>
										<th class="sorting">Description</th>
										<th class="sorting">Url</th>
										<th class="sorting">Created Date</th>
										
									</tr>
								</thead>
								<tbody>
									<tr role="row" class="odd" style="background-color: rgb(0, 0, 0);">
										<td>-</td>
										<td>sga-sorlegisty</td>
										<td>default-route-openshift-image-registry.apps.ocp.sga.co.kr</td>
										<td>sha256:066f6c7fd07dc0d34c49c150e94bd7dafe73760f3eae1489b8fcae96a3fac7a9</td>
										<td>openshift/jboss-amq-63:1.4</td>
										<td>Unknown</td>
										<td>-</td>
										<td>** REJECT ** DO NOT USE THIS CANDIDATE NUMBER. ConsultIDs: none. Reason: This candidate was withdrawn by its CNA. Further investigation showed that it was not a security issue. Notes: none.</td>
										<td><a style="color: #bbb; text-decoration: underline;" href="https://nvd.nist.gov/vuln/detail/CVE-2013-0341" target="_blank">https://nvd.nist.gov/vuln/detail/CVE-2013-0341</a></td>
										<td>2023-10-16 21:54:14</td>
									</tr>
								</tbody>
							</table>
							<div class="bottom">
								<div class="dataTables_paginate paging_full_numbers" id="event_vulnerability_detail_result_table_paginate">
									<ul class="pagination">
										<li class="paginate_button first disabled" id="event_vulnerability_detail_result_table_first">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="0" tabindex="0">First</a>
										</li>
										<li class="paginate_button previous disabled" id="event_vulnerability_detail_result_table_previous">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="1" tabindex="0">Previous</a>
										</li>
										<li class="paginate_button active">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="2" tabindex="0">1</a>
										</li>
										<li class="paginate_button ">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="3" tabindex="0">2</a>
										</li>
										<li class="paginate_button next" id="event_vulnerability_detail_result_table_next">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="9" tabindex="0">Next</a>
										</li>
										<li class="paginate_button last" id="event_vulnerability_detail_result_table_last">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="10" tabindex="0">Last</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--//dataTables_wrapper-->
					</div><!--//tbl-->

					<div class="tbl vul_detail_tbl">
						<div class="form">
							<div class="left">
								<div class="search_box">
									<div class="ipt_box">
										<input class="" type="text" placeholder="Package Name 키워드를 입력해 주세요" id="searchPackageKeyword" name="vulPackageSearchKeyword" style="width:400px;">
									</div>
									<a id="vulPackageSearchBtn" href="#" class="btn serch" onclick="vulPackageSearchBtnClick()">&gt;검색</a>
								</div>
							</div>
						</div>
								
						<div id="event_vulnerability_package_result_table_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<table id="event_vulnerability_package_result_table" class="dataTable no-footer" role="grid">
								<colgroup>
									<col width="10%">
									<col width="auto">
									<col width="10%">
									<col width="10%">
									<col width="auto">
									<col width="auto">
								</colgroup>
								<thead>
									<tr role="row"><th class="sorting" tabindex="0" aria-controls="event_vulnerability_package_result_table" rowspan="1" colspan="1" aria-label="Package Name: activate to sort column ascending">Package Name</th><th class="sorting" tabindex="0" aria-controls="event_vulnerability_package_result_table" rowspan="1" colspan="1" aria-label="Package-related Path: activate to sort column ascending">Package-related Path</th><th class="sorting" tabindex="0" aria-controls="event_vulnerability_package_result_table" rowspan="1" colspan="1" aria-label="Package Version: activate to sort column ascending">Package Version</th><th class="sorting" tabindex="0" aria-controls="event_vulnerability_package_result_table" rowspan="1" colspan="1" aria-label="Fix Version: activate to sort column ascending">Fix Version</th><th class="sorting" tabindex="0" aria-controls="event_vulnerability_package_result_table" rowspan="1" colspan="1" aria-label="CVSS: activate to sort column ascending">CVSS</th><th class="sorting_asc" tabindex="0" aria-controls="event_vulnerability_package_result_table" rowspan="1" colspan="1" aria-label="CPE: activate to sort column descending" aria-sort="ascending">CPE</th></tr>
								</thead>
								<tbody>
								<tr role="row" class="odd"><td title="tar" class="long_w" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">tar</td><td title="/var/lib/rpm/Packages" class="long_w" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">/var/lib/rpm/Packages</td><td title="2:1.26-35.el7" class="long_w" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">2:1.26-35.el7</td><td title="-" class="long_w" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">-</td><td title="CVSS:2.0/AV:N/AC:L/Au:N/C:C/I:C/A:C" class="long_w" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">CVSS:2.0/AV:N/AC:L/Au:N/C:C/I:C/A:C</td><td title="cpe:2.3:a:redhat:tar:2:1.26-35.el7:*:*:*:*:*:*,cpe:2.3:a:tar:tar:2:1.26-35.el7:*:*:*:*:*:*" class="long_w" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">cpe:2.3:a:redhat:tar:2:1.26-35.el7:*:*:*:*:*:*,cpe:2.3:a:tar:tar:2:1.26-35.el7:*:*:*:*:*:*</td></tr></tbody>
							</table>
							<div class="bottom">
								<div class="dataTables_paginate paging_full_numbers" id="event_vulnerability_package_result_table_paginate">
									<ul class="pagination">
										<li class="paginate_button first disabled" id="event_vulnerability_package_result_table_first"><a href="#" aria-controls="event_vulnerability_package_result_table" data-dt-idx="0" tabindex="0">First</a></li><li class="paginate_button previous disabled" id="event_vulnerability_package_result_table_previous"><a href="#" aria-controls="event_vulnerability_package_result_table" data-dt-idx="1" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="event_vulnerability_package_result_table" data-dt-idx="2" tabindex="0">1</a></li><li class="paginate_button next disabled" id="event_vulnerability_package_result_table_next"><a href="#" aria-controls="event_vulnerability_package_result_table" data-dt-idx="3" tabindex="0">Next</a></li><li class="paginate_button last disabled" id="event_vulnerability_package_result_table_last"><a href="#" aria-controls="event_vulnerability_package_result_table" data-dt-idx="4" tabindex="0">Last</a></li>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				
				</div>
				<!-- e:Vulnerabilities-->
				<!-- s:Malware-->
				<div id="tab_cont03" class="tab_content overfow_ly dp_none">
					<div class="tbl vul_detail_tbl">
						<div id="event_vulnerability_detail_result_table_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<table id="event_vulnerability_detail_result_table" class="dataTable no-footer" role="grid">
								<colgroup>
									<col width="100px">
									<col width="150px">
									<col width="300px">
									<col width="auto">
								</colgroup>
								<thead>
									<tr role="row">
										<th class="sorting">NO.</th>
										<th class="sorting">Container</th>
										<th class="sorting">Signature Name</th>
										<th class="sorting">File path</th>

										
									</tr>
								</thead>
								<tbody>
									<tr role="row">
										<td colspan="4" class="dataTables_empty">No data available in table</td>
									
									</tr>
								</tbody>
							</table>
							<div class="bottom" style="display:none;">
								<div class="dataTables_paginate paging_full_numbers" id="event_vulnerability_detail_result_table_paginate">
									<ul class="pagination">
										<li class="paginate_button first disabled" id="event_vulnerability_detail_result_table_first">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="0" tabindex="0">First</a>
										</li>
										<li class="paginate_button previous disabled" id="event_vulnerability_detail_result_table_previous">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="1" tabindex="0">Previous</a>
										</li>
										<li class="paginate_button active">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="2" tabindex="0">1</a>
										</li>
										<li class="paginate_button ">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="3" tabindex="0">2</a>
										</li>
										<li class="paginate_button next" id="event_vulnerability_detail_result_table_next">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="9" tabindex="0">Next</a>
										</li>
										<li class="paginate_button last" id="event_vulnerability_detail_result_table_last">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="10" tabindex="0">Last</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--//dataTables_wrapper-->
					</div><!--//tbl-->

				</div>
				<!-- e:Malware-->
				<!-- s:Sensitive Data-->
				<div id="tab_cont04" class="tab_content overfow_ly dp_none">
					<div class="tbl vul_detail_tbl">
						<div id="event_vulnerability_detail_result_table_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<table id="event_vulnerability_detail_result_table" class="dataTable no-footer" role="grid">
								<colgroup>
									<col width="100px">
									<col width="150px">
									<col width="300px">
									<col width="auto">
								</colgroup>
								<thead>
									<tr role="row">
										<th class="sorting">NO.</th>
										<th class="sorting">Container</th>
										<th class="sorting">File</th>
										<th class="sorting">File path</th>

										
									</tr>
								</thead>
								<tbody>
									<tr role="row">
										<td colspan="4" class="dataTables_empty">No data available in table</td>
									
									</tr>
								</tbody>
							</table>
							<div class="bottom" style="display:none;">
								<div class="dataTables_paginate paging_full_numbers" id="event_vulnerability_detail_result_table_paginate">
									<ul class="pagination">
										<li class="paginate_button first disabled" id="event_vulnerability_detail_result_table_first">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="0" tabindex="0">First</a>
										</li>
										<li class="paginate_button previous disabled" id="event_vulnerability_detail_result_table_previous">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="1" tabindex="0">Previous</a>
										</li>
										<li class="paginate_button active">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="2" tabindex="0">1</a>
										</li>
										<li class="paginate_button ">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="3" tabindex="0">2</a>
										</li>
										<li class="paginate_button next" id="event_vulnerability_detail_result_table_next">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="9" tabindex="0">Next</a>
										</li>
										<li class="paginate_button last" id="event_vulnerability_detail_result_table_last">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="10" tabindex="0">Last</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--//dataTables_wrapper-->
					</div><!--//tbl-->
				</div>
				<!-- e:Sensitive Data-->
				<!-- s:Event-->
				<div id="tab_cont05" class="tab_content overfow_ly dp_none">
					<div class="tbl vul_detail_tbl">
						<!--s : jung form 클래스 추가 및 search_box 클래스 변경-->
						<div class="form">
							<div class="left">
								<div class="search_box">
									<div class="ipt_box">
										<input class="" type="text" placeholder="Rule Name, Subnect Name, Operation 검색키워드를 입력해주세요." id="searchKeyword" name="vulSearchKeyword" style="width:450px;">
									</div>
									<a id="vulSearchBtn" href="#" class="btn serch" onclick="vulSearchBtnClick()">검색</a>
								</div>
							</div>
						</div>
						<!--e : jung form 클래스 추가 및 search_box 클래스 변경-->
							
						<div id="event_vulnerability_detail_result_table_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<table id="event_vulnerability_detail_result_table" class="dataTable no-footer" role="grid">
								<colgroup>
									<col width="100px">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="15%">
									<col width="auto">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr role="row">
										<th class="sorting">NO.</th>
										<th class="sorting">Reslt</th>
										<th class="sorting">Rule Type</th>
										<th class="sorting">Rule Name</th>
										<th class="sorting">Severity</th>
										<th class="sorting">Subject</th>
										<th class="sorting">Subject Name</th>
										<th class="sorting">Operation</th>
										<th class="sorting">Date</th>


										
									</tr>
								</thead>
								<tbody>
									<tr role="row">
										<td colspan="9" class="dataTables_empty">No data available in table</td>
									
									</tr>
								</tbody>
							</table>
							<div class="bottom" style="display:none;">
								<div class="dataTables_paginate paging_full_numbers" id="event_vulnerability_detail_result_table_paginate">
									<ul class="pagination">
										<li class="paginate_button first disabled" id="event_vulnerability_detail_result_table_first">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="0" tabindex="0">First</a>
										</li>
										<li class="paginate_button previous disabled" id="event_vulnerability_detail_result_table_previous">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="1" tabindex="0">Previous</a>
										</li>
										<li class="paginate_button active">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="2" tabindex="0">1</a>
										</li>
										<li class="paginate_button ">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="3" tabindex="0">2</a>
										</li>
										<li class="paginate_button next" id="event_vulnerability_detail_result_table_next">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="9" tabindex="0">Next</a>
										</li>
										<li class="paginate_button last" id="event_vulnerability_detail_result_table_last">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="10" tabindex="0">Last</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--//dataTables_wrapper-->
					</div><!--//tbl-->
				</div>
				<!-- e:SEvent-->
				<!-- s:Event-->
				<div id="tab_cont06" class="tab_content overfow_ly dp_none">
					<div class="tbl vul_detail_tbl">
						<!--s : jung form 클래스 추가 및 search_box 클래스 변경-->
						<div class="form">
							<div class="left">
								<div class="search_box">
									<div class="ipt_box">
										<input class="" type="text" placeholder="Message, ReqestUser, RequestObject, Request Object Name 검색키워드를 입력해주세요." id="searchKeyword" name="vulSearchKeyword" style="width:450px;">
									</div>
									<a id="vulSearchBtn" href="#" class="btn serch" onclick="vulSearchBtnClick()">검색</a>
								</div>
							</div>
						</div>
						<!--e : jung form 클래스 추가 및 search_box 클래스 변경-->
							
						<div id="event_vulnerability_detail_result_table_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<table id="event_vulnerability_detail_result_table" class="dataTable no-footer" role="grid">
								<colgroup>
									<col width="100px">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="auto">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr role="row">
										<th class="sorting">NO.</th>
										<th class="sorting">Reslt</th>
										<th class="sorting">Message</th>
										<th class="sorting">Request Object</th>
										<th class="sorting">Request Object Name</th>
										<th class="sorting">Request Operation</th>
										<th class="sorting">Date</th>


										
									</tr>
								</thead>
								<tbody>
									<tr role="row">
										<td colspan="7" class="dataTables_empty">No data available in table</td>
									
									</tr>
								</tbody>
							</table>
							<div class="bottom" style="display:none;">
								<div class="dataTables_paginate paging_full_numbers" id="event_vulnerability_detail_result_table_paginate">
									<ul class="pagination">
										<li class="paginate_button first disabled" id="event_vulnerability_detail_result_table_first">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="0" tabindex="0">First</a>
										</li>
										<li class="paginate_button previous disabled" id="event_vulnerability_detail_result_table_previous">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="1" tabindex="0">Previous</a>
										</li>
										<li class="paginate_button active">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="2" tabindex="0">1</a>
										</li>
										<li class="paginate_button ">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="3" tabindex="0">2</a>
										</li>
										<li class="paginate_button next" id="event_vulnerability_detail_result_table_next">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="9" tabindex="0">Next</a>
										</li>
										<li class="paginate_button last" id="event_vulnerability_detail_result_table_last">
											<a href="#" aria-controls="event_vulnerability_detail_result_table" data-dt-idx="10" tabindex="0">Last</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--//dataTables_wrapper-->
					</div><!--//tbl-->
				</div>
				<!-- e:SEvent-->

			</div><!--//tab-box-->
        </div>
    </div>
    <div class="modal_controller">
        <!-- a onclick="javascript: lf_openEventFirewallViewWindow(this);"  href="#" class="window">새창 열기</a -->
        <a href="#" class="close">close</a>
    </div>
</div>
<div class="dim"></div>
</div>
<!--e:모달창-->
<script>
	//tab
	$(".tab_item > li").click(function(){
		var tabCont = $(this).attr("data-tab");
		$(this).siblings().removeClass("on");
		$(this).addClass("on");
		$(this).closest("ul").siblings().addClass("dp_none");
		$("#" + tabCont).removeClass("dp_none");
	});
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<%@ page import="com.wondersgroup.esf.EsfConstants"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>政策申报</title>

<%@ include file="../../common/include.jsp"%>
<script type="text/javascript"
	src="<%=ApplicationContextUtil.getBasePath(request)%>esf-js/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=ApplicationContextUtil.getBasePath(request)%>esf-js/jquery.pager.js"></script>


<script type="text/javascript">
	$(function() {
		//初始化分页控件
		$('#divPager').pager({
			formId : 'formId',
			recordSize : '${result.totalRecord}',
			recordPage : '${result.pageSize}',
			currentPage : '${result.currPageNo}'
		});
		
		
	});
	//全选
	function selectAll(val){
		$("#tableList :checkbox").attr("checked", val);  
	}
	//查询
	function queryResultList(){
		$('#currentPage').val('1');
		$("#formStatis").submit();
		showBlock("正在加载数据，请稍候。。。");
	}
	
	   //跳转到不同的环节页面
   function toDoFlowPage(flowUuid,uuid,activityId){
	   var url="";
	   if(activityId=='000000080001'){
		   url="xhzs/policysupport/toAddPolicyRecord";
	   }else{
		   url="xhzs/flow/toPolicyRecordFlowPage";
	   }
	   location.href = _path+url+'?flowUuid='+flowUuid+"&uuid="+uuid+"&activityId="+activityId;
   }
</script>


</head>
<body>
	<div class="location">
		您的当前位置：系统首页 &gt;&gt;企业综合扶持 &gt;&gt; 待办事务&gt;&gt;<span>政策备案流程</span>
	</div>
	<form id="formId" method="post"  action="toPolicyRecordFlowList">
		<form:hidden id="currentPage" name="pageNo" />
		<table class="table_search mTop">
						<tr>
							<th style="width: 8%">
								企业名称：
							</th>
							<td style="width: 30%">
								<form:input name="unitName" cssClass="inp_w70"  value="${flowVo.unitName}" />
							</td>
							<th width="8%">
							当前环节：
							</th>
							<td width="20%" style="vertical-align: middle" >
								<form:select name="acitivityType"  id="acitivityType"  style="width:150px" 
							   items="activityMap"  emptyOption="true"  value="${flowVo.acitivityType}"/>
							</td>	
								
							<th width="8%">
							所属功能区：
							</th>
							<td width="20%" style="vertical-align: middle" >
							   <form:select items="dic_zone_company" name="zoneCompanyCode"  value="${flowVo.zoneCompanyCode}"
							    style="width:150px"
							    emptyOption="true" ></form:select>
							   
							   
							</td>
							<td>
								<input id="search_button" type="submit" value="查询"
									class="button50" />
							</td>
						</tr>
		</table>
			
		<table cellspacing="0" cellpadding="0" class="table_list mTop" id="tableList">
				<tr>
				   
					<th id="sort_id"  width="5%">
						 序号
					</th>
					<th id="sort_caseStatus"  width="25%">
						企业名称
					</th>
					<th id="sort_caseStatus"  width="20%">
						所属功能区
					</th>
					<th id="sort_caseName"   width="10%">
						流程名称
					</th>
					<th  width="10%">
						当前环节
					</th>
					
					<th id="sort_caseStatus"  width="18%">
						申报时间
					</th>
				
					
				</tr>
				<c:forEach var="item" items="${result.resultList}" varStatus="status">
				    <tr>
						<td style="text-align: center;">
							${status.index+1}
						</td>
						<td>
						   <p style="text-align: left;">
								<a
									href="javascript:toDoFlowPage('${item.flActivityView.flowUuid}','${item.flActivityView.uuid}','${item.flActivityView.activityId}')"><font color="blue">${item.obj.unitName} </font></a>
							</p>
							
						</td>
						<td style="text-align: center;">
						` <dic:idToName dicId="${item.obj.deptId}" itemName="dic_zone_company"></dic:idToName>` 
						</td>
						<td style="text-align: center;">
							${flowNameMap[fn:substring(item.flActivityView.activityId , 0, 8)]}
						</td>
						<td style="text-align: center;">
						    ${activityMap[item.flActivityView.activityId]}  
						</td>
						<td style="text-align: center;">
							<fmt:formatDate value="${item.obj.submitTime}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						
					</tr>	
				</c:forEach>
				<tr>
					<td colspan="6" class="th_right" id='divPager'>
					</td>
				</tr>
			</table>
			<br/>
	  <div class="center">
		<input type="hidden" value="${result.totalRecord}" id="recordSize" />
		</div>
	</form>

	<%@ include file="../../common/init.jsp"%>
</body>

<script type="text/javascript">

   //开启企业引进申报流程
   function startFlow(){
	location.href=_path+"xhzs/unitdailymanager/toStartFlowByUnitDaily.do";
   }
  
</script>


</html>
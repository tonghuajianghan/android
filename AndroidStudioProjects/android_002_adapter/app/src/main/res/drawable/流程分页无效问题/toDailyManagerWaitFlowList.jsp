<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<%@ page import="com.wondersgroup.esf.EsfConstants"%>
<%@page import="com.wondersgroup.esf.flowengine.EFConstants"%>
<%@page import="com.wondersgroup.esf.base.enums.ErrorCode"%>
<%@page import="com.wondersgroup.xhzs.common.GlobalConstants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业引进申报清单</title>

<%@ include file="../../common/include.jsp"%>
<script type="text/javascript"
	src="<%=ApplicationContextUtil.getBasePath(request)%>esf-js/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=ApplicationContextUtil.getBasePath(request)%>esf-js/jquery.pager.js"></script>
<script type="text/javascript"
	src="<%=ApplicationContextUtil.getBasePath(request)%>js/fomat.js"></script>

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
		$("#formId").submit();
		showBlock("正在加载数据，请稍候。。。");
	}
	
	   //跳转到不同的环节页面
   function toDoFlowPage(flowUuid,uuid,activityId,url){
// 		   alert("flowUuid=:"+flowUuid+"uuid:"+uuid+"activityId:"+activityId+"url:"+url)
// 		if(activityId=='000000010001'){}
	   location.href = _path+url+'?flowUuid='+flowUuid+"&uuid="+uuid;
   }
</script>


</head>
<body>
	<div class="location">
		您的当前位置：系统首页 &gt;&gt;企业引进申报 &gt;&gt; 待办事务&gt;&gt;<span>企业申报流程</span>
	</div>
	<form id="formId" method="post"  action="toDailyManagerWaitFlowList">
	  <input type="hidden" name="batchUuids" id="batchUuids">
	  <input type="hidden" name="unitBatchStatus" id="unitBatchStatus">
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
						<a href="javascript:selectAll(true)" >全选</a>
					<br/>
					   <a href="javascript:selectAll(false)">清空</a>
					</th> 
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
					<th  width="8%">
						办理结果
					</th>
					<th id="sort_caseStatus"  width="18%">
						申报时间
					</th>
				
					
				</tr>
				<c:forEach var="item" items="${result.resultList}" varStatus="status">
				    <tr>
				    
				        <td style="text-align: center;">
				             <input type="checkbox" flag="batchUuid"  value="${item.flActivityView.uuid}"  /> 
				             <input type="hidden" flag="activity" value="${item.flActivityView.activityId}"/>
				             <input type="hidden" flag="operation" value="${item.obj.operationResult}"/>
						</td>

						<td style="text-align: center;">
							${status.index+1}
						</td>
						<td>
						   <p style="text-align: left;">
								<a
									href="javascript:toDoFlowPage('${item.flActivityView.flowUuid}','${item.flActivityView.uuid}','${item.flActivityView.activityId}','${pathMap[item.flActivityView.activityId]}')"><font color="blue">${item.obj.unitName} </font></a>
							</p>
							
						</td>
						<td style="text-align: center;">
						` <dic:idToName dicId="${item.obj.zoneCompanyCode}" itemName="dic_zone_company"></dic:idToName>` 
						</td>
						<td style="text-align: center;">
							${flowNameMap[fn:substring(item.flActivityView.activityId , 0, 8)]}
						</td>
						<td style="text-align: center;">
						    ${activityNameMap[item.flActivityView.activityId]} 
						</td>
						<td style="text-align: center;">
						${operationMap[item.obj.operationResult]}		
						</td>
						<td style="text-align: center;">
							<fmt:formatDate value="${item.obj.submitTime}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						
					</tr>	
				</c:forEach>
				<tr>
					<td colspan="9" class="right" id='divPager'>
					</td>
				</tr>
			</table>
			<br/>
	  <div class="center">
		<input type="hidden" value="${result.totalRecord}" id="recordSize" />
		<input type="hidden" value="${result.currPageNo}" id="currentPage" />
		<input type="hidden" value="${result.pageSize}" id="pageSize" />
		<c:if test="${isExistAuth!='3'}">
		<input type="button" value="批量提交" class="button100"  onclick="batchSubmit('${isExistAuth}','0')"/>
		</c:if>
		<c:if test="${isExistAuth=='3'||isExistAuth=='4'}">
		 <input type="button" value="批量入库" class="button100"  onclick="batchSubmit('${isExistAuth}','1')"/>
		</c:if></div>
	</form>

	<%@ include file="../../common/init.jsp"%>
</body>

<script type="text/javascript">
   //开启企业引进申报流程
   function startFlow(){
	location.href=_path+"xhzs/unitdailymanager/toStartFlowByUnitDaily.do";
   }
   
   //批量提交
   function batchSubmit(type,status){
	  $("#unitBatchStatus").val(status);
	  var formId=$("#formId");
	  var selectCheckBox=$("[flag=batchUuid]:checked");
	  var batchUuid="";
	  if(selectCheckBox.size()>0){
		  selectCheckBox.each(function(){batchUuid+=$(this).val()+","});
	  }else{
		  alert("请至少选择一个案件 ");
		  return false;
	  }
	  	  
	 //选择的办理环节要全部一样
	 var flagOperation=true;
	 var temp='';//默认值为空
	 $("[flag=batchUuid]:checked~input[flag=activity]").each(function(){
		var activityId= $(this).val();
		if(temp!=''&&temp!=activityId){
			flagOperation=false;
			return false;
		}
		 temp=activityId;
	 });
	 if(!flagOperation){
		 alert("所选的办理环节要保持一样");
		 return false;
	 }
	 
	 //选择的办理结果要全部一样
	 var flagResult=true;
	 var tempflagResult='';//默认值为空
	 $("[flag=batchUuid]:checked~input[flag=operation]").each(function(){
		var resultId= $(this).val();

		if(tempflagResult!=''&&tempflagResult!=resultId&&resultId!=''){
			flagResult=false;
			return false;
		}
		 tempflagResult=resultId;
	 });
	 if(!flagResult){
		 alert("所选的办理结果要保持一样");
		 return false;
	 }
	 var battchButton=true;
	  //当具有复审和终审的权限的时候，当客户所选的环节为企业申报终审，只能点击”批量入库“
	 var  isExistRFAuthButton=true;
	//具有复审权限,办理记过要一样或为空
	var isExistAuth=type;
	  if(isExistAuth=='3'||isExistAuth=='4'){
			$("[flag=batchUuid]:checked~input[flag=operation]").each(function(){
	    	 var operationId=$(this).val();
	    	 if(status=='0'&&operationId=='00000001000402' ){
	    		  alert("办理结果为入库,请单击批量入库");
	    		  battchButton=false;
	    		 return false;
	    	 }else if(status=='1'&&operationId=='00000001000401' ){
	    		  alert("办理结果为提交,请单击批量提交");
	    		  battchButton=false;
	    		  return false;
	    	 }
	     });
	
		 $("[flag=batchUuid]:checked~input[flag=activity]").each(function(){
				         var activityId= $(this).val();
				    	 if(status=='0'&&activityId=='000000010005' ){
				    		  alert("当前环节为企业终审,请单击批量入库");
				    		  battchButton=false;
				    		 return false;
				    	 }
			 });
	  }
	  if(!battchButton){
		   return false;
	  }
	 if(!isExistRFAuthButton){
		  return false;
	 }
	  

	
	 
	 
	 
	 
	  var substrBatchUuid=batchUuid.substring(0,batchUuid.length-1);
	  
	  
	  
	  
	  if(type=='1'){
		  var url = "toMainLeaderList.do?&batchUuids="+substrBatchUuid;
		  openDialogInIframe(url, '提交分管领导', 200,700,true, "<%=ApplicationContextUtil.getThemePath(request)%>/images/loading.gif");
	  }else{
		 $("#batchUuids").val(substrBatchUuid);
	     formId.attr("action","savePreUnitReportBatchList");
	     
	     if(status=='1'){//如果是批量入库
	 			var url = "checkUnitInfosExist.do?&batchUuids=" + substrBatchUuid+"&isFromDeclareOrInterim=isFromDeclare";
	 			_ajax_execute(url, function(responseText) {
	 				var obj = eval("(" + responseText + ")");
					if (obj.code ==<%=ErrorCode.OTHER_ERROR.ordinal()%>) {//如果企业信息库中存在该企业，则需要提示是否更新
						var unitNames="";
						var list=obj.object;
						$.each(list, function (n, value) {  
				              if(n!=(list.length-1)){
				            	  value=value+ "、";  
				              }
				              unitNames += value;  
				          });  
						
						showMessageIsUpdateBatch("以下企业在企业信息库中已存在："+unitNames+";是否更新？", function(flag) {//如果确认更新则将ipUpdate设为true，不予更新则设为false
	 						var form=document.getElementById("formId");
	 						formUrl=form.action;
	 						if (flag) {
	 							formUrl=formUrl+"?&isUpdate=true";
								$('#formId').attr('action', formUrl);
					   		 	_ajax_submit($('#formId'),return2Todo);
	 						}
	 					}, true);
	 				} else {
	 					var form=document.getElementById("formId");
	 					 _ajax_submit($('#formId'),return2Todo);
	 				}
	 			});
	    	 
	     }else{
		     showMessage("案件将提交下一环节处理，是否确认?", function(flag) {
				 if (flag) {
						 _ajax_submit($('#formId'),return2Todo);
					}
				}, true);
	    	 
	     }
	  }
   }
  
          //保存成功后，需要执行的函数
	function return2Todo(responseText) {
		var obj = jQuery.parseJSON(responseText);
		if (obj.code==0) {
			$("#formId").attr("action","toDailyManagerWaitFlowList");
			$("#formId").submit();
		}
	}	
   
</script>


</html>
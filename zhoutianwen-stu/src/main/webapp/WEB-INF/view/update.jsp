<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生</title>
<link href="/resource/bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1/jquery.js"></script>
</head>
<body>
	<div class="container">
	<h3>修改学生</h3>
	<form action="update" method="post">
		
		<input type="hidden" name="id" value="${stu.id}"/>
		
		<label>学生姓名：</label> <input type="text" name="name" value="${stu.name}"/>
		<br/>
		<label>入学日期：</label> <input type="date" name="enterDate" value='<fmt:formatDate value="${stu.enterDate}" pattern="yyyy-MM-dd" />'  />
			
		<br/>
		<label>选修课程：</label> 
		<c:forEach items="${subjects}" var="subject">
			<!-- 复选框的回显 -->	
			 <input type="checkbox" value="${subject.id}" name="selSubId"  
			  <c:forEach items="${stu.selSubjects}" var="selSub">
				<c:if test="${selSub.id==subject.id}">
					checked="checked"
				</c:if>
			  </c:forEach>
			  >  ${subject.name} &nbsp;&nbsp;&nbsp;			
			
		</c:forEach>
		<br/>
		
		<label>所属省份：</label>
			<select name="provinceId" id="provinceId" onchange="changePro()">
				<option value="-1" >请选择</option>
				<c:forEach items="${provinces}" var="province">
					<option value="${province.id}" <c:if test="${stu.province.id==province.id}"> selected="selected" </c:if> > ${province.name}</option> 
				</c:forEach>
			</select>
			<br/>
			<label>所属市：</label>
			<select name="cityId" id="cityId" onchange="changeCity()">
			</select>
			<br/>
			<label>所属县：</label>
			<select name="countyId" id="countyId">
			</select>
			<br/>
			<button type="submit">提交 </button>
			
	</form>
	</div>
	<script type="text/javascript">
		// 省发生改变的时候
		function changePro(){
			var parentId=$("#provinceId").val();//获取到省ID
			$.post("/getAeas",{parentId:parentId},function(data){
				$("#cityId").empty();// 清空下拉列表
				for (var i = 0; i < data.length; i++) {
					if(data[i].id=='${stu.city.id}'){
						$("#cityId").append('<option value="'+data[i].id+'" selected="selected" > '+data[i].name+'</option>');
						changeCity();
					}else{
						$("#cityId").append('<option value="'+data[i].id+'"> '+data[i].name+'</option>');
					}
				}
			})
		}
		
		//更改市的时候
		function changeCity(){
			var parentId=$("#cityId").val();//获取到市ID
			$.post("/getAeas",{parentId:parentId},function(data){
				$("#countyId").empty();// 清空下拉列表
				for (var i = 0; i < data.length; i++) {
					if(data[i].id==${stu.county.id}){
						$("#countyId").append('<option value="'+data[i].id+'" selected="selected"  > '+data[i].name+'</option>');
					}else{
						$("#countyId").append('<option value="'+data[i].id+'"> '+data[i].name+'</option>');
					}
				}
			})
		}
		
		changePro();
		
		
		
	</script>
</body>
</html>
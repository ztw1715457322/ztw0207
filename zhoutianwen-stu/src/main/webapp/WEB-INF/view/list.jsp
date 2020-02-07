<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resource/bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1/jquery.js"></script>
</head>
<body>
	<div class="container">
		<h1>学生列表</h1>
		<form action="list">
			<label>选修课程：</label> 
			<c:forEach items="${subjects}" var="subject">
				<input type="checkbox" value="${subject.id}" name="selSubId">  ${subject.name} &nbsp;&nbsp;&nbsp;			
			</c:forEach>
			
			学生姓名<input type="text" name="name" id="name"> 
			<button type="submit" >查询</button>
		
		</form>
		
		<input type="button" value="添加" onclick="location.href='toAdd'">
		<input type="button" value="批量删除" onclick="delBatch()">
		<br>
		<table class="table">
			<tr>
				<th>编号  <input type="checkbox" id="selAll" onchange="selAll()" >全选/全不选    <input type="button" value="反选" onclick="reverse()">  </th>
				<th>姓名</th>
				<th>入学日期</th>
				<th>选修科目</th>
				<th>省</th>
				<th>市</th>
				<th>县</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageStudent.list}" var="stu">
			<tr>
				<td><input type="checkbox" name="id" value="${stu.id}">${stu.id}</td>
				<td>${stu.name}</td>
				<td><fmt:formatDate value="${stu.enterDate}" pattern="yyyy年MM月dd日"/></td>
				<td>
					<c:forEach items="${stu.selSubjects}" var="subject" >
						${subject.name} &nbsp;&nbsp;
					</c:forEach>
				
				</td>
				<td>${stu.province.name}</td>
				<td>${stu.city.name}</td>
				<td>${stu.county.name}</td>
				<td>
					<input type="button" class="btn btn-success" value="详情"/>
				    <input type="button" class="btn btn-warning" value="修改" onclick="location.href='/toupdate?id=${stu.id}'"/>
				 </td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
	//全选 全不选
	function selAll(){
		//alert('tt')
		 $("[name='id']").each(function(){
			//alert('yy')
			$(this).prop('checked',$("#selAll").prop("checked"))
		} )
	}
	
	
	//反选
	function reverse(){
		 $("[name='id']").each(function(){
			$(this).prop('checked', !$(this).prop("checked") )
		 	}
		 )
	}
	//批量删除
	function delBatch(){
		var ids=new Array();
		
		// 获取被选中的Id 的数组
		 $("[name='id']:checked").each(function(){
			 alert($(this).val())
			 ids.push($(this).val())
		 })
		 if(ids.length<1){
			 alert('请选择数据进行删除')
			 return;
		 }
		
		 $.post("/delBatch",{ids:ids},function(data){
			 if(data=="success"){
				 alert("删除成功");
				 history.go(0);
			 }
		 })
	}
	
	function query(){
		
	}
	</script>
</body>
</html>
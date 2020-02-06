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
		学生姓名<input type="text" name="name" id="name"> 
		<input type="button" value="查询">
		<input type="button" value="添加" onclick="location.href='toAdd'">
		<input type="button" value="批量删除">
		<br>
		<table class="table">
			<tr>
				<th>编号</th>
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
				<td>${stu.id}</td>
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
				    <input type="button" class="btn btn-warning" value="修改"/>
				 </td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
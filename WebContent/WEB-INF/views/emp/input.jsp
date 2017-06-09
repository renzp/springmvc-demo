<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/calendar/calendar/WdatePicker.js"></script>
<script type="text/javascript">
 $(function(){
	$("#lastName").change(function(){
		var val = $(this).val();
		val = $.trim(val);
		$(this).val(val);
		
		var oldLastName = $("#oldLastName").val();
		oldLastName = $.trim(oldLastName);
		if(oldLastName != null && oldLastName != "" && oldLastName == val){
			alert("姓名可用!");
		}
		
		var url = "${pageContext.request.contextPath }/ajaxValidateLastName";
		var args = {"lastName":val,"date":new Date()};
		
		$.post(url, args, function(data){
			if(data == "0"){
				alert("姓名可用!");
			}else if(data == "1"){
				alert("姓名不可用!");
			}else{
				alert("程序出错!");
			}
		});
	});
})
$(function(){
 $("#button").click(function(){
	if ($("#lastName").val()==""){
	     alert ("姓名不能为空！");
	     return false;
	}
	if ($("#email").val()==""){
	     alert ("邮箱不能为！");
	     return false;
	}
	if ($("#birth").val()==""){
	     alert ("生日不能为空！");
	     return false;
	}
	
	    $("#form1").submit();
	
    
  })
})
</script>

</head>
<body>
	
	<c:set value="${pageContext.request.contextPath }/emp" var="url"></c:set>
	<c:if test="${employee.id != null }">
		<c:set value="${pageContext.request.contextPath }/emp/${employee.id }" var="url"></c:set>
	</c:if>
	
	
	<form:form id="form1" action="${url }" method="post" modelAttribute="employee">
		
		<c:if test="${employee.id != null} ">
		     <input type="hidden" id="oldLastName" value="${employee.lastName }">
		     <form:hidden path="id"/>
		     <input type="hidden" name="_method" value="PUT">
	    </c:if>
		
		
		
		姓名:<form:input path="lastName" id="lastName"/><br>
		邮箱:<form:input path="email" id="email"/><br>
		生日:<form:input path="birth" id="birth" onclick="WdatePicker()" readonly="true"/><br>
		部门:<form:select path="department.id" items="${departments }"
		itemLabel="departmentName" itemValue="id"></form:select><br>
		<input type="button" value="提交" id="button">
	
	
	</form:form>
</body>
</html>
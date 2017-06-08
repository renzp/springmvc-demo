<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

</script>

</head>
<body>
	<form:form action="${pageContext.request.contextPath }/emp" method="post" modelAttribute="employee">
		姓名:<form:input path="lastName" id="lastName"/><br>
		邮箱:<form:input path="email"/><br>
		生日:<form:input path="birth" onclick="WdatePicker()"/><br>
		部门:<form:select path="department.id" items="${departments }"
		itemLabel="departmentName" itemValue="id"></form:select><br>
		<input type="submit" value="提交">
	
	
	</form:form>
</body>
</html>
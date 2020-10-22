<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<script type="text/javascript">
function signConfirm() {
	var session = document.f.id;
	var sign = confirm("등록되지 않은 계정입니다. 계정을 등록하시겠습니까?");
	if(session.value=="") {
		if(sign) {
			response.sendRedirect("/sign_up/sign_up.jsp");
		}
	} 
}
</script>
</head>
<body>
<section style="background: #2980b9;">
	<div class="container">
		<div class="login-form">
				<h1>Sign in.</h1>
			<form name="f" action="${pageContext.request.contextPath}/SigninController" method="post">
					<input type="text" name="id" placeholder="ID">
					<input type="password" name="pwd" placeholder="Password">  
					<input type="submit" value="Login">
			</form>
			<a href="manager_in.jsp">관리자로 로그인</a><hr>
			<a href="${pageContext.request.contextPath }/sign_up/sign_up.jsp">Creating an account.</a><br>
			<a href="forgetPassword.jsp">Forget Password.</a><hr>
			<a href="${pageContext.request.contextPath }/in/in.jsp">home.</a>
		</div>
	</div>
	<div class="clouds">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud1.png" style="--i:1;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud2.png" style="--i:2;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud3.png" style="--i:4;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud4.png" style="--i:3;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud5.png" style="--i:5;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud1.png" style="--i:10;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud2.png" style="--i:9;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud3.png" style="--i:8;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud4.png" style="--i:7;">
		<img src="${pageContext.request.contextPath }/img/cloud/cloud5.png" style="--i:6;">	
	</div>
	
</section>
</body>
</html>
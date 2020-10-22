<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/follow/follow_style.css" type="text/css">
<script type="text/javascript">
function ing() {
	var session = document.f.myid;
	var confirmFollow = confirm("${list[0].id}���� �ȷο� �Ͻðڽ��ϱ�?");
	
	if(session.value=="") {
		alert("�α��� ���� �ϼ���.");
		session.value = "";
	 	return false;
	} else {		
		if(confirmFollow) {
			f.submit();
		} else return false;
	}
	
	return f.reset();
}

function p() {
	var profile = confirm("�������� �����Ͻðڽ��ϱ�?");
	if(profile) {
		location.href="${pageContext.request.contextPath }/in/in.jsp";		
	} else return false;
}

</script>
</head>
<body>
<div>
<form name="f" action="${pageContext.request.contextPath }/FollowController">
	<div style="font-weight: bold; font-size: 35px; margin: 10px 10px;">
		
		${list[0].id} 					
						<c:if test="${sessionScope.id.equals(list[0].id)==false }">
							
							<input type="button" name="following" onclick="ing()" value="follow">					
							<!-- input type="button" onclick="p()" value="edit profile" -->
						</c:if>
						<input type="hidden" name="id" value="${list[0].id }">
						<input type="hidden" name="myid" value="${sessionScope.id }">
	</div>
	
</form>
	<div style="font-weight:normal; font-size: 16px; margin: 5px 10px; text-overflow: clip; font-variant: small-caps; word-spacing: 25px;">
		<span>
			<c:if test="${not empty size }">
				�Խù� <a href="" style="text-decoration: none; display: inline-block; margin: 0">	
					${size}
				</a>
			</c:if>
		</span>
			
			
			<span class=action onclick="actionToggle()">
			<span>�ȷο� ${listsize}</span>
				<ul><li style="text-align: center; justify-content: center;">Followers</li>
					<c:forEach var="ing" items="${followinglist }">
						<li><img src="${pageContext.request.contextPath }/img/apple4.jpg">
						<a style="font-size: 14px;" href="${pageContext.request.contextPath}/ListController?id=${ing.myid}">${ing.myid}</a>
						</li>
					</c:forEach>
				</ul>
			</span>
					  			
		<span class=weraction onclick="weractionToggle()">
			<span>�ȷ��� ${followerlistsize + mylistsize}</span>
				<ul><li style="text-align: center; justify-content: center;">Follows</li>
					<c:forEach var="wer" items="${followerlist }">
						<li><img src="${pageContext.request.contextPath }/img/apple4.jpg">
						<a class="follow_a" href="${pageContext.request.contextPath}/ListController?id=${wer.myid}">${wer.myid}</a>
						</li>						
					</c:forEach>
					<c:forEach var="my" items="${myfollowinglist }">
						<li><img src="${pageContext.request.contextPath }/img/apple4.jpg">
						<a class="follow_a" href="${pageContext.request.contextPath}/ListController?id=${my.id}">${my.id}</a>
						</li>						
					</c:forEach>
				</ul>
			</span>
	</div><hr>
</div>
	
	<!-- �ȷο� ����Ʈ Ŭ�������� ����Ʈ �����ִ� ��ũ��Ʈ -->
	<script type="text/javascript">
	var flag = false;
	var werflag = false;
	function actionToggle() {
			flag=true;
			if(flag==true) {
				var action = document.querySelector('.action');
				action.classList.toggle('active');
				werfalg = false;
			}
			return werflag;
	}
	
	function weractionToggle() {
		werflag = true;
		if(werflag==true) {
			var weraction = document.querySelector('.weraction');
			weraction.classList.toggle('weractive');
			flag=false;			
		}
		return flag;
	}
	
	</script>
</body>
</html>
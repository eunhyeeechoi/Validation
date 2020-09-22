<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>


<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<title>form</title>
<!-- Bootstrap core CSS -->
<link href="/CHAL-KAK/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/CHAL-KAK/css/one-page-wonder.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/CHAL-KAK/index.jsp">CHAL KAK ${sessionScope.login_user.id}님</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/logout.ck">Logout</a>
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/photo_mypage.ck?id=${sessionScope.login_user.id}">MyPage</a>
					<li class="nav-item"><a class="nav-link"
						href="/CHAL-KAK/noticeboard/notice_board.jsp">board</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
		request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
	String seq = request.getParameter("seq");
	String str = request.getParameter("day");
	String[] arr = str.split(" ");
	str = arr[0];
	%>
	<div style="margin:80px 0px 0px 0px;"></div>
	<div class="container" style="margin: 50px 0px 50px 30%;">
		<div class="row">
			<form action="/CHAL-KAK/reservationForm.ck" method="post">
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th colspan="2" style="text-align: center; size: 15px">게시글 예약</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Board Sequence</td>
							<td><input type="text" name="brd_seq" class="form-control"
								value='<%=seq%>' readonly="readonly"></td>
						</tr>
						<tr>
							<td>Author</td>
							<td><input type="text" name="m_id" class="form-control"
								value='${sessionScope.login_user.id}' readonly="readonly"></td>
						</tr>
						<tr>
							<td>Title</td>
							<td><input type="text" class="form-control" name="title"
								maxlength="100" readonly="readonly" value="${all.title}" /></td>
						</tr>
						<tr>
							<td>Content</td>
							<td><textarea class="form-control" name="content"
									maxlength="2048" style="height: 200px; width: 500px;"
									readonly="readonly">${all.content}</textarea></td>
						</tr>
					</tbody>
					<tbody>


						<tr>
							<td>Day</td>
							<td><input type="date" class="form-control" name="day"
								value="<%=str%>" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Start Time</td>
							<td><input type="time" class="form-control"
								name="start_time" /></td>
						</tr>

						<tr>
							<td>End Time</td>
							<td><input type="time" class="form-control" name="end_time" /></td>
						</tr>

						<tr>
							<td>Place</td>
							<td><input type="text" class="form-control" placeholder="장소"
								name="place" /></td>
						</tr>
						<tr>
							<td>Number of People</td>
							<td><input type="text" class="form-control"
								placeholder="최대 인원 수" name="max" /></td>
						</tr>

						<tr>
							<td>Concept</td>
							<td><input type="radio" name="lock" value="0" id="r0"
								checked> <label for="r0">독사진</label> &emsp;&emsp; <input
								type="radio" name="lock" value="1" id="r1"> <label
								for="r1">우정사진</label>&emsp;&emsp; <input type="radio"
								name="notice" value="2" id="r2"> <label for="r2">커플사진</label>&emsp;&emsp;
								<input type="radio" name="notice" value="3" id="r3"> <label
								for="r3">가족사진</label></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right"
					value="reservation" /> <input type="button"
					class="btn btn-primary pull-left" value="back"
					onclick="location.href='/CHAL-KAK/noticeboard/notice_board.jsp'">
			</form>
		</div>
	</div>
</body>
</html>
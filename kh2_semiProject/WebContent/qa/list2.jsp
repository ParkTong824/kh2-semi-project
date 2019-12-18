<%@page import="beans.QaDto"%>
<%@page import="beans.QaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = "김운기";
	QaDao dao = new QaDao();
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno<=0)throw new Exception();
	}catch(Exception e){
		pno=1;
	}
	int list_width;
	try{
		list_width=Integer.parseInt(request.getParameter("list_width"));
	}catch(Exception e){
		list_width=3;
	}
	int list_count;
	try{
		list_count=Integer.parseInt(request.getParameter("list_count"));
	}catch(Exception e){
		list_count=list_width*5;
	}
	int pagesize = list_count;
	int navsize = 10;
	int startBlock = (pno-1)/navsize*navsize+1;
	int finishBlock = startBlock+9;
	
	int finish = pno * pagesize;
	int start = finish -  (pagesize-1);


	List<QaDto> list = dao.list(start,finish);
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	int count = dao.getCount(type,keyword);
	int pagecount = (count+pagesize)/pagesize;
	
	boolean isSearch = type!=null && keyword!=null;
	if(isSearch){
		list = dao.search(type, keyword,start,finish);
	}
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
%>
<style>
@charset "UTF-8";

@font-face {
	font-family: cookieRun;
	src: url("../font/COOKIERUN BLACK.OTF")
}

@font-face {
	font-family: No;
	src: url("../font/NotoSansCJKkr-Medium.otf")
}

* {
	box-sizing: border-box;
	margin: auto;
	font-family: cookieRun;
}

.table {
	width: 100%;
	border: 1px solid black;
	/* 테두리 병합 */
	border-collapse: collapse;
}

.table>thead>tr>td, .table>thead>tr>th, .table>tbody>tr>td, .table>tbody>tr>th
	{
	border: 1px solid black;
	padding: 0.5rem;
}

.custom-list {
	list-style: none;
	margin: 0;
	padding: 0;
	display: inline-block;
	width: 150px;
}

.custom-list>li {
	background-color: black;
	color: white;
	padding: 15px;
	cursor: pointer;
}

.custom-list li:hover {
	background-color: gray;
	color: black;
}

/* 2차 이상의 메뉴 스타일 */
.custom-list ul {
	list-style: none;
	padding: 0;
	margin: 0;
	position: absolute;
	margin-left: 135px;
	margin-top: -36px;
	/* 2차 이상의 메뉴는 처음에 숨김 처리 */
	display: none;
}

.custom-list ul>li {
	background-color: black;
	color: white;
	padding: 15px;
	width: 150px;
}

.custom-list li:hover>ul {
	display: block;
}

.custom-list li {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

article {
	margin: auto;
}

.gallary {
	text-align: center;
	margin: 10px;
	border: 1px dotted black;
}

.gallary:after {
	content: "";
	display: block;
	clear: both;
}

.gallary>.gallary-place {
	float: left;
	width: <%=100.0/list_width%>%;
	height: 600px;
}

.gallary>.gallary-place>a>img {
	width: 90%;
	height: 60%;
	border-bottom-left-radius: 40%;
	border-bottom-right-radius: 50%;
	border-top-left-radius: 50%;
	border-top-right-radius: 40%;
	
}
.gallary>.gallary-place>.gallary-table td,
.gallary>.gallary-place>.gallary-table>td{
	width:50%;
	text-align:left;

}
.gallary>.gallary-table{
	width:100%;
	text-align: center;
	border-collapse: collapse;
	border: 1px dotted black;
	padding: 1rem;
}
.gallary>.gallary-table>td{

text-align: left;
}
.row {
	text-align: center;
}

.row, .row-left, .row-right, .row-title, row-multi {
	margin: 10px 0px;
}

.row-title {
	font-size: 2rem;
	margin-bottom: 2rem;
	text-align: center;
}

.row-left {
	text-align: left;
}

.row-right {
	text-align: right;
}

.page-navigator {
	list-style: none;
	margin: 0;
	padding: 0;
	color: black;
	display: inline-block;
}

.page-navigator::after {
	content: "";
	display: block;
	clear: both;
}

.page-navigator>li {
	float: left;
	background-color: white;
	padding: 0.7rem;
	font-size: 2rem;
}

.page-navigator>li.active {
	background-color: black;
}

.page-navigator>li>a {
	text-decoration: none;
}

.page-navigator>li:hover {
	background-color: gray;
}

a {
	text-decoration: none;
	color: #000000
}
}
}
</style>
<body style="background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);">
<div style="width: 90%;">
pagesize:<%=pagesize %>&spades;
navsize:<%=navsize %>&spades;
startblock:<%=startBlock %>&spades;
finishblock:<%=finishBlock %>&spades;
start:<%=start %>&spades;
finish:<%=finish %>&spades;
pagecont:<%=pagecount %>
<article>
<form action="list2.jsp">
<!-- <div>페이지 넓이</div>
	<select name ="list_width">
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		</select> -->
	<div>페이지 높이</div>
		<select name ="list_count">
		<option><%=15%></option>
		<option><%=30%></option>
		<option><%=45%></option>
		<option><%=60%></option>
	</select>
	<input type="submit">
</form>

<div class="gallary">
	<%int j = 0;%>
	<%
		for (QaDto dto : list) {
	%>
		<div class="gallary-place">
		<h3><%=dto.getQa_title() %></h3><br>
	<a href="content.jsp?no=<%=dto.getQa_no()%>"><img src="https://placeimg.com/480/<%=400+j %>/any"></a>

		<table class="gallary-table">
		<tr>
		<td>사용자: <%=dto.getQa_no()%></td>
		<td>날짜:<%=dto.getQa_wdateWithFormat() %></td>
			</tr>
		<tr>
			<td style="font-size: 2rem" colspan="3">내용:<%=dto.getQa_content() %></td>
		</tr>
			<%j++; %>
		</table>
				</div>
	<%} %>

</div>
</div>
<div align="right">
<a href="write.jsp">글쓰기</a>	
</div>

<div align="center">
	<ul class="page-navigator">
	<%if(startBlock>1){ %>
		<%if(isSearch){ %>
	<li><a href="list2.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=startBlock-1%>&list_count=<%=list_count%>">[이전]</a></li>
	<%}else{ %>
		<li><a href="list2.jsp?pno=<%=startBlock-1 %>&list_count=<%=list_count%>">[이전]</a></li>
		<%} %>
	<%} %>
	<%for(int i = startBlock;i<finishBlock+1;i++){ %>
		 	<%if(pno==i){ %>
	 		<li><%=i %></li>
	 	<%}else{ %>
	 	<%if(isSearch){ %>
	 		<li><a href="list2.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=i%>&list_count=<%=list_count%>"><%=i %></a></li>
	 		<%}else{ %>
	 		<li> <a href="list2.jsp?pno=<%=i %>&list_count=<%=list_count%>" ><%=i %></a></li>
	 		 <%} %>
	 <%} %>
	 <%} %>
	  <%if(pagecount>finishBlock){ %>
	  <%if(isSearch){ %>
	 <li>	<a href="list2.jsp?type=<%=type %>&keyword=<%=keyword%>&pno=<%=finishBlock+1%>&list_count=<%=list_count%>">[다음]</a></li>
	 <%}else{ %>
	  	 <li><a href="list2.jsp?pno=<%=finishBlock+1 %>&list_count=<%=list_count%>">[다음]</a> </li>
	  	 <%} %>
	  	 <%} %>
	  	 </ul>
</div>
<form action="list2.jsp">
	<select name ="type">
		<option value="qa_title">제목</option>
		<option value="member_id">아이디</option>
		<option value="member_name">닉네임</option>
	</select>
	<input type="search" name = "keyword">
	<input type="submit">
</form>
</article>
</body>
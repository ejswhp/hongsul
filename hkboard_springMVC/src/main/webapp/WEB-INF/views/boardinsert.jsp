
<%@page import="com.hk.board.dtos.HkDto"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글목록 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
   $(".contentview").hover(function(){
      var seq=$(this).parents("tr").children("td").eq(0).text();  // this는 a태그
      $.ajax({
         type:"post", //요청방식
         url:"HkContent.do",//요청url
         data:"seq="+seq,//전달 파라미터
         async:false,//ajax메서드를 비동기식으로 실행할지 여부:false안함
         dataType: "json", //받을 데이터타입
         success:function(obj){  
//            alert(obj.content);
$("textarea").val(obj["content"])
         },
         error:function(){
            alert("서버통신실패ㅠㅠ")
         }
      });
   }, function(){
      
   });
});
</script>
<style type="text/css">
</style>
</head>
<%
   //java코드 작성 영역(실행부) : 포탈이 열렸어요
//    HkDao dao=new HkDao();
//    List<HkDto> list=dao.getAllBoard();//이코드들은 필요가 업서영 : ~~controller에서 작성

// Object obj=request.getAttribute("list");
// List<HkDto> list=(List<HkDto>)obj;
//-->한줄ㄹ로
List<HkDto> list=(List<HkDto>)request.getAttribute("list");
%>
<body>
<h1>글목록보기</h1>
<textarea rows="3" cols="30"></textarea>
<table border="1">
   <col width="50px"><col width="100px">
   <col width="300px"><col width="100px">
   <tr>
      <td>번호</td>
      <td>아이디</td>
      <td>제목</td>
      <td>작성자</td>
   </tr>
   <%
      for(int i = 0; i < list.size(); i++){
         HkDto dto=list.get(i);
   %>
   <tr>
      <td><%=dto.getSeq()%></td>
      <td><%=dto.getId()%></td>
      <td><a class="contentview" href="HkController.do?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
      <td><%=dto.getRegdate()%></td>
   </tr>   
   <%
   }   
   %>
   <tr>
      <td colspan="4">
         <a href="HkController.do?command=boardwrite">글쓰기</a>
      </td>
   </tr>
</table>
</body>
</html>
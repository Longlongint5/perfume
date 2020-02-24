<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
#box{
   position: absolute;
   left:25%;
   top: 25%;
   height: 50%;
}
#box a{
   font-size: 20pt;
}
#box p {
	font-size: 36pt;
}
</style>
</head>
<body>
      <% 
         String id = request.getParameter("id");
         String num = request.getParameter("num");
      %>
      <div id="box">
             <p>您成功购买了<%=num%>件商品编号为<%=id%>的商品&nbsp;&nbsp;&nbsp;&nbsp;<p>
             <a href="/perfume/index.jsp" style="text-decoration: none;">返回主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="/perfume/cart.jsp" style="text-decoration: none;">查看购物车</a>
      </div>
             
      <br>
      <br>
      <br>
</body>
</html>
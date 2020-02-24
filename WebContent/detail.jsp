<%@page import="entity.Perfume"%>
<%@page import="dao.PerfumeDAO"%>
<%@page import="entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
                               
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Perfume Store</title>
    <link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles_zh_CN.css">
    <link rel="stylesheet" href="css/detail.css">
</head>
 <%
       String loginUser="";
       if(session.getAttribute("loginUser")!=null)
       {
    	   loginUser=session.getAttribute("loginUser").toString();
       }
       else
       {
    	   loginUser="未登录";
       }
    %>
    <script type="text/javascript">
      function add()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num<100)
         {
            document.getElementById("number").value = ++num;
         }
      }
      function sub()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num>1)
         {
            document.getElementById("number").value = --num;
         }
      }
     
    </script>
<body class="fnb_zh_CN fnb_sticky-isOnTop">
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <div class="container">
                <div class="row fnb_gradient-menu">
                    <div class="fnb_text-center fnb_col-wd6 fnb_col-wd-offset-2">
                        <div class="fnb_logo">
                            <a href="index.html">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <% 
				                   //首先判断session中是否有购物车对象
				                   if(request.getSession().getAttribute("cart")!=null)
				                   {
				                %>
				                <% 
				                    Cart cart = (Cart)request.getSession().getAttribute("cart");
				                %>
                    <div class="col-wd-4 pull-right ">
                        <ul class="fnb_fixed-menu">
                            <li><input type="text" name="search" id="search" placeholder="请输查询内容...">
                                <i class="fa fa-search" aria-hidden="true"></i></li>
                            <li><i class="fa fa-user" aria-hidden="true"></i><span><%=loginUser %></span></li>
                            <li><i class="fa fa-shopping-bag" aria-hidden="true"></i> <a
                                    href="cart.jsp">购物袋(<span><%=cart.getlength() %></span>)</a></li>
                        </ul>
                    </div>
                    <%
				                   }
                    %>
                     <%
                                 if(request.getSession().getAttribute("cart")==null)
                                 {
                    %>
                    <div class="col-wd-4 pull-right ">
                        <ul class="fnb_fixed-menu">
                            <li><input type="text" name="search" id="search" placeholder="请输查询内容...">
                                <i class="fa fa-search" aria-hidden="true"></i></li>
                            <li><i class="fa fa-user" aria-hidden="true"></i><span><%=loginUser %></span></li>
                            <li><i class="fa fa-shopping-bag" aria-hidden="true"></i> <a
                                    href="cart.jsp">购物袋(<span>0</span>)</a></li>
                        </ul>
                    </div>
                    <%
                                 }
                    %>
                </div>
            </div>
            <div class="fnb_main-menu">
            </div>
        </div>
    </div>
    <!-- 商品详情 -->
    <%
       PerfumeDAO perfumeDao=new PerfumeDAO();
       Perfume perfume=perfumeDao.getPerfumeById(Integer.parseInt(request.getParameter("id")));
       if(perfume!=null)
       {
    %>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <ol class="fnb_breadcrumb fnb_text-4 fnb_font-2 ">
                    <li><a href="index.html">首页</a></li>
                    <li>产品名称</li>
                </ol>
            </div>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
            <div class="row">
                <div class="fnb_pdp-image fnb_col-wd5 fnb_thumb-1">
                    <img class="fnb_img-responsive" src="img/<%=perfume.getPhoto() %>" alt="">
                </div>
                <div class="fnb_col-wd6 information">
                    <div class="fnb_pdp-information">
                        <h1 class="fnb_pdp-title fnb_text-18"><%=perfume.getName() %></h1>
                        <p class="fnb_pdp-subtitle fnb_block-blc fnb_text-6"><%=perfume.getEngname() %></p>
                    </div>
                    <div class="detailfnb_desc"><%=perfume.getDesc() %></div>
                    <div class="item fnb_col-wd12">
                        <div class="title">价格:</div>
                        <div class="price">￥<span><%=perfume.getPrice() %></span></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">规格:</div>
                        <div class="capacity">
                            <ul>
                                <li class="now">30ml</li>
                                <li class="normal">50ml</li>
                                <li class="normal">100ml</li>
                            </ul>
                        </div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">库存:</div>
                        <div class="stock"><%=perfume.getStock() %></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="Addcartnum">
                            <div class="numberBox">
                                <input type="text" class="text20" value="1" id="number">
                            </div>
                            <div class="arrow">
                                <div class="topArrow curPoint" onclick="add()">
                                    <div class="icon1"></div>
                                </div>
                                <div class="bottomArrow" style="cursor: pointer;" onclick="sub()">
                                    <div class="icon2"></div>
                                </div>
                            </div>
                        </div>
                        <div class="button addToBagButton no-gutter-right" >
                            <div class="has_btn">
                          
                                <button type="button" onclick="n()"
                                    class="shop-btn fnb_btn-state shop-btn-mirror fnb_btn fnb_content_btn fnb_black  fnb_submit fnb_event_listener fnb_font-1-b fnb_text-2 fnb_fulldiv fnb_addtobag-btn "
                                    style="opacity: 1;"><span style="opacity: 1;">加入购物袋</span></button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </main>
    <%
       }
    %>

   
    <footer class="fnb_modal-footer">
        <div class="container">
            <ul>
                <li>
                    <a class="fohead">支付/配送</a>
                    <a href="">货到付款</a>
                    <a href="">在线支付</a>
                    <a href="">配送时间</a>
                </li>
                <li>
                    <a class="fohead">售后服务</a>
                    <a href="">退换货规定</a>
                    <a href="">退换及退款说明</a>
                </li>
                <li>
                    <a class="fohead">Regina与您</a>
                    <a href="">法律声明</a>
                    <a href="">隐私政策</a>
                    <a href="">Regina介绍</a>
                </li>
            </ul>
            <p>
                联系地址：Regina专营店　 电话：0513-12345678 传真：0588-987654321<br>版权所有：浙江Regina有限公司　浙ICP备000012345号
            </p>
        </div>
    </footer>
</body>

</html>
<script>
function n() {
	var num = parseInt(document.getElementById("number").value);
	var iddd=<%=perfume.getId()%>;
	location.href=('CartServlet?id='+iddd+'&num='+num+'&action=add');
}
</script>
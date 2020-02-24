<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.Cart" %>
<%@ page import="entity.Perfume" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles_zh_CN.css">
    <link rel="stylesheet"  href="css/cart.css"/>
</head>
<script language="javascript">
	    function delcfm() {
	        if (!confirm("确认要删除？")) 
	        {
	            window.event.returnValue = false;
	        }
	    }
</script>
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
<body>
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
        </div>
    </div>
    <div class="fnb_navigation">
        <div class="fnb_main-menu">
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <div class="fnb_breadcrumb fnb_text-5 fnb_font-3 ">
                    <a href="index.jsp"> <img src="img/return.png" alt=""><span>继续购物</span></a>
                </div>
            </div>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
            <div class="row">
                <div class="fnb_col-wd8 fnb_wider-8 no-gutter-right">
                    <div class="module-checkoutTable checkoutPublic">
                        <div class="module-checkoutTable-body">
                            <div class="_checkbox active"></div>
                            <ul class="module-checkoutTable-body-UHeader">
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-checkAll">全选
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productInfo">
                                    商品信息
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productPrice">
                                    单价(元)
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productNumber">
                                    数量
                                </li>
                                <li
                                    class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productSubtotal">
                                    小计(元)</li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-control">操作</li>
                            </ul>
                            
                            <div class="checkout-product-body">
                                <div class="checkout-product-body-item">
                                <% 
				                   //首先判断session中是否有购物车对象
				                   if(request.getSession().getAttribute("cart")!=null)
				                   {
				                %>
				                <!-- 循环的开始 -->
				                <% 
				                    Cart cart = (Cart)request.getSession().getAttribute("cart");
				                    HashMap<Perfume,Integer> goods = cart.getGoods();
				                    Set<Perfume> perfume = goods.keySet();
				                    Iterator<Perfume> it = perfume.iterator();
				         
				                    while(it.hasNext())
				                   {
				                     Perfume i = it.next();
				                %>
                                    <div class="checkout-product-body-item-content">
                                        <div class="_checkbox none"></div>
                                        <a href="index.html" target="_blank" class="checkout-product-body-item-img">
                                            <img src="img/<%=i.getPhoto() %>" class="" alt="" title=""></a>
                                        <div class="checkout-product-body-item-info">
                                            <h6 class="checkout-product-body-item-productNameCN"><%=i.getEngname() %></h6>
                                            <h6 class="checkout-product-body-item-productNameCN"><%=i.getName() %></h6>
                                        </div>
                                        <div class="checkout-product-body-item-unit">
                                            <div class="checkout-product-body-item-unit-price">
                                                <span class="checkout-product-body-item-unit-sapPrice"><%=i.getPrice() %></span>
                                                <span class="checkout-product-body-item-unit-offerPrice"></span>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-amount">
                                            <div class="checkout-product-body-item-amount-warp">
                                                <div class="mlnoe">
                                                    <span
                                                        class="checkout-product-body-item-amount-module-span">仅剩<%=i.getStock() %>件</span>
                                                </div>
                                                <div class="checkout-product-body-item-amount-module">
                                                    <i class="checkout-product-body-item-amount-btn minus">-</i>
                                                    <span class="checkout-product-body-item-amount-num"><%int a=i.getId();%><%=cart.getnumbyid(a) %></span>
                                                    <i class="checkout-product-body-item-amount-btn">+</i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-subtotal">
                                            <div class="checkout-product-body-item-unit-price">
                                                <span class="checkout-product-body-item-unit-sapPrice"><%=i.getPrice()*cart.getnumbyid(a)%></span>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-handle">
                                            <div class="checkout-product-body-item-handle-module">
                                                <i class="checkout-product-body-item-handle-delete"><a href="/perfume/CartServlet?id=<%=i.getId()%>&num=1&action=delete" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;&nbsp;</a></i>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                       }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="fnb_bag_summary fnb_col-wd3 fnb_col-wd-offset-12 fnb_wideren_offset-1 no-gutter-left">
                    <section class="fnb_bill">
                        <header class="fnb_section-header">
                            <h2 class="fnb_section_title fnb_text-7 fnb_font-1 fnb_text_lh-25"> 总览</h2>
                            <p class="fnb_section_description fnb_text-4 fnb_font-1"> 订单编号<span class="fnb_font-bold">
                                    74748409</span> </p>
                        </header>
                        <div class="fnb_section-content">
                            <div class="fnb_bill-thl row">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-1 fnb_half_bottom"> 商品总价</div>
                                <div
                                    class="fnb_bill_price fnb_col-wd4 pull-right no-gutter-left fnb_text-4  fnb_font-1-b">
                                    ¥<%=cart.getTotalPrice() %></div>
                            </div>

                            <div class="fnb_bill-tva row fnb_half_bottom">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-2">
                                    配送费用</div>

                                <div class="fnb_bill_fee fnb_col-wd4 fnb_text-4 pull-right fnb_text-right fnb_font-1-b"
                                    id="taxes"> 免费配送</div>
                            </div>
                            <div class="row">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-2 ">订单总计</div>
                                <div class="fnb_bill_fee fnb_col-wd4 fnb_text-4 pull-right fnb_font-2 fnb_text-right"
                                    id="taxes">¥<%=cart.getTotalPrice() %></div>
                            </div>
                            <div class="row fnb_submit">
                                <button type="submit" class="fnb_btn fnb_black fnb_col-wd12 fnb_font-1-b fnb_text-7">
                                    确认并付款</button>
                            </div>
                        </div>
                    </section>
                    <% 
				               }
                    %>
<!--循环的结束-->
                    <section class="fnb_question no-gutter">
                        <div class="fnb_section-content">
                            <h2 class="fnb_text-7 fnb_font-8"> 需要更多帮助？</h2>
                            <p class="fnb_text-4 fnb_font-2">
                                <span class="fnb_font-2"> 如有任何问题, <span>欢迎拨打客服热线</span> </span>
                                8888 236 888, 或通过在线客服联系我们</p>
                        </div>
                    </section>
                </section>
            </div>
        </div>
    </main>
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
           <p>联系地址：Regina专营店　 电话：0513-12345678 传真：0588-987654321<br>版权所有：浙江Regina有限公司　浙ICP备000012345号
            </p>
        </div>
    </footer>
</body>
</html>
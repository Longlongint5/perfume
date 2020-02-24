<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
 String username="";
 String userpwd="";
 request.setCharacterEncoding("utf-8");//防止中文乱码
 username=request.getParameter("username");
 userpwd=request.getParameter("userpwd");
 if("Marry".equals(username)&&"123".equals(userpwd))
 {
	 session.setAttribute("loginUser", username);
	 request.getRequestDispatcher("index.jsp").forward(request, response);
 }
 else
 {
	 response.sendRedirect("login.jsp");
 }
%>
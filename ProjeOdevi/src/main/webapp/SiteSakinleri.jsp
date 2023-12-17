<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="veritabanı.SiteSakinleriCekServlet" %>
<%@ page import="veritabanı.UserBean" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <div id="colorlib-counter">
        <%
        SiteSakinleriCekServlet SiteSakinleriCekServlet = new SiteSakinleriCekServlet();
        List<UserBean> residentList = SiteSakinleriCekServlet.getUserBean();
        System.out.println(residentList);
        %>

        <table class="table-bordered" border="1">
            <tr>
                <th>Email</th>
                <th>Telefon</th>
                <th>Apartment ID</th>
                <th>Daire No</th>
            </tr>
            <% for (UserBean userBean : residentList) { %>
                <tr>
                    <td><%= userBean.getemail() %></td>
                    <td><%= userBean.gettelefon() %></td>
                    <td><%= userBean.getapartment_id() %></td>
                    <td><%= userBean.getdaireno() %></td>
                </tr>
            <% } %>
        </table>
    </div>
</body>
</html>

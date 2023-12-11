<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<html>
<head>
    <title>Villalar</title>
</head>
<body>

<%
    // JSON verisini request objesinden al
    List<String> villalar = (List<String>) request.getAttribute("villalar");

    // Veri çekilmişse
    if (villalar != null && !villalar.isEmpty()) {
        for (String villa : villalar) {
            out.println(villa + "<br>");
        }
    } else {
        out.println("Hata! Veri çekme işlemi başarısız oldu.");
    }
%>








büş küş
</body>
</html>




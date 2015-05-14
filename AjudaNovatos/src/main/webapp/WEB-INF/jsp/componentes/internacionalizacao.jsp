<%-- 
    Document   : internacionalizacao
    Created on : 09/05/2015, 12:14:26
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .redondo{
                margin-left: 10px;
                height: 15px;
                //border-radius: 1px;
            }
        </style>
    </head>
    <body class="metro">
        <div class="row no-margin no-padding">
            <a href="<c:url value="/pt"/>" title="PT"><img src="/AjudaNovatos/images/bandeira_brasil.jpg" class="place-right redondo"></a>
            <a href="<c:url value="/en"/>" title="EN"><img src="/AjudaNovatos/images/bandeira_eua.jpg" class="icon place-right redondo"></a>
        </div>
    </body>
</html>

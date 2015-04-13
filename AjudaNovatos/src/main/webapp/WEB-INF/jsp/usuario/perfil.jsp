<%-- 
    Document   : perfil
    Created on : 25/11/2014, 16:55:09
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <header >
                <h2></h2>
            </header>
            <fieldset>
                <legend>Meus Projetos</legend>
            </fieldset>
            <!--
            <div class="tab-control" data-role="tab-control">
                <ul class="tabs">
                    <li class="active"><a href="#tab-1">Dados Pessoais</a></li>
                    <li><a href="#tab-2">Projetos</a></li>
                </ul>
                <div class="frames">
                    <div class="frame" id="tab-1">
                        
                    </div>
                    <div class="frame" id="tab-2">
                        
                    </div>
                </div>
            </div>
            -->
            <div class="span4">
                <input type="text" id="auto"/>
            </div>
        </div>
        <script>
            $(function () {

            });
        </script>
    </body>
</html>

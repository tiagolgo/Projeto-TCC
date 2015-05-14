<%-- 
    Document   : index
    Created on : 01/10/2014, 17:44:58
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page errorPage="../erros/404.jsp" %>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ajuda Novatos</title>
    </head>
    <body class="metro">
        <!-- menu topo -->
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <div class="grid fluid" >
                <div class="row" style="height: 300px">
                    <fieldset>
                        <legend>
                            <h1 class="heading">Ajuda Novatos</h1>   
                        </legend>
                        <a href="<c:url value="/upload/form"/>">Upload de Imagem</a>
                        <h3>${t["index.dash.titulo"]}</h3>
                        <p>${t["index.dash.texto"]}</p>
                    </fieldset>
                </div>
                <div class="row">
                    <!-- PROJETOS ADICIONADOS -->
                    <div class="span4">
                        <div class="panel">
                            <div class="panel-header" style="border-top: 2px solid #004e9d; color: #004e9d">${t["index.list.projetos"]}</div>
                            <div class="panel-content">
                                <c:forEach var="projeto" items="${informacoesProjetos.projetos}">
                                    <div class="listview small">
                                        <a href="#" class="list">
                                            <div class="list-content">
                                                <img src="/AjudaNovatos/images/word.png" class="icon">
                                                <div class="data">
                                                    <span class="list-title"><c:out value="${projeto.nome}"/></span>
                                                    <!--<div id="nota" class="rating active small fg-red no-margin" data-score="2" data-stars="5" data-role="rating"></div>-->
                                                </div>
                                            </div>
                                        </a>
                                    </div>  
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!--
                    LINGUAGENS MAIS USADAS
                    -->
                    <div class="span4">
                        <div class="panel">
                            <div class="panel-header" style="border-top: 2px solid darkred;color: darkred">${t["index.list.linguagens"]}</div>
                            <div class="panel-content">
                                <c:forEach var="linguagem" items="${informacoesProjetos.linguagens}">
                                    <div class="listview small">
                                        <a href="<c:url value="${t['url.projeto.linguagem']}${linguagem[1]}"/>" class="list">
                                            <div class="list-content">
                                                <img src="/AjudaNovatos/images/word.png" class="icon">
                                                <div class="data">
                                                    <span class="list-title"><c:out value="${linguagem[1]}"/></span>
                                                    <!--<div class="progress-bar small" data-role="progress-bar" data-value="75"></div>-->
                                                    <span class="list-remark"><c:out value="${linguagem[0]}"/> </span>                                                </div>
                                            </div>
                                        </a>
                                    </div>  
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!--
                    PROJETOS RECENTES
                    -->
                    <div class="span4">
                        <div class="panel">
                            <div class="panel-header" style="border-top: 2px solid #004e9d; color: #004e9d">${t["index.list.novidades"]}</div>
                            <div class="panel-content">
                                <div class="listview small">
                                    <c:forEach var="recentes" items="${informacoesProjetos.projetosRecentes}">
                                        <a href="<c:url value="${t['url.buscar.projeto.id']}${recentes.id}"/>" class="list">
                                            <div class="list-content">
                                                <img src="/AjudaNovatos/images/word.png" class="icon">
                                                <div class="data">
                                                    <span class="list-title"><c:out value="${recentes.nome}"/></span>
                                                    <span class="rating active small fg-red no-margin" data-score="2" data-stars="5" data-role="rating"></span>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <div class="grid fluid">
                    <div class="row">
                        <div class="panel">
                            <div class="panel-content bg-lightRed">
                                <div class="span3">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-menu-wrapper">
                    <ul class="horizontal-menu compact">
                        <li>&copy; 2014 Metro UI CSS</li>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Legal</a></li>
                        <li><a href="#">Advertise</a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Feedback</a></li>
                    </ul>
                </div>
            </footer>
        </div>           
        <script>
            $(function () {

                var nota;
                $("#rating_1").rating({
                    static: false,
                    score: 2,
                    stars: 5,
                    showHint: true,
                    showScore: true,
                    click: function (value, rating) {
                        rating.rate(value);
                        nota = value;
                    }
                });
            });
        </script>
    </body>
</html>
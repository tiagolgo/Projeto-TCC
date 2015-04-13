<%-- 
    Document   : index
    Created on : 01/10/2014, 17:44:58
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajuda Novatos</title>
    </head>
    <body class="metro">
        <!-- menu topo -->
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <div class="grid fluid" >
                <div class="row" style="height: 300px">
                    <fieldset>
                        <legend>
                            <h1 class="heading">Ajuda Novatos</h1>     
                        </legend>
                        <h3> FLOSS Coach creators are researchers who want to help newcomers to Open Source
                        </h3>
                        <p>
                            Have you ever thought about contributing to an Open Source Project? Have your tried? Was it to hard?
                        </p>
                        <p>
                            Use the Forum to give your overall feedback, to tell us any good or bad experience you had joining Open Source Software projects, or to discuss and leave tips to other newcomers that are interested in joining projects.
                        </p>
                    </fieldset>
                    <!--
                    <div class="span4" style="min-height: 300px">
                        <div class="panel">
                            <div class="panel-header">Cadastre seu Projeto</div>
                            <div class="panel-content text-justify">
                                <p>
                                    Se você possui um projeto e gostaria de disponibilizá-lo, faça-o aqui.
                                </p>
                                <div class="text-center">
                                    <a href='c:url value="/projeto/novo"/>' class=" button large fg-white bg-darkGreen" style="width: 100%"><b>Cadastrar</b></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    -->
                </div>
                <div class="row">
                    <!-- PROJETOS ADICIONADOS -->
                    <div class="span4">
                        <div class="panel">
                            <div class="panel-header" style="border-top: 2px solid #004e9d; color: #004e9d">Projetos</div>
                            <div class="panel-content">
                                <c:forEach var="projeto" items="${projetosLista}">
                                    <div class="listview small">
                                        <a href="<c:url value="/projeto/${projeto.id}"/>" class="list">
                                            <div class="list-content">
                                                <img src="/AjudaNovatos/images/word.png" class="icon">
                                                <div class="data">
                                                    <span class="list-title"><c:out value="${projeto.nome}"/></span>
                                                    <div class="ratin rating small fg-red" data-score="2" data-stars="5" data-role="rating"></div>
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
                            <div class="panel-header" style="border-top: 2px solid darkred;color: darkred">Linguagens</div>
                            <div class="panel-content">
                                <c:forEach var="linguagem" items="${linguagens.getLinguagens()}">
                                    <div class="listview small">
                                        <a href="<c:url value="/projeto/linguagem/${linguagem[1]}"/>" class="list">
                                            <div class="list-content">
                                                <img src="/AjudaNovatos/images/word.png" class="icon">
                                                <div class="data">
                                                    <span class="list-title"><c:out value="${linguagem[1]}"/></span>
                                                    <div class="progress-bar small" data-role="progress-bar" data-value="75"></div>
                                                    <span class="list-remark"><c:out value="${linguagem[0]}"/> projeto</span>                                                </div>
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
                            <div class="panel-header" style="border-top: 2px solid #004e9d; color: #004e9d">Novidades</div>
                            <div class="panel-content">
                                <div class="listview small">
                                    <c:forEach var="recentes" items="${projetosRecentes}">
                                        <a href="<c:url value="/projeto/${recentes.id}"/>" class="list">
                                            <div class="list-content">
                                                <img src="/AjudaNovatos/images/word.png" class="icon">
                                                <div class="data">
                                                    <span class="list-title"><c:out value="${recentes.nome}"/></span>
                                                    <div class="ratin rating small fg-red" data-score="2" data-stars="5" data-role="rating"></div>
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
    </body>
</html>
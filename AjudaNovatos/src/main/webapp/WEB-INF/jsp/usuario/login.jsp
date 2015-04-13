<%-- 
    Document   : login
    Created on : 26/03/2015, 14:35:33
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
            <div class="grid fluid">
                <div class="row" style="margin-top: 5%">
                    <div class="span6">
                        <div class="panel text-left">
                            <div class="panel-header bg-darkOrange fg-white">
                                Não possuo cadastro
                            </div>
                            <div class="panel-content padding10">
                                <div class="success">
                                    <c:out value="${successo}"/>
                                </div>
                                <h4>Cadastrar</h4>
                                <form method="post" action="<c:url value="/usuario/salvar"/>" id="form-novo-usuario">
                                    <div class="input-control text">
                                        <input type="text" value="" id="nome" name="usuario.nome" placeholder="Nome"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control text">
                                        <input type="text" value="" id="email" name="usuario.email" placeholder="E-mail"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control text">
                                        <input type="text" value="" id="login" name="usuario.login" placeholder="Login"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control password">
                                        <input type="password" value="" id="senha" name="usuario.password.senha" placeholder="Senha"/>
                                        <button class="btn-reveal"></button>
                                    </div>
                                    <div class="input-control password">
                                        <input type="password" value="" id="versenha" placeholder="Repita a senha"/>
                                        <button class="btn-reveal"></button>
                                    </div>
                                    <input type="submit" class="bg-green fg-white" value="Salvar"/>
                                    <input type="button" class="bg-orange fg-white" value="Cancelar"/>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="span1"></div>
                    <div class="span5">
                        <div class="panel">
                            <div class="panel-header bg-darkGreen fg-white">
                                Já possuo cadastro
                            </div>
                            <div class="panel-content">
                                <h4>Acessar</h4>
                                <c:if test="${errors!=null}">
                                    <div class="fg-red padding5 ">
                                        <c:forEach var="error" items="${errors}">
                                            ${error.message}<br />
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <form action="<c:url value="/login"/>" method="POST">
                                    <div class="row">
                                        <div class="input-control text" style="margin-top: 2%">
                                            <input type="text" id="login" name="login" value="" placeholder="login" style="height: 40px"/>
                                            <button class="btn-clear"></button>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 2%">
                                        <div class="input-control text">
                                            <input type="password" id="senha" name="senha" value="" placeholder="senha" style="height: 40px"/>
                                            <button class="btn-clear"></button>
                                        </div>
                                    </div>
                                    <div class="grid fluid">
                                        <div class="row">
                                            <div class="span6">
                                                <input type="submit" value="Acessar"/>
                                                <a class="button" href="<c:url value="/"/>"> Cancelar</a>
                                            </div>
                                            <div class="span6">
                                                <!--<a  href='c:url value="/usuario/formulario"/>'>Nao tenho cadastro</a> |-->
                                                <span class="icon-lamp-2"></span><a  href='#' class="fg-orange">Esqueci minha senha</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

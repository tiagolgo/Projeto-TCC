<%-- 
    Document   : novo-usuario
    Created on : 12/11/2014, 22:04:25
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajuda Novatos</title>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <center>
                <div class="panel text-left" style="margin-top: 5%">
                    <div class="panel-header bg-darkOrange fg-white">
                        ${t["cadastro.div.titulo"]}
                    </div>
                    <div class="panel-content padding10">
                        <c:if test="${errors!=null}">
                            <div class="fg-red padding5 ">
                                <c:forEach var="error" items="${errors}">
                                    ${error.message}<br />
                                </c:forEach>
                            </div>
                        </c:if>
                        <form method="post" action="<c:url value="${t['url.salvar.usuario']}"/>" id="form-novo-usuario">
                            <div class="grid fluid">
                                <div class="row">
                                    <div class="span6">
                                        <label>*Nome</label>
                                        <div class="input-control text">
                                            <input type="text" value="" id="nome" name="usuario.nome"/>
                                            <button class="btn-clear"></button>
                                        </div>
                                        <label>*Email</label>
                                        <div class="input-control text">
                                            <input type="text" value="" id="email" name="usuario.email"/>
                                            <button class="btn-clear"></button>
                                        </div>
                                    </div>
                                    <div class="span6">
                                        <label>*Senha</label>
                                        <div class="input-control password">
                                            <input type="password" value="" id="senha" name="usuario.password.senha"/>
                                            <button class="btn-reveal"></button>
                                        </div>
                                        <label>*Confirmação de Senha</label>
                                        <div class="input-control password">
                                            <input type="password" value="" id="verificacaoSenha"/>
                                            <button class="btn-reveal"></button>
                                        </div>
                                    </div>
                                    <label class="text-info text-italic">* Campos de preenchimento obrigatório</label>
                                    <div class="row">
                                        <input type="button" id="salvarUser" class="bg-green fg-white" value="${t["btn.enviar"]}"/>
                                        <a href="<c:url value="${t['url.home']}"/>" class="button bg-orange fg-white"> ${t["btn.cancelar"]}</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </center>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#salvarUser').on('click', function () {
                    var nome = $('#nome').val();
                    var login = $('#login').val();
                    var email = $('#email').val();
                    var senha = $('#senha').val();
                    var verificacaoSenha = $('#verificacaoSenha').val();
                    var submitForm = true;
                    if (nome === '') {
                        $('#nome').parent(".input-control").addClass("error-state");
                        submitForm = false;
                    }
                    if (login === '') {
                        $('#login').parent(".input-control").addClass("error-state");
                        submitForm = false;
                    }
                    if (email === '') {
                        $('#email').parent(".input-control").addClass("error-state");
                        submitForm = false;
                    }
                    if (verificacaoSenha === '') {
                        $('#verificacaoSenha').parent(".input-control").addClass("error-state");
                        submitForm = false;
                    }
                    if (senha === '') {
                        $('#senha').parent(".input-control").addClass("error-state");
                        submitForm = false;
                    } else {
                        if (senha != verificacaoSenha) {
                            $('#verificacaoSenha').parent(".input-control").addClass("error-state");
                            submitForm = false;
                        }
                    }
                    if (submitForm) {
                        $("#form-novo-usuario").submit();
                    }
                });
                //REMOVER ALERTAS DE ERRO
                $('#nome, #login, #email, #senha, #verificacaoSenha').focusin(function () {
                    $(this).parent(".input-control").removeClass('error-state');
                });
            });
        </script>
    </body>
</html>

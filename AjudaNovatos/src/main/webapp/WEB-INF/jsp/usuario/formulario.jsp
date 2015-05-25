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
                <div class="grid">
                    <div class="span8">
                        <div class="panel text-left">
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
                                    <div class="input-control text">
                                        <input type="text" value="" id="nome" name="usuario.nome" placeholder="${t["cadastro.placeholder.nome"]}"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control text">
                                        <input type="text" value="" id="email" name="usuario.email" placeholder="${t["cadastro.placeholder.email"]}"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control password">
                                        <input type="password" value="" id="senha" name="usuario.password.senha" placeholder="${t["cadastro.placeholder.senha"]}"/>
                                        <button class="btn-reveal"></button>
                                    </div>
                                    <div class="input-control password">
                                        <input type="password" value="" id="verificacaoSenha" placeholder="${t["cadastro.placeholder.repete"]}"/>
                                        <button class="btn-reveal"></button>
                                    </div>
                                    <input type="submit" id="salvarUser" class="bg-green fg-white" value="${t["btn.enviar"]}"/>
                                    <a href="/" class="button bg-orange fg-white"> ${t["btn.cancelar"]}</a>
                                </form>
                            </div>
                        </div>
                    </div>               
                </div>
            </center>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#').on('click', function (event) {
                    var nome = $('#nome').val();
                    var login = $('#login').val();
                    var email = $('#email').val();
                    var senha = $('#senha').val();
                    var verificacaoSenha = $('#verificacaoSenha').val();
                    var submitForm = true;
                    if (nome === '') {
                        $('#nome').addClass("fg-red text-italic").val('Informe o nome');
                        submitForm = false;
                    }

                    if (login === '') {
                        $('#login').addClass("fg-red text-italic").val('Informe o login');
                        submitForm = false;
                    }
                    if (email === '') {
                        $('#email').addClass("fg-red text-italic").val('Informe o email');
                        submitForm = false;
                    }

                    if (senha === '') {
                        $('#senha').addClass("fg-red text-italic").attr("type", 'text').val('Informe a senha');
                        submitForm = false;
                    }

                    if (verificacaoSenha === '') {
                        $('#verificacaoSenha').addClass("fg-red text-italic").attr("type", 'text').val('Informe novamente a senha');
                        submitForm = false;
                    } else if (senha !== verificacaoSenha) {
                        $('#verificacaoSenha').addClass("fg-red text-italic").attr("type", 'text').val('Senha não confere!');
                        submitForm = false;
                    }

                    if (submitForm) {
                        $("#form-novo-usuario").submit();
                    }

                });
                //REMOVER ALERTAS DE ERRO
                $('#nome').focusin(function () {
                    $(this).val('').removeClass('fg-red text-italic');
                });
                $('#login').focusin(function () {
                    $(this).val('').removeClass('fg-red text-italic');
                });
                $('#email').focusin(function () {
                    $(this).val('').removeClass('fg-red text-italic');
                });
                $('#senha').focusin(function () {
                    $(this).val('').attr("type", "password").removeClass('fg-red text-italic');
                });
                $('#verificacaoSenha').focusin(function () {
                    $(this).val('').attr("type", "password").removeClass('fg-red text-italic');
                });
            });
        </script>
    </body>
</html>

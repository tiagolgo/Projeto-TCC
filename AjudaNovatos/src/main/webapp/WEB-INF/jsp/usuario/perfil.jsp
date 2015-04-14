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
        <div class="container" style="margin-top: 4%">
            <center>

                <div class="grid">
                    <div class="span8">
                        <div class="success">
                            <c:out value="${successo}"/>
                        </div>
                        <div class="panel text-left">
                            <div class="panel-header">
                                Dados Cadastrais
                            </div>
                            <div class="panel-content padding10">
                                <form method="post" action="<c:url value="/usuario/salvar"/>" id="form-novo-usuario">
                                    <div class="input-control text">
                                        <input type="text" id="nome" name="usuario.nome" value="${usuario.nome}" placeholder="Nome"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control text">
                                        <input type="text" value="${usuario.email}" id="email" name="usuario.email" placeholder="E-mail"/>
                                        <button class="btn-clear"></button>
                                    </div>
                                    <div class="input-control text">
                                        <input type="text" value="${usuario.login}" id="login" name="usuario.login" placeholder="Login"/>
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
                </div>
            </center>
        </div>
        <script type="text/javascript">
            /*
             $(function () {
             $('#form-novo-usuario').on('submit', function (event) {
             event.preventDefault();
             var nome = $('#nome').val();
             var mail = $('#email').val();
             var login = $('#login').val();
             var senha = $('#senha').val();
             
             if (nome == '') {
             $('#nome').addClass("fg-red text-italic").val('Informe o nome');
             }
             if (mail == '') {
             $('#email').addClass("fg-red text-italic").val('Informe o email');
             }
             if (login == '') {
             $('#login').addClass("fg-red text-italic").val('Informe o login');
             }
             if (senha == '') {
             $('#senha').addClass("fg-red text-italic").attr("type", 'text').val('Informe a senha');
             }
             });
             
             //REMOVER ALERTAS DE ERRO
             $('#nome').focusin(function () {
             $(this).val('').removeClass('fg-red text-italic');
             });
             $('#email').focusin(function () {
             $(this).val('').removeClass('fg-red text-italic');
             });
             $('#login').focusin(function () {
             $(this).val('').removeClass('fg-red text-italic');
             });
             $('#senha').focusin(function () {
             $(this).val('').attr("type", "password").removeClass('fg-red text-italic');
             });
             $('#versenha').focusin(function () {
             $(this).val('').attr("type", "password").removeClass('fg-red text-italic');
             });
             
             $('#versenha').blur(function () {
             var senha = $('#senha').val();
             var aux = $(this).val();
             
             if (senha != aux) {
             $(this).addClass("fg-red text-italic").attr("type", 'text').val('Senha não confere');
             }
             });
             });*/
        </script>
    </body>
</html>

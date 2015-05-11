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
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <center>
                <div class="grid">
                    <div class="span8 padding20">
                        <div class="panel text-left margin10">
                            <div class="panel-header bg-darkGreen fg-white">
                                ${t["login.div.titulo"]}
                            </div>
                            <div class="panel-content">
                                <c:if test="${errors!=null}">
                                    <div class="fg-red padding5 ">
                                        <c:forEach var="error" items="${errors}">
                                            ${error.message}<br />
                                        </c:forEach>
                                    </div>
                                </c:if>
                                <form action="<c:url value="/login"/>" method="POST" id="formLogin">
                                    <div class="row">
                                        <div class="input-control text" style="margin-top: 2%">
                                            <input type="text" id="login" name="login" value="" placeholder="login" style="height: 40px"/>
                                            <button class="btn-clear"></button>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 2%">
                                        <div class="input-control text bg-red">
                                            <input type="password" id="senha" name="senha" value="" placeholder="senha" style="height: 40px"/>
                                            <button class="btn-clear"></button>
                                        </div>
                                    </div>
                                    <div class="grid fluid">
                                        <div class="row">
                                            <div class="span6">
                                                <input type="button" value="${t["btn.enviar"]}" id="btnLogin"/>
                                                <a class="button" href="<c:url value="/"/>"> ${t["btn.cancelar"]} </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="span6">
                                                <span class=""></span><a  href='<c:url value="${t['url.form.usuario']}"/>' class="fg-orange"> ${t["login.label.cadastro"]}</a>
                                            </div>
                                            <div class="span6">
                                                <span class="icon-lamp-2"></span><a  href='#' class="fg-orange"> ${t["login.label.senha"]}</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </center>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#btnLogin').on('click', function (event) {
                    var login = $('#login').val();
                    var senha = $('#senha').val();
                    var submitForm = true;
                    if (login === '') {
                        $('#login').closest(".input-control").addClass("bg-red").val('Informe o login');
                        submitForm = false;
                    }
                    if (senha === '') {
                        $('#senha').addClass("fg-red text-italic").attr("type", 'text').val('Informe a senha');
                        submitForm = false;
                    }
                    if (submitForm) {
                        $("#formLogin").submit();
                    }
                });

                //REMOVER ALERTAS DE ERRO
                $('#login').focusin(function () {
                    $(this).val('').removeClass('fg-red text-italic');
                });
                $('#senha').focusin(function () {
                    $(this).val('').removeClass('fg-red text-italic');
                });
            });
        </script>
    </body>
</html>

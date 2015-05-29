<%-- 
    Document   : novo
    Created on : 15/11/2014, 20:02:39
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Adicionar Projeto</title>
        <script type="text/javascript" src="/AjudaNovatos/js/tinymce/tinymce.min.js"></script>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>
            <c:choose>
                <c:when test="${projeto!=null}">
                    <h1 style="margin-top: 2%;margin-bottom: 2%">Alterar meu projeto</h1>
                </c:when>
                <c:otherwise>
                    <h1 style="margin-top: 2%;margin-bottom: 2%">Adicionar meu projeto</h1>
                </c:otherwise>
            </c:choose>
            <form id="dados-form" method="POST" action="<c:url value="${t['url.salvar.projeto']}"/>" enctype="multipart/form-data">
                <input type="hidden" name="projeto.id" value="${projeto.id}"/>

                <div class="place-right">
                    <input type="submit" class="button bg-green fg-white" value="Salvar">
                    <a href='<c:url value="${t['url.home']}"/>' class="button bg-orange fg-white"> Cancelar</a>
                </div>

                <!-- Fluxo de contribuicao -->
                <input type="hidden" name="projeto.comoIniciar.fluxo.id" value="${projeto.comoIniciar.fluxo.id}"/>
                <div class="frame" id="tab-inicio-1">
                    <p>O fluxo de contribuição é o processo no qual o novato deve passar até realizar sua primeira contribuição.</p>
                    <p>Condireções sobre o fluxo de contribuição.</p>
                    <textarea class="tiny" name="projeto.comoIniciar.fluxo.texto">
                        ${projeto.comoIniciar.fluxo.texto}
                    </textarea>                           
                </div>

            </form>
        </div>

        <script>
            tinymce.init({
                selector: ".tiny",
                theme: "modern", height: 300,
                plugins: [
                    "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                    "save table contextmenu directionality emoticons template paste textcolor"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link | forecolor backcolor",
                style_formats: [
                    {title: 'Bold text', inline: 'b'},
                    {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
                    {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
                    {title: 'Example 1', inline: 'span', classes: 'example1'},
                    {title: 'Example 2', inline: 'span', classes: 'example2'},
                    {title: 'Table styles'},
                    {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
                ]
            });
        </script>
        <script type="text/javascript" src="/AjudaNovatos/js/projeto-form.js"></script>
    </body>
</html>
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


                <!--
                COMUNICACAO
                -->
                <div class="frame" id="tab_5">
                    <input type="hidden" name="projeto.comunicacao.id" value="${projeto.comunicacao.id}"/>

                    <p>Esta parte destina-se a apresentar ao novato os canais de comunicação que são utilizados pelo projeto.</p>
                    <div class="grid fluid">
                        <input type="hidden" name="projeto.comunicacao.pesquisa.id" value="${projeto.comunicacao.pesquisa.id}"/>

                        <!-- canal de comunicação IRC -->
                        <div class="row">
                            <input type="hidden" name="projeto.comunicacao.irc.id" value="${projeto.comunicacao.irc.id}"/>
                            <p>O projeto possui IRC?</p>
                            <div class="span2">
                                <div class="input-control select">
                                    <select id='ircQuestao'>
                                        <option value='false'></option>
                                        <option value="true" <c:if test="${projeto.comunicacao.irc.url!=''}">selected</c:if>>Sim</option>
                                            <option value="false">Não</option>
                                        </select>
                                    </div>  
                                </div>
                            </div>
                            <div class="row" id="rowIrc" <c:if test="${projeto.comunicacao.irc.url==''}">style="display: none"</c:if>>
                                <p>Informe o endereço para a página do chat do projeto.</p>
                                <div class="input-control text" data-role="input-control">
                                    <input name='projeto.comunicacao.irc.url'  type="text" placeholder="URL para o Chat IRC do projeto" value="${projeto.comunicacao.irc.url}"/>
                                <button class="btn-clear" tabindex="-1"></button>
                            </div>
                            <p>Consideracões sobre o IRC.</p>
                            <textarea class="tiny" name="projeto.comunicacao.irc.texto">
                                ${projeto.comunicacao.irc.texto}
                            </textarea>
                        </div>

                        <!-- lista de discussão -->
                        <div class="row">
                            <input type="hidden" name="projeto.comunicacao.lista.id" value="${projeto.comunicacao.lista.id}"/>
                            <p>O projeto possui Lista de Discussão?</p>
                            <div class="span2">
                                <div class="input-control select">
                                    <select id='listaQuestao'>
                                        <option value='false'></option>
                                        <option value="true">Sim</option>
                                        <option value="false">Não</option>
                                    </select>
                                </div>  
                            </div>
                        </div>
                        <div class="row" id="rowLista" style="display: none">
                            <div class="input-control text" data-role="input-control">
                                <input id="dados-dono" name="" type="text" placeholder="Link para lista de discussão" value="">
                                <button class="btn-clear" tabindex="-1"></button>
                            </div>
                            <p>Como é realizada a subscrição na Lista de Discussão.</p>
                            <textarea class="tiny" id="listaT" name="projeto.comunicacao.lista.subscricao">
                                ${projeto.comunicacao.lista.subscricao}"
                            </textarea>
                            <br/>
                            <p>Considerações sobre como se comportar na Lista de Discussão.</p>
                            <textarea class="tiny"  name="projeto.comunicacao.lista.informacao">
                                ${projeto.comunicacao.lista.informacao}
                            </textarea>
                        </div>
                    </div>
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
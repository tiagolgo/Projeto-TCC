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
                <div class="tab-control" data-role="tab-control">

                    <div class="place-right">
                        <input type="submit" class="button bg-green fg-white" value="Salvar">
                        <a href='<c:url value="${t['url.home']}"/>' class="button bg-orange fg-white"> Cancelar</a>
                    </div>

                    <!-- Encontrar tarefa facil -->
                    <input type="hidden" name="projeto.comoIniciar.tarefaFacil.id" value="${projeto.comoIniciar.tarefaFacil.id}"/>
                    <p>Nesta área você pode informar aos usuários onde e como eles podem encontrar tarefas fáceis para iniciarem.</p>
                    <p>Uma sugestão é você filtrar/pesquisar na lista de arquivo do projeto, as terafas fáceis para um iniciante e disponibilizar aqui, caso possua, os feeds dos arquivos.</p>
                    <p>O projeto possui Feeds para tarefas fáceis?</p>
                    <div class="span2">
                        <div class="input-control select">
                            <select class='question'>
                                <option value='false'></option>
                                <option value="true" <c:if test="${projeto.comoIniciar.tarefaFacil.feeds.size()!=0}">selected</c:if>>Sim</option>
                                    <option value="false">Não</option>
                                </select>
                            </div>  
                        </div>
                        <div class="row row-show padding10"  style=" <c:if test="${projeto.comoIniciar.tarefaFacil.feeds.size()==0}">display: none;</c:if> margin-bottom: 2%">
                            <div class="row feeds-container">
                                <div class="panel">
                                    <div class="panel-header">
                                        Inserir feed
                                    </div>
                                    <div class="panel-content">
                                        <div class="input-control text" data-role="input-control">
                                            <input class="feed-title"  type="text" placeholder="Título para do feed" value=""/>
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>
                                        <div class="input-control text" data-role="input-control">
                                            <input class="feed-url" type="text" placeholder="URL para do feed" value=""/>
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>
                                        <button type="button" class="feeds-insert">Inserir</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="panel">
                                    <div class="panel-header">
                                        Feeds adicionados
                                    </div>
                                    <div class="panel-content">
                                        <table class="table hovered table-feeds" style="width: 100%" id="feeds-tabela">
                                            <thead></thead>
                                            <tbody>
                                            <c:forEach var="feed_add" items="${projeto.comoIniciar.tarefaFacil.feeds}" varStatus="cont">
                                                <tr>
                                                    <td>
                                                        <input type="hidden"  value="${feed_add.titulo}" name="projeto.comoIniciar.tarefaFacil.feeds[${cont.count-1}].titulo"/> 
                                                        ${feed_add.titulo}</td>
                                                    <td>
                                                        <input type="hidden"  value="${feed_add.url}" name="projeto.comoIniciar.tarefaFacil.feeds[${cont.count-1}].url"/> 
                                                        ${feed_add.url}</td>
                                                    <td><button type='button' value="${feed_add.id}" class='small bg-red fg-white feed-remove'>Excluir</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p>Consideracões sobre outras formas de encontrar uma tarefa fácil para iniciar.</p>
                    <textarea class="tiny" name="projeto.comoIniciar.tarefaFacil.texto">
                        ${projeto.comoIniciar.tarefaFacil.texto}
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
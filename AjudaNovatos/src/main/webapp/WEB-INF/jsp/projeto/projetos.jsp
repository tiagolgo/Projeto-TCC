<%-- 
    Document   : projetos
    Created on : 15/11/2014, 19:26:03
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <!--
                <script type="text/javascript">
                   window.onload = init;
                    function init() {
                        $.ajax({
                            type: 'GET',
                            url: 'c:url value="/paginacao.json"/>',
                            dataType: 'json'
                        }).done(function (data) {
                            $.each(data.list, function (index, value) {
                                //console.log(value);
                                $("#projetos tbody").append("<tr><td>" + value.nome + "</td><td>-</td><td>java</td><td>value.dataCriacao</td><td>GPL</td></tr>");
                            });
                        }).fail(function (data) {
                            alert("Ítem não adicionado! " + data);
                        });
                    }
                </script>
        -->
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp"/>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>

            <h2 class="text-bold">${t["projetos.titulo"]}</h2>
            <br/>
            <div class="row">
                <div style="float: left">
                    <form class="left" method="post" id="frm-filtro">
                        ${t["projetos.exibir"]}
                        <div class="input-control select size1" data-role="input-control">
                            <select id="table-size">
                                <option>10</option>
                                <option>20</option>
                                <option>30</option>
                            </select>
                        </div>
                        ${t["projetos.resultados"]}
                    </form>
                </div>
                <div style="float: right">
                    <form class="right" method="post" id="frm-filtro">
                        <div class="input-control text">
                            <input type="text" id="pesquisar" placeholder="${t["projetos.input.pesquisa"]}" name="pesquisar" size="30"/>
                            <!--<button class="btn-clear"></button>-->
                        </div>
                    </form>
                </div>
            </div>
            <table id="projetos" class="table tablesorter hovered">
                <thead>
                    <tr>
                        <th><span>${t["projetos.tab.col0"]}</span></th>
                        <th><span>${t["projetos.tab.col1"]}</span></th>
                        <th><span>${t["projetos.tab.col2"]}</span></th>
                        <th><span>${t["projetos.tab.col3"]}</span></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="projeto" items="${projetos}">
                        <tr> 
                            <td style="display: none" class="id">${projeto.id}</td>
                            <td>${projeto.nome}</td>
                            <td>${projeto.plataformas.toString().replace('[','').replace(']','')}</td>
                            <td>${projeto.linguagens.toString().replace('[','').replace(']','')}</td>
                            <td>${projeto.dataCriacao}</td>
                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
            <div class="toolbar transparent" id="pager">
                <button id="first"><i class="icon-first-2"></i></button>
                <button id="prev"><i class="icon-previous"></i></button>
                <span class="divider"></span>
                <span id="pagina" class="button"><i></i></span>
                <span class="button">de</span>
                <span id="pagina-total" class="button"></span>
                <span class="divider"></span>
                <button id="next"><i class="icon-next"></i></button>
                <button id="last"><i class="icon-last-2"></i></button>
            </div>

        </div>
        <script>
            $(function () {
                // EXIBIR PROJETO SELECIONADO
                $("table tbody tr").on("click", function () {
                    var id = $(this).find(".id").text();
                    var url = '<c:url value="${t['url.buscar.projeto.id']}?id="/>' + id;
                    window.open(url, "_self");
                });

                $('form').submit(function (e) {
                    e.preventDefault();
                });

                // FILTRAR PROJETO NA TABELA
                $('#pesquisar').keyup(function () {
                    var encontrou = false;
                    var trecho = $(this).val().toLowerCase();
                    $('table > tbody > tr').each(function () {
                        $(this).find('td').each(function () {
                            if ($(this).text().toLowerCase().indexOf(trecho) > -1) {
                                encontrou = true;
                            }
                        });
                        if (encontrou) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                        encontrou = false;
                    });
                });

                //ORDENAMENTO DA TABELA
                $('table').tablesorter({
                    headers: {
                        1: {sorter: false}
                    },
                    widthFixed: true, widgets: ['zebra']
                });

                //REDIMENSIONAR OS RESULTADOS DA TABELA
                function listarResultados(init, end) {
                    var cont = 0;
                    $('table > tbody > tr').each(function () {
                        if (cont >= init & cont < end) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                        cont++;
                    });

                    var pg = Math.ceil(cont / parseInt($('#table-size').val()));
                    $('#pagina').text(pg / pg);
                    $('#pagina-total').text(pg);
                }

                listarResultados(0, 10);

                //REDIMENSIONAR TABELA
                $('#table-size').on('change', function () {
                    var res = $(this).val();
                    listarResultados(0, res);
                });

                //PRIMEIRA PAGINA
                $("#first").on('click', function () {
                    var resultados = $('#table-size').val();
                    var final = resultados;

                    listarResultados(0, final);
                    $('#pagina').text(1);
                });

                //PAGINA ANTERIOR
                $("#prev").on('click', function () {
                    var pagina = parseInt($('#pagina').text()) - 1;

                    if (pagina >= 1) {
                        var resultados = $('#table-size').val();
                        var final = pagina * resultados;
                        var inicial = final - resultados;

                        listarResultados(inicial, final);
                        $('#pagina').text(pagina);
                    }
                });

                //PROXIMA PAGINA
                $("#next").on('click', function () {
                    var pagina = parseInt($('#pagina').text()) + 1;
                    var paginas = parseInt($('#pagina-total').text());

                    if (pagina <= paginas) {
                        var resultados = $('#table-size').val();
                        var final = pagina * resultados;
                        var inicial = final - resultados;

                        listarResultados(inicial, final);
                        $('#pagina').text(pagina);
                    }
                });

                //ULTIMA PAGINA
                $("#last").on('click', function () {
                    var pagina = parseInt($('#pagina-total').text());
                    var resultados = $('#table-size').val();
                    var final = pagina * resultados;
                    var inicial = final - resultados;

                    listarResultados(inicial, final);
                    $('#pagina').text(pagina);
                });
            });
        </script>
        <link rel="stylesheet" href="/AjudaNovatos/css/custom.css" media="screen" />    
        <script src="/AjudaNovatos/js/jquery.tablesorter.min.js"></script>
    </body>
</html>
<%-- 
    Document   : home
    Created on : 03/10/2014, 01:47:47
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajuda Novatos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="description" content="Simple responsive css framework">
        <meta name="author" content="Tiago Luiz Gomes de Oliveira">
        <script>
            function ativaAba(aba) {
                $(aba).click();
            }
        </script>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
        <div id="fb-root"></div>
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.3&appId=273300429357640";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <div class="container">
            <c:import url="../componentes/internacionalizacao.jsp"/>

            <div style="margin-top: 2%;margin-bottom: 2%; padding: 5px;">
                <h1 class="text-bold"><c:out value="${projeto.nome}"/></h1>
                <div class="fb-like place-right" data-href="https://developers.facebook.com/docs/plugins/" data-width="600" data-layout="button" data-action="like" data-show-faces="true" data-share="true"></div>
            </div>
            <div class="tab-control" data-role="tab-control">
                <ul class="tabs">
                    <li class="active" class="bg-hover-lightBlue"><a href="#tab_1" id="tab1">${t["tab.sobre"]}</a></li>
                    <li><a href="#tab_2" id="tab2" class="bg-hover-lightBlue">${t["tab.requisitos"]}</a></li>
                    <li><a href="#tab_3" id="tab3" class="bg-hover-lightBlue">${t["tab.comoiniciar"]}</a></li>
                    <li><a href="#tab_5" id="tab4" class="bg-hover-lightBlue">${t["tab.contato"]}</a></li>
                    <li><a href="#tab_4" id="tab5" class="bg-hover-lightBlue">${t["tab.workspace"]}</a></li>
                    <li><a href="#tab_6" id="tab6" class="bg-hover-lightBlue">${t["tab.entender"]}</a></li>
                    <li><a href="#tab_7" id="tab7" class="bg-hover-lightBlue">${t["tab.contribuicao"]}</a></li>
                </ul>

                <div class="frames" >
                    <!--
                    SOBRE
                    -->
                    <div class="frame" id="tab_1">
                        <p style="font-size: 25px; line-height: 100%">
                            <c:out value="${projeto.descricao}"/>
                        </p>
                        <div class="grid fluid">
                            <div class="row">
                                <div class="span6">
                                    <p><span class="text-bold">${t["projeto.pagina"]}</span><a href="http://<c:out value="${projeto.site}"/>" target="_blank">${projeto.site}</a></p>
                                    <p><span class="text-bold">${t["projeto.bug"]}</span> <a href="http://<c:out value="${projeto.gestorBug}"/>" target="_blank">${projeto.gestorBug}</a></p>
                                    <p><span class="text-bold">${t["projeto.repositorio"]}</span><a href="http://<c:out value="${projeto.repositorio.link}"/>" target="_blank">${projeto.repositorio.link}</a></p>
                                    <p><span class="text-bold">${t["projeto.lista"]}</span><a href="<c:out value="${projeto.listaDiscussao}"/>" target="_blank">${projeto.listaDiscussao}</a></p>
                                    <p><span class="text-bold">${t["projeto.wiki"]}</span><a href="<c:out value="${projeto.wiki}"/>" target="_blank">${projeto.wiki}</a></p>
                                    <p><span class="text-bold">${t["projeto.plataforma"]}</span>                                        
                                        <span class="fg-lightBlue"><c:out value="${projeto.plataformas.toString().replace('[','').replace(']','')}"/></span>
                                    </p>
                                    <p><span class="text-bold">${t["projeto.linguagem"]}</span>
                                        <span class="fg-lightBlue"><c:out value="${projeto.linguagens.toString().replace('[','').replace(']','')}"/></span>
                                    </p>
                                </div>
                                <div class="span6">
                                    <script type="text/javascript" src="${projeto.openHub}/widgets/project_factoids_stats.js"></script>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    REQUISITOS
                    -->
                    <div class="frame" id="tab_2">
                        <div class="grid">
                            <div class="row">
                                <div class="span7">
                                    <fieldset style="line-height: 100px">
                                        <legend class="fg-darkBlue">${t["requisito.basico"]}<span class="default fg-green rating_nota place-right"></span></legend>                                        
                                            ${projeto.requisito.requisitosBasico}
                                        <script type="text/javascript" src="${projeto.openHub}/widgets/project_languages.js"></script>
                                    </fieldset>
                                </div>

                                <!-- Requisitos adicionais -->
                                <div class="span7" style="float: right">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["requisito.adicional"]}<span class="default fg-green rating_nota place-right"></span></legend>
                                            ${projeto.requisito.requisitosAdicionais}
                                    </fieldset>
                                </div>
                            </div>
                        </div>

                        <!-- Área de Comentários -->
                        <div class="row coment-area" style="margin-top: 100px">
                            <div class="listview-outlook" data-role="listview"> 
                                <div class="row padding5 border-bottom">
                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                    <c:if test="${userLogado.logado==true}">
                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                    </c:if>
                                </div>
                                <c:if test="${userLogado.logado==true}">
                                    <div class="row container-form" style="display: none">
                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                            <input type="hidden" name="id_alvo" value="${projeto.requisito.id}"/>
                                            <input type="hidden" name="alvo" value="requisito"/>
                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                            <div class="input-control textarea">
                                                <textarea name="comentario_texto"></textarea>
                                            </div>
                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                        </form>
                                    </div>
                                </c:if>
                                <div class="list-group coment-content-area">
                                    <div class="group-content">
                                        <c:forEach var="comentario" items="${projeto.requisito.comentarios}">
                                            <a class="list" href="#">
                                                <div class="list-content">
                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                    <span class="list-remark">${comentario.texto}</span>
                                                </div>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    COMO INICIAR
                    -->
                    <div class="frame" id="tab_3">
                        <p>Aqui você encontra informações de como iniciar no projeto.</p>
                        <div class="tab-control" data-role="tab-control" style="margin-top: 20px">
                            <ul class="tabs">
                                <li class="active"><a href="#fluxo">${t["tab.fluxo"]}</a></li>
                                <li><a href="#tarefaFacil" id="tab_tarefaFacil">${t["tab.tarefa"]}</a></li>
                                <li><a href="#especialista">${t["tab.mentor"]}</a></li>
                            </ul>
                            <div class="frames">
                                <!-- fluxo de contribuição -->
                                <div class="frame" id="fluxo">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["fluxo.titulo"]}<span class="fg-green rating_nota place-right"></span></legend>
                                        <p>${projeto.comoIniciar.fluxo.texto}</p>
                                        <div class="grid fluid text-left ">
                                            <div class="row">
                                                <div class="span2 offset0">
                                                    <a href="#" onclick="ativaAba('#tab2')" style="width: 100%;height: 20px;padding-bottom: 5px">${t["fluxo.habilidades"]}</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="span3 offset1">
                                                    <a href="#" onclick="ativaAba('#tab5')" style="width: 100%;height: 20px;padding-bottom: 5px">${t["fluxo.workspace"]}</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="span4 offset2">
                                                    <a href="#" onclick="ativaAba('#tab6')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.codigo"]}</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="span5 offset3">
                                                    <a href="#" onclick="ativaAba('#tab2')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.requisito"]}</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="span6 offset4 ">
                                                    <a href="#" onclick="ativaAba('#tab_tarefaFacil')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.tarefa"]}</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="span7 offset5">
                                                    <a href="#" onclick="ativaAba('#tab7')" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.contribuicao"]}</a>
                                                </div>
                                            </div>
                                            <div class="row text-center">
                                                <div class="span12">
                                                    <a href="#" onclick="ativaAba('#tab4')" class="tile bg-lightGreen fg-white" style="width: 100%;height: 100%;padding: 5px">${t["fluxo.suporte"]}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Área de Comentários -->
                                        <div class="row coment-area" style="margin-top: 100px">
                                            <div class="listview-outlook" data-role="listview"> 
                                                <div class="row padding5 border-bottom">
                                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                                    <c:if test="${userLogado.logado==true}">
                                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                                    </c:if>
                                                </div>
                                                <c:if test="${userLogado.logado==true}">
                                                    <div class="row container-form" style="display: none">
                                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                                            <input type="hidden" name="id_alvo" value="${projeto.comoIniciar.fluxo.id}"/>
                                                            <input type="hidden" name="alvo" value="fluxo"/>
                                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                                            <div class="input-control textarea">
                                                                <textarea name="comentario_texto"></textarea>
                                                            </div>
                                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                <div class="list-group coment-content-area">
                                                    <div class="group-content">
                                                        <c:forEach var="comentario" items="${projeto.comoIniciar.fluxo.comentarios}">
                                                            <a class="list" href="#">
                                                                <div class="list-content">
                                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                                    <span class="list-remark">${comentario.texto}</span>
                                                                </div>
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- Encontrar tarefa fácil -->
                                <div class="frame" id="tarefaFacil">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tarefa.titulo"]}<span class="fg-green rating_nota place-right"></span></legend>
                                        <div class="row">
                                            <p>${projeto.comoIniciar.tarefaFacil.texto}</p>
                                        </div>
                                        <!--feed area -->
                                        <div class="grid fluid">
                                            <c:set var="total_feeds" value="${projeto.comoIniciar.tarefaFacil.feeds.size()}"/>
                                            <c:forEach var="feed" items="${projeto.comoIniciar.tarefaFacil.feeds}" varStatus="fds">
                                                <c:if test="${(fds.count-1)==0 || (fds.count-1)%2==0}">
                                                    <div class="row">
                                                    </c:if>
                                                    <div class="span6">
                                                        <script type="text/javascript">
                                                            document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');
                                                        </script>
                                                        <script type="text/javascript">
                                                            (function () {
                                                                var params = {
                                                                    rssmikle_url: "<c:out value="${feed.url}"/>",
                                                                    rssmikle_frame_width: "500",
                                                                    rssmikle_frame_height: "500",
                                                                    frame_height_by_article: "0",
                                                                    rssmikle_target: "_blank",
                                                                    rssmikle_font: "Arial, Helvetica, sans-serif",
                                                                    rssmikle_font_size: "12",
                                                                    rssmikle_border: "off",
                                                                    responsive: "off",
                                                                    rssmikle_css_url: "",
                                                                    text_align: "left",
                                                                    text_align2: "left",
                                                                    corner: "off",
                                                                    scrollbar: "on",
                                                                    autoscroll: "on",
                                                                    scrolldirection: "up",
                                                                    scrollstep: "5",
                                                                    mcspeed: "20",
                                                                    sort: "Off",
                                                                    rssmikle_title: "on",
                                                                    rssmikle_title_sentence: "<c:out value="${feed.titulo}"/>",
                                                                    rssmikle_title_link: "",
                                                                    rssmikle_title_bgcolor: "#0066FF",
                                                                    rssmikle_title_color: "#FFFFFF",
                                                                    rssmikle_title_bgimage: "",
                                                                    rssmikle_item_bgcolor: "#FFFFFF",
                                                                    rssmikle_item_bgimage: "",
                                                                    rssmikle_item_title_length: "55",
                                                                    rssmikle_item_title_color: "#0066FF",
                                                                    rssmikle_item_border_bottom: "on",
                                                                    rssmikle_item_description: "on",
                                                                    item_link: "off",
                                                                    rssmikle_item_description_length: "150",
                                                                    rssmikle_item_description_color: "#666666",
                                                                    rssmikle_item_date: "gl1",
                                                                    rssmikle_timezone: "Etc/GMT",
                                                                    datetime_format: "%b %e, %Y %l:%M:%S %p",
                                                                    item_description_style: "text",
                                                                    item_thumbnail: "full",
                                                                    item_thumbnail_selection: "auto",
                                                                    article_num: "15",
                                                                    rssmikle_item_podcast: "off",
                                                                    keyword_inc: "",
                                                                    keyword_exc: ""};
                                                                feedwind_show_widget_iframe(params);
                                                            })();
                                                        </script>
                                                        <div style="font-size:10px; text-align:center; width:600px;">
                                                            <a href="http://feed.mikle.com/" target="_blank" style="color:#CCCCCC;">RSS Feed Widget</a>
                                                            <!--Please display the above link in your web page according to Terms of Service.-->
                                                        </div><!-- end feedwind code -->
                                                    </div>
                                                    <c:if test="${(fds.count-1)%2!=0|| fds.count==total_feeds}">
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <!-- Área de Comentários -->
                                        <div class="row coment-area" style="margin-top: 100px">
                                            <div class="listview-outlook" data-role="listview"> 
                                                <div class="row padding5 border-bottom">
                                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                                    <c:if test="${userLogado.logado==true}">
                                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                                    </c:if>
                                                </div>
                                                <c:if test="${userLogado.logado==true}">
                                                    <div class="row container-form" style="display: none">
                                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                                            <input type="hidden" name="id_alvo" value="${projeto.comoIniciar.tarefaFacil.id}"/>
                                                            <input type="hidden" name="alvo" value="tarefa"/>
                                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                                            <div class="input-control textarea">
                                                                <textarea name="comentario_texto"></textarea>
                                                            </div>

                                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                <div class="list-group coment-content-area">
                                                    <div class="group-content">
                                                        <c:forEach var="comentario" items="${projeto.comoIniciar.tarefaFacil.comentarios}">
                                                            <a class="list" href="#">
                                                                <div class="list-content">
                                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                                    <span class="list-remark">${comentario.texto}</span>
                                                                </div>
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- Encontrar especialista -->    
                                <div class="frame" id="especialista">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["mentor.titulo"]}<span class="fg-green rating_nota place-right"></span></legend>
                                        <p>${projeto.comoIniciar.mentor.texto}</p>
                                        <p>
                                            Here you can find a list of mentors engaged to help newcomers to Amarok: Mentors of Amarok by OpenHatch

                                            Other than this:

                                            It is possible to solve doubts and get support from developers using mailing list and IRC
                                            When you choose a task you can ask for help and mentorship in bugzilla, by commenting the task and asking for proper support.
                                            You can check who are the experts by looking at the CC list of the task (as you can observe in the Figure below).
                                        </p>
                                        <img src="http://localhost:8080/AjudaNovatos/images/projeto/find_mentor.png" alt="encontre um mentor" style="width: 100%;height: 300px"/>
                                        <!-- Área de Comentários -->
                                        <div class="row coment-area" style="margin-top: 100px">
                                            <div class="listview-outlook" data-role="listview"> 
                                                <div class="row padding5 border-bottom">
                                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                                    <c:if test="${userLogado.logado==true}">
                                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                                    </c:if>
                                                </div>
                                                <c:if test="${userLogado.logado==true}">
                                                    <div class="row container-form" style="display: none">
                                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                                            <input type="hidden" name="id_alvo" value="${projeto.comoIniciar.mentor.id}"/>
                                                            <input type="hidden" name="alvo" value="mentor"/>
                                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                                            <div class="input-control textarea">
                                                                <textarea name="comentario_texto"></textarea>
                                                            </div>
                                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                <div class="list-group coment-content-area">
                                                    <div class="group-content">
                                                        <c:forEach var="comentario" items="${projeto.comoIniciar.mentor.comentarios}">
                                                            <a class="list" href="#">
                                                                <div class="list-content">
                                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                                    <span class="list-remark">${comentario.texto}</span>
                                                                </div>
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    COMUNICACAO
                    -->
                    <div class="frame" id="tab_5">
                        <div class="tab-control" data-role="tab-control">
                            <ul class="tabs">
                                <li class="active"><a href="#pesquiseAntes">${t["tab.pesquisa"]}</a> </li>
                                <li><a href="#batePapo">${t["tab.irc"]}</a></li>
                                <li><a href="#listaDiscussao">${t["tab.lista.discussao"]}</a></li>
                            </ul>
                            <div class="frames">
                                <!--pesquise antes -->
                                <div class="frame" id="pesquiseAntes">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.pesquisa.titulo1"]}<span class="fg-green rating_nota place-right"></span></legend>
                                    </fieldset>
                                    <div class="grid fluid">
                                        <div class="row">
                                            <div class="span6">
                                                <fieldset>
                                                    <legend class="fg-darkBlue">${t["tab.pesquisa.titulo2"]}</legend>
                                                    <p>Tente procurar nos arquivos das listas de discussão e wiki antes de 
                                                        fazer sua pergunta. É uma boa prática tentar, vc mesmo, encontrar uma solução.</p>
                                                    <!-- SiteSearch Google -->
                                                    <p>Buscar uma solução no Google.</p>
                                                    <div class="input-control text">
                                                        <form class="google-search">
                                                            <input type="text" placeholder="Buscar no Google"/>
                                                            <button type="submit" class="btn-search"></button>
                                                        </form>
                                                    </div>
                                                    <!-- SiteSearch Google -->
                                                </fieldset>
                                            </div>

                                            <div class="span6">
                                                <fieldset>
                                                    <legend class="fg-darkBlue">${t["tab.pesquisa.titulo3"]}</legend>
                                                    <p>
                                                        Veja outros documentos disponibilizados pelo projeto:
                                                    </p>
                                                    <div class="button-dropdown">
                                                        <button class="link">Link</button>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Área de Comentários -->
                                    <div class="row coment-area" style="margin-top: 100px">
                                        <div class="listview-outlook" data-role="listview"> 
                                            <div class="row padding5 border-bottom">
                                                <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                                <c:if test="${userLogado.logado==true}">
                                                    <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                                </c:if>
                                            </div>
                                            <c:if test="${userLogado.logado==true}">
                                                <div class="row container-form" style="display: none">
                                                    <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                                        <input type="hidden" name="id_alvo" value="${projeto.comunicacao.pesquisa.id}"/>
                                                        <input type="hidden" name="alvo" value="pesquisa"/>
                                                        <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                                        <div class="input-control textarea">
                                                            <textarea name="comentario_texto"></textarea>
                                                        </div>
                                                        <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                                        <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                                    </form>
                                                </div>
                                            </c:if>
                                            <div class="list-group coment-content-area">
                                                <div class="group-content">
                                                    <c:forEach var="comentario" items="${projeto.comunicacao.pesquisa.comentarios}">
                                                        <a class="list" href="#">
                                                            <div class="list-content">
                                                                <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                                <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                                <span class="list-remark">${comentario.texto}</span>
                                                            </div>
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Canal de comunicação IRC -->
                                <div class="frame" id="batePapo">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.irc.titulo1"]}<span class="fg-green rating_nota place-right"></span></legend>
                                        <p>${projeto.comunicacao.irc.texto}</p>
                                        <div class="fg-red">
                                            <iframe src="${projeto.comunicacao.irc.url}" style="border: none;width:100%;height: 500px"></iframe>
                                        </div>
                                        <!-- Área de Comentários -->
                                        <div class="row coment-area" style="margin-top: 100px">
                                            <div class="listview-outlook" data-role="listview"> 
                                                <div class="row padding5 border-bottom">
                                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                                    <c:if test="${userLogado.logado==true}">
                                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                                    </c:if>
                                                </div>
                                                <c:if test="${userLogado.logado==true}">
                                                    <div class="row container-form" style="display: none">
                                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                                            <input type="hidden" name="id_alvo" value="${projeto.comunicacao.irc.id}"/>
                                                            <input type="hidden" name="alvo" value="chat"/>
                                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                                            <div class="input-control textarea">
                                                                <textarea name="comentario_texto"></textarea>
                                                            </div>
                                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                                        </form>
                                                    </div>
                                                </c:if>
                                                <div class="list-group coment-content-area">
                                                    <div class="group-content">
                                                        <c:forEach var="comentario" items="${projeto.comunicacao.irc.comentarios}">
                                                            <a class="list" href="#">
                                                                <div class="list-content">
                                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                                    <span class="list-remark">${comentario.texto}</span>
                                                                </div>
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <!-- Lista de discussão -->
                                <div class="frame" id="listaDiscussao">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.lista.titulo1"]}<span class="fg-green rating_nota place-right"></span></legend>
                                        <p>Link: <a href="<c:out value="{projeto.comunicacao.lista.link}"/>" target="_blank">{projeto.comunicacao.lista.link}</a></p>
                                    </fieldset>
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.lista.titulo2"]}</legend>
                                        <p>
                                            ${projeto.comunicacao.lista.subscricao}
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.lista.titulo3"]}</legend>
                                        <p>
                                            ${projeto.comunicacao.lista.informacao}
                                        </p>
                                    </fieldset>
                                    <!-- Área de Comentários -->
                                    <div class="row coment-area" style="margin-top: 100px">
                                        <div class="listview-outlook" data-role="listview"> 
                                            <div class="row padding5 border-bottom">
                                                <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                                <c:if test="${userLogado.logado==true}">
                                                    <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                                </c:if>
                                            </div>
                                            <c:if test="${userLogado.logado==true}">
                                                <div class="row container-form" style="display: none">
                                                    <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">

                                                        <input type="hidden" name="id_alvo" value="${projeto.comunicacao.lista.id}"/>
                                                        <input type="hidden" name="alvo" value="lista"/>
                                                        <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                                        <div class="input-control textarea">
                                                            <textarea name="comentario_texto"></textarea>
                                                        </div>
                                                        <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                                        <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                                    </form>
                                                </div>
                                            </c:if>
                                            <div class="list-group coment-content-area">
                                                <div class="group-content">
                                                    <c:forEach var="comentario" items="${projeto.comunicacao.lista.comentarios}">
                                                        <a class="list" href="#">
                                                            <div class="list-content">
                                                                <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                                <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                                <span class="list-remark">${comentario.texto}</span>
                                                            </div>
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    CONFIGURAÇÃO DO ESPAÇO DE TRABALHO
                    -->
                    <div class="frame" id="tab_4">
                        <fieldset>
                            <legend class="fg-darkBlue">${t["tab.workspace.titulo1"]}<span class="fg-green rating_nota place-right"></span></legend>
                        </fieldset>
                        <div class="grid fluid">
                            <div class="row ">
                                <div class="span6">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.workspace.titulo2"]}</legend>
                                    </fieldset>
                                    ${projeto.configurarWorkspace.texto}
                                </div>
                                <div class="span6">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.workspace.titulo3"]}</legend>
                                        <p>Perguntar se o projeto possui endereço do histórico de arquivos da lista de email </p>
                                        <!-- SiteSearch Google -->
                                        <p>Buscar uma solução no Google.</p>
                                        <div class="input-control text">
                                            <form class="google-search">
                                                <input type="text" placeholder="Buscar no Google"/>
                                                <button type="submit" class="btn-search"></button>
                                            </form>
                                        </div>
                                        <!-- SiteSearch Google -->
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <!-- Área de Comentários -->
                        <div class="row coment-area" style="margin-top: 100px">
                            <div class="listview-outlook" data-role="listview"> 
                                <div class="row padding5 border-bottom">
                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                    <c:if test="${userLogado.logado==true}">
                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                    </c:if>
                                </div>
                                <c:if test="${userLogado.logado==true}">
                                    <div class="row container-form" style="display: none">
                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                            <input type="hidden" name="id_alvo" value="${projeto.configurarWorkspace.id}"/>
                                            <input type="hidden" name="alvo" value="workspace"/>
                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                            <div class="input-control textarea">
                                                <textarea name="comentario_texto"></textarea>
                                            </div>
                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                        </form>
                                    </div>
                                </c:if>
                                <div class="list-group coment-content-area">
                                    <div class="group-content">
                                        <c:forEach var="comentario" items="${projeto.configurarWorkspace.comentarios}">
                                            <a class="list" href="#">
                                                <div class="list-content">
                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                    <span class="list-remark">${comentario.texto}</span>
                                                </div>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    ENTENDENDO O CODIGO
                    -->
                    <div class="frame" id="tab_6">
                        <fieldset>
                            <legend class="fg-darkBlue">${t["tab.entender.titulo1"]}<span class="fg-green rating_nota place-right"></span></legend>
                        </fieldset>
                        <div class="grid fluid">
                            <div class="row">
                                <div class="span6">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.entender.titulo2"]}</legend>
                                        ${projeto.entendendoCodigo.documentacao}
                                    </fieldset>
                                </div>
                                <div class="span6">
                                    <fieldset>
                                        <legend class="fg-darkBlue">${t["tab.entender.titulo3"]}</legend>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <!-- Área de Comentários -->
                        <div class="row coment-area" style="margin-top: 100px">
                            <div class="listview-outlook" data-role="listview"> 
                                <div class="row padding5 border-bottom">
                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                    <c:if test="${userLogado.logado==true}">
                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                    </c:if>
                                </div>
                                <c:if test="${userLogado.logado==true}">
                                    <div class="row container-form" style="display: none">
                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">

                                            <input type="hidden" name="id_alvo" value="${projeto.entendendoCodigo.id}"/>
                                            <input type="hidden" name="alvo" value="codigo"/>
                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                            <div class="input-control textarea">
                                                <textarea name="comentario_texto"></textarea>
                                            </div>
                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                        </form>
                                    </div>
                                </c:if>
                                <div class="list-group coment-content-area">
                                    <div class="group-content">
                                        <c:forEach var="comentario" items="${projeto.entendendoCodigo.comentarios}">
                                            <a class="list" href="#">
                                                <div class="list-content">
                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                    <span class="list-remark">${comentario.texto}</span>
                                                </div>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                    ENVIAR CONTRIBUICAO
                    -->
                    <div class='frame' id='tab_7'>
                        <fieldset>
                            <legend class="fg-darkBlue">${t["tab.contribuicao.titulo1"]}<span class="fg-green rating_nota place-right"></span></legend>
                                ${projeto.submeterMudanca.texto}
                        </fieldset>
                        <!-- Área de Comentários -->
                        <div class="row coment-area" style="margin-top: 100px">
                            <div class="listview-outlook" data-role="listview"> 
                                <div class="row padding5 border-bottom">
                                    <span class="text-bold fg-green"><i class="icon-comments-5"></i> Comentários</span>
                                    <c:if test="${userLogado.logado==true}">
                                        <span class="element place-right"><a href="#" class="fg-green coment-btn"><i class="icon-plus"> </i> Novo</a></span>
                                    </c:if>
                                </div>
                                <c:if test="${userLogado.logado==true}">
                                    <div class="row container-form" style="display: none">
                                        <form class="coment-form" method="get" action="/AjudaNovatos/adicionaComentario">
                                            <input type="hidden" name="id_alvo" value="${projeto.submeterMudanca.id}"/>
                                            <input type="hidden" name="alvo" value="mudanca"/>
                                            <input type="hidden" name="comentario_autor" value="${userLogado.nome}"/>
                                            <div class="input-control textarea">
                                                <textarea name="comentario_texto"></textarea>
                                            </div>
                                            <input type="submit" value="Enviar Comentário" class="bg-blue fg-white"/> 
                                            <input type="button" value="Cancelar" class="coment-cancel bg-orange fg-white"/>
                                        </form>
                                    </div>
                                </c:if>
                                <div class="list-group coment-content-area">
                                    <div class="group-content">
                                        <c:forEach var="comentario" items="${projeto.submeterMudanca.comentarios}">
                                            <a class="list" href="#">
                                                <div class="list-content">
                                                    <span class="list-title"><span class="rating small fg-yellow no-margin place-right" data-score="${comentario.nota}" data-stars="5" data-role="rating"></span>${comentario.autor}</span>
                                                    <span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ${comentario.dataComentario}</span>
                                                    <span class="list-remark">${comentario.texto}</span>
                                                </div>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>              
        </div>  
        <script type="text/javascript">
            // AREA DE COMENTARIO ESCONDER/MOSTRAR
            $(function () {
                // ATRIBUIÇÃO DE NOTA
                var nota = 0;
                $(".rating_nota").rating({
                    static: false,
                    score: 0,
                    stars: 5,
                    showHint: true,
                    hints: ['péssimo', 'ruim', 'regular', 'bom', 'ótimo'],
                    showScore: false,
                    click: function (value, rating) {
                        rating.rate(value);
                        nota = value;
                    }
                });

                $(".coment-btn").on('click', function () {//exibe formulario de comentario
                    $('.container-form').toggle('slow');
                });

                // CANCELAR E ESCONDER FORMULARIO DE COMENTARIO
                $(".coment-cancel").on('click', function (event) {
                    $(this).closest('.container-form').fadeOut();
                });

                // ENVIAR COMENTÁRIO
                $('.coment-form').on('submit', function (event) {
                    event.preventDefault();
                    var form = $(this);
                    var comentario_data = new Date().toLocaleString();
                    var coment_area = $(this).closest(".coment-area").find(".coment-content-area .group-content");
                    var dados = $(form).serialize() + "&nota=" + nota;
                    console.log(dados);
                    $.ajax({
                        type: 'GET',
                        url: '/AjudaNovatos/adicionarComentario',
                        data: dados + "&comentario_data=" + comentario_data + "&nota=" + nota
                    }).done(function () {
                        $(coment_area).append(
                                '<a class="list" href="#"><div class="list-content"><span class="list-title"> <span class="rating small fg-red no-margin place-right" data-score="' + nota + '" data-stars="5" data-role="rating"></span>' + '${userLogado.nome}' + '</span><span class="list-subtitle"><span class="place-right">1:51</span>Adicionado em ' + comentario_data + '</span><span class="list-remark">' + $(form).find("textarea").val() + '</span></div></a>');
                        $(this).find('textarea').val("");
                    }).fail(function () {
                        alert("Não foi possível adicionar o comentario!");
                    });
                });
            });
        </script>
    </body>
</html>
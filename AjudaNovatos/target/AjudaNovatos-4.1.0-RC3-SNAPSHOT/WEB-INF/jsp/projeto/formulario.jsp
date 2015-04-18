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
            <c:choose>
                <c:when test="${option=='update'}">
                    <h1 style="margin-top: 2%;margin-bottom: 2%">Alterar projeto</h1>
                </c:when>
                <c:otherwise>
                    <h1 style="margin-top: 2%;margin-bottom: 2%">Adicionar projeto</h1>
                </c:otherwise>
            </c:choose>
            <form id="dados-form" method="POST" action="<c:url value="/projeto/salvar"/>" enctype="multipart/form-data">
                <input type="hidden" name="projeto.id" value="${projeto.id}"/>
                <div class="tab-control" data-role="tab-control">
                    <ul class="tabs">
                        <li class="active"><a href="#tab_1">Dados</a></li>
                        <li id="tab2"><a href="#tab_2">Requisitos</a></li>
                        <li id="tab3"><a href="#tab_3">Por onde começar?</a></li>
                        <li id="tab4"><a href="#tab_4">Espaço de Trabalho</a></li>
                        <li id="tab5"><a href="#tab_5">Comunicação</a></li>
                        <li id="tab6"><a href="#tab_6">Entender Código</a></li>
                        <li id="tab7"><a href="#tab_7">Submissão de Mudanças</a></li>
                        <li style="width: auto;float: right; text-align: right">
                            <input style="height: 30px" type="submit" class="bg-green fg-white" value="Salvar">
                            <a href='/AjudaNovatos' class="bg-orange fg-white button"> Cancelar</a>
                        </li>
                    </ul>

                    <div class="frames">
                        <!--
                        DADOS DO PROJETO
                        -->
                        <div class="frame" id="tab_1">
                            <p>Informe os dados referentes ao projeto.</p>
                            <div class="grid">
                                <div class="row">
                                    <div class="span7">
                                        <label class="text-bold">Nome:</label>
                                        <div class="input-control text" data-role="input-control">
                                            <input id="dados-nome" name="projeto.nome" type="text" placeholder="Nome do projeto" value="${projeto.nome}">
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>                                 
                                        <label class="text-bold border-top">Página do Projeto:</label>
                                        <div class="input-control text" data-role="input-control">
                                            <input id="dados-site" name="projeto.site" type="text" placeholder="Site do projeto" value="${projeto.site}">
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>          

                                        <label class="text-bold border-top">Repositorio:</label>
                                        <input type="hidden" name="projeto.repositorio.id" value="${projeto.repositorio.id}"/>
                                        <div class="row no-margin">
                                            <div class="span2">
                                                <div class="input-control select">
                                                    <select id="repos" name="projeto.repositorio.tipo">
                                                        <option>-</option>
                                                        <option value="git" ${projeto.repositorio.tipo eq 'git' ? 'selected':''}>Git</option>
                                                        <option value="subversion" ${projeto.repositorio.tipo eq 'subversion' ? 'selected':''}>Subversion</option>
                                                        <option value="cvs" ${projeto.repositorio.tipo eq 'cvs' ? 'selected':''}>CVS</option>
                                                        <option value="mercurial" ${projeto.repositorio.tipo eq 'mercurial' ? 'selected':''}>Mercurial</option>
                                                        <option value="bazaar" ${projeto.repositorio.tipo eq 'bazaar' ? 'selected':''}>Bazaar</option>
                                                        <option value="outro" ${projeto.repositorio.tipo eq 'outro' ? 'selected':''}>Outro</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="span5">
                                                <div class="input-control text" data-role="input-control">
                                                    <input id="dados-codigoFonte" name="projeto.repositorio.link" placeholder="Endereco do repositório" value="${projeto.repositorio.link}"/>
                                                    <button class="btn-clear" tabindex="-1"></button>
                                                </div> 
                                            </div> 
                                        </div> 

                                        <label class="text-bold border-top">Gestor de bug:</label>
                                        <div class="input-control text" data-role="input-control">
                                            <input id="dados-gestorBug" name="projeto.gestorBug" type="text" placeholder="Gestor de bug" value="${projeto.gestorBug}">
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>

                                        <label class="text-bold border-top">Link do projeto no OpenHub:</label>
                                        <div class="input-control text" data-role="input-control">
                                            <input id="dados-gestorBug" name="projeto.openHub" type="text" placeholder="Link no OpenHub" value="${projeto.openHub}"/>
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>  

                                        <label class="text-bold border-top">Wiki do Projeto:</label>
                                        <div class="input-control text" data-role="input-control">
                                            <input id="dados-gestorBug" name="projeto.wiki" type="text" placeholder="Wiki do Projeto" value="${projeto.wiki}"/>
                                            <button class="btn-clear" tabindex="-1"></button>
                                        </div>                                     

                                        <label class="text-bold border-top">Lista de Email</label>
                                        <div class="row no-margin">
                                            <div class="span7">
                                                <div class="input-control text">
                                                    <input type="text" placeholder="Endereco da Lista de Email" id="end_lista" name="projeto.listaDiscussao" value="${projeto.listaDiscussao}"/>
                                                    <button class="btn-clear"></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row no-margin ">
                                            <label class="text-bold border-top">Linguagem:</label>
                                            <div class="span4">
                                                <div class="input-control select">
                                                    <select id="lang">
                                                        <option></option>
                                                        <option value="Java">Java</option>
                                                        <option value="Php">Php</option>
                                                        <option value="Python">Python</option>
                                                        <option value="C++">C++</option>
                                                        <option value="Ruby">Ruby</option>
                                                        <option value="JavaScript">JavaScript</option>
                                                        <option value="C#">C#</option>
                                                        <option value="C">C</option>
                                                        <option value="Perl">Perl</option>
                                                        <option value="Go">Go</option>
                                                        <option value="Haskell">Haskell</option>
                                                        <option value="Skala">Skala</option>
                                                        <option value="Objective-C">Objective-C</option>
                                                        <option value="Clojure">Clojure</option>
                                                        <option value="Bash">Bash</option>
                                                        <option value="Lua">Lua</option>
                                                        <option value="Tcl">Tcl</option>
                                                        <option value="Xml">Xml</option>
                                                        <option value="Html">Html</option>
                                                        <option value="Outra">Outra</option>
                                                    </select>
                                                </div>
                                                <h6>Linguagens</h6>
                                                <table class="table hovered" id="tab_linguagem">
                                                    <tbody>
                                                        <c:forEach var="lang" items="${projeto.linguagens}" varStatus="cont">
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" value="${lang.texto}" name="projeto.linguagens[${cont.count-1}].texto"/>
                                                                    ${lang.texto}                                                               
                                                                </td>
                                                                <td>
                                                                    <button type="button" value='${lang.id}' class='bg-red mini fg-white remove_lang'>Remover</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="span2">
                                                <input style="height: 30px" type="button" class="bg-green fg-white" value="Inserir" id="add_linguagem"/>
                                            </div>
                                        </div>

                                        <div class="row no-margin">
                                            <label class="text-bold border-top">Plataforma:</label>
                                            <div class="span4">
                                                <div class="input-control select">
                                                    <select id="plat">
                                                        <option></option>
                                                        <option value="Linux">Linux</option>
                                                        <option value="Windows">Windows</option>
                                                        <option value="IOS">IOS</option>
                                                        <option value="Android">Android</option>
                                                        <option value="Windows Phone">Windows Phone</option>
                                                        <option value="Outra">Outra</option>
                                                    </select>
                                                </div>
                                                <h6>Plataformas</h6>
                                                <table class="table hovered border-left" id="tab_plataforma">
                                                    <tbody>
                                                        <c:forEach var="plataforma" items="${projeto.plataformas}" varStatus="cont">
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" value="${plataforma.texto}" name="projeto.plataformas[${cont.count-1}].texto"/>
                                                                    ${plataforma.texto}
                                                                </td>
                                                                <td>
                                                                    <button type='button' value='${plataforma.id}' class='bg-red mini fg-white remove_plat'>Remover</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="span2">
                                                <input style="height: 30px" type="button" class="bg-green fg-white" value="Inserir" id="add_plataforma"/>
                                            </div>
                                        </div>  
                                        <label class="text-bold border-top">Logotipo do projeto</label>
                                        <div class="input-control file">
                                            <input type="file" name="imagem"/>
                                            <button class="btn-file"></button>
                                        </div>
                                    </div>

                                    <div class="span7" style="float: right">
                                        <label>Descrição do projeto</label>
                                        <div class="input-control textarea" data-role="input-control">
                                            <textarea id="dados-descricao" name="projeto.descricao">${projeto.descricao}</textarea>
                                        </div>                                 
                                    </div>                                 
                                </div>                                 
                            </div>                                 
                        </div>

                        <!--
                        REQUISITOS
                        -->
                        <div class="frame" id="tab_2">
                            <input type="hidden" name="projeto.requisito.id" value="${projeto.requisito.id}"/>
                            <p>
                                Aqui você deve fornecer ao usuário informações sobre os requisitos necessários para que o novato tenha
                                um bom desempenho no projeto. Esses requisitos abrangem desde linguagens, conhecimento técnico, sociais,
                                proatividade, etc.                        
                            </p>
                            <!-- requisitos básicos -->
                            <div class="row">
                                <fieldset>
                                    <legend>Requisitos básicos</legend>
                                    <textarea class="tiny" name="projeto.requisito.requisitosBasico">
                                        ${projeto.requisito.requisitosBasico}
                                    </textarea>
                                </fieldset>
                            </div>
                            <div class="row" style="margin-top: 50px">
                                <!-- requisitos adicionais -->
                                <fieldset>
                                    <legend>Requisitos Adicionais</legend>
                                    <textarea class="tiny" name="projeto.requisito.requisitosAdicionais">
                                        ${projeto.requisito.requisitosAdicionais}
                                    </textarea>
                                </fieldset>                          
                            </div> 
                        </div> 

                        <!--
                        COMO INICIAR
                        -->
                        <div class='frame' id='tab_3'>
                            <input type="hidden" name="projeto.comoIniciar.id" value="${projeto.comoIniciar.id}"/>

                            <div class="tab-control" data-role="tab-control">
                                <div class="tabs">
                                    <li class="active"><a href="#tab-inicio-1">Fluxo de Contribuicao</a></li>
                                    <li><a href="#tab-inicio-2">Encontrar uma tarefa facil</a></li>
                                    <li><a href="#tab-inicio-3">Encontrar um auxiliador</a></li>
                                </div>
                                <div class="frames">
                                    <!-- Fluxo de contribuicao -->
                                    <input type="hidden" name="projeto.comoIniciar.fluxo.id" value="${projeto.comoIniciar.fluxo.id}"/>
                                    <div class="frame" id="tab-inicio-1">
                                        <p>O fluxo de contribuição é o processo no qual o novato deve passar até realizar sua primeira contribuição.</p>
                                        <p>Condireções sobre o fluxo de contribuição.</p>
                                        <textarea class="tiny" name="projeto.comoIniciar.fluxo.texto">
                                            ${projeto.comoIniciar.fluxo.texto}
                                        </textarea>                           
                                    </div>

                                    <!-- Encontrar tarefa facil -->
                                    <div class="frame" id="tab-inicio-2">
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

                                    <!-- Encontrar orientador -->
                                    <div class="frame" id="tab-inicio-3">
                                        <input type="hidden" name="projeto.comoIniciar.mentor.id" value="${projeto.comoIniciar.mentor.id}"/>
                                        <p>O projeto disponibiliza mentores aos novatos? Se sim, onde os mesmos podem ser encontrados?</p>
                                        <textarea class="tiny" name="projeto.comoIniciar.mentor.texto">
                                            ${projeto.comoIniciar.mentor.texto}
                                        </textarea>             
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--
                        CONFIGURAÇÃO DE ESPAÇO DE TRABALHO
                        -->
                        <div class="frame" id="tab_4">
                            <input type="hidden" name="projeto.configurarWorkspace.id" value="${projeto.configurarWorkspace.id}"/>
                            <p>
                                Aqui você deve mostrar ao novato quais são os recursos disponibilizados pelo projeto. Tais como, ajuda
                                ajuda para configurar espaço de trabalho e como enviar suas mudanças.
                            </p>
                            <p>Aqui você deve fornecer os recursos disponibilizados pelo projeto</p>
                            <textarea class="tiny" name="projeto.configurarWorkspace.texto">
                                ${projeto.configurarWorkspace.texto}
                            </textarea>                           
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

                        <!--
                        ENTENDER CODIGO
                        -->
                        <div class="frame" id="tab_6">
                            <input type="hidden" name="projeto.entendendoCodigo.id" value="${projeto.entendendoCodigo.id}"/>
                            <p>Entender o Código</p>
                            <textarea class="tiny" name="projeto.entendendoCodigo.documentacao">
                                ${projeto.entendendoCodigo.documentacao}
                            </textarea>
                        </div>

                        <!-- SUBMISSÃO DE MUDANÇAS -->
                        <div class="frame" id="tab_7">
                            <input type="hidden" name="projeto.submeterMudanca.id" value="${projeto.submeterMudanca.id}"/>
                            <p>Aqui você deve fornecer ao novato informações de como ele pode realizar a sua primeira contribuição</p>
                            <textarea class="tiny" name="projeto.submeterMudanca.texto">
                                ${projeto.submeterMudanca.texto}
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
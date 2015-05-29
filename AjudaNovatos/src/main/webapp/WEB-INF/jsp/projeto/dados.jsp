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
                                        <input class="disabled" id="dados-codigoFonte" name="projeto.repositorio.link" placeholder="Endereco do repositório" value="${projeto.repositorio.link}"/>
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
                                                        <input type="hidden" value="${lang.id}" name="projeto.linguagens[${cont.count-1}].id"/>
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
                                                        <input type="hidden" value="${plataforma.id}" name="projeto.plataformas[${cont.count-1}].id"/>
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
                        </div>

                        <div class="span7" style="float: right">
                            <label>Descrição do projeto</label>
                            <div class="input-control textarea" data-role="input-control">
                                <textarea id="dados-descricao" name="projeto.descricao">${projeto.descricao}</textarea>
                            </div>                                 
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- CSS -->
<link href="/AjudaNovatos/css/metro-bootstrap.css" rel="stylesheet">
<link href="/AjudaNovatos/css/metro-bootstrap-responsive.css" rel="stylesheet">
<link href="/AjudaNovatos/css/iconFont.css" rel="stylesheet">
<!-- JAVASCRIPT -->
<script src="/AjudaNovatos/js/jquery.min.js"></script>
<script src="/AjudaNovatos/js/jquery.widget.min.js"></script>
<script src="/AjudaNovatos/js/jquery.mousewheel.js"></script>
<script src="/AjudaNovatos/js/metro.min.js"></script>

<header>
    <nav class="navigation-bar bg-darkBlue">
        <div class="navigation-bar-content">
            <a href="/AjudaNovatos" class="element text-bold" style="font-size: 20px"><span class="icon-grid-view"></span> AJUDA NOVATOS</a>
            <span class="element-divider"></span>
            <a class="pull-menu" href="#"></a>
            <div class="element place-left bg-black"  data-hint-mode="2" data-hint="Visualizar projetos.">
                <a class="dropdown-toggle " href="#" style="font-size: 20px"><span class=""></span> Projetos</a>
                <ul class="dropdown-menu place-left dark" data-role="dropdown">
                    <li>
                        <a href="#" class="dropdown-toggle" data-hint-mode="2" data-hint="Visualizar projetos por linguagem">Linguagem</a>
                        <ul class="dropdown-menu bg-grayLighter" data-role="dropdown">
                            <c:forEach items="${linguagens.getLinguagens()}" var="linguagem">
                                <li >
                                    <a href="<c:url value="/projeto/linguagem/${linguagem[1]}"/>" >
                                        <c:out value="${linguagem[1]}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="divider"></li>
                    <li><a href='<c:url value="/projetos/todos"/>' data-hint-mode="2" data-hint="Visualizar todos os projetos">Todos</a></li>
                </ul>
            </div> 
            <div class="no-tablet-portrait">
                <span class="element-divider"></span>
                <div class="element input-element">
                    <form method="post" action='<c:url value="/projetos/nome"/>' id="buscarProjeto">
                        <div class="input-control text">
                            <input type="text" id="busca" list="lista" name="busca" placeholder="Encontre um projeto..." style=" width: 350px; height: 35px" autocomplete="off"/>
                            <div style="margin-top: 0px;">
                                <datalist id="lista">
                                </datalist>
                            </div>
                            <button type="submit" class="btn-search" data-hint-mode="2" data-hint="Buscar projeto"></button>
                        </div>
                    </form>
                    <script type="text/javascript">
                        $(function () {
                            $("#busca").on("keyup", function (event) {
                                var key = event.keyCode;
                                if (key >= 65 && key <= 90 || key == 8) {
                                    $("#lista").empty();
                                    var aux = $(this).val();
                                    if (aux.length > 2) {
                                        $.ajax({
                                            type: 'GET',
                                            url: '<c:url value="/projetos.json"/>',
                                            data: "trecho=" + aux,
                                            dataType: 'json'
                                        }).done(function (data) {
                                            $.each(data.list, function (index, value) {
                                                $("#lista").append("<option>" + value[1] + "</option>");
                                            });
                                        }).fail(function (data) {
                                            alert("Ítem não adicionado! " + data);
                                        });
                                    }
                                }
                            });
                            $("#lista").on("focusout", function () {
                                console.log("selecionado");
                            });
                        });
                    </script>
                </div>
            </div>
            <a href='<c:url value="/projeto/novo"/>' class="element place-left bg-hover-red bg-lightRed" data-hint-mode="2" data-hint="Novo Projeto|Se você possui um projeto e gostaria de disponibilizá-lo, faça-o aqui." style='font-size: 18px'><span class="icon-plus-2"> </span> Cadastre seu Projeto</a>
            <c:choose>
                <c:when test="${userLogado.logado==false}">
                    <!-- Se nao estiver logado -->
                    <a href="<c:url value="/usuario/login"/>" class="element place-right" style='font-size: 18px'  data-hint-position="left" data-hint="Acessar o sistema"><span class="icon-enter"></span> Acessar</a>
                </c:when>
                <c:otherwise>
                    <!-- Se estiver logado -->
                    <div class="element place-right" style='font-size: 18px'>
                        <a class="dropdown-toggle" href="#"><span class="icon-user-2"></span> <c:out value='${userLogado.nome}'/></a>
                        <ul class="dropdown-menu place-right bg-blue fg-white" data-role="dropdown">
                            <li><a href="<c:url value="/perfil"/>" class="fg-hover-blue">Meus Dados</a></li>
                            <li><a href="<c:url value="/meus-projetos"/>" class="fg-hover-blue">Meus Projetos</a></li>
                            <li class="divider"></li>
                            <li><a href="<c:url value="/logout"/>" class="fg-hover-blue"><i class="icon-exit"></i> Logout</a></li>
                        </ul>
                    </div> 
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</header>
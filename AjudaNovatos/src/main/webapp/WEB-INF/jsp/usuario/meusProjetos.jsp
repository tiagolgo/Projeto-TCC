<%-- 
    Document   : meusProjetos
    Created on : 11/12/2014, 17:36:48
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../erros/404.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
        <div class="container">
            <div class="span10 offset2">
                <fieldset style="margin-top: 10%">
                    <legend class="fg-blue">Meus Projetos</legend>

                    <c:choose>
                        <c:when test="${projetosUser.size()==0}">
                            <p style="font-size: 20px">Voce não tem projetos</p>
                            <p style="margin-top: 50px">
                                <a href='<c:url value="/projeto/novo"/>'>Clique aqui e cadastre um projeto</a>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="projeto" items="${projetosUser}">
                                <div class="row border margin5 padding5 text-left">
                                    <h4>${projeto.nome}</h4>
                                    <p>Criacao: ${projeto.dataCriacao}</p>
                                    <a class="button small" href="<c:url value="/editar-projeto/${projeto.id}"/>"> Editar</a>
                                    <input class="button small" type="button" value="Remover" onclick="removerProjeto(${projeto.id});"/>
                                    <form id="projeto_${projeto.id}" action="<c:url value="/remove-projeto"/>" method="post">
                                        <input type="hidden" name="projeto"  value="${projeto.id}"/>
                                        <input type="hidden" name="_method" value="DELETE"/>
                                    </form>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    <script>
                        function removerProjeto(id) {
                            var c = confirm("Deseja realmente remover o projeto?");
                            if (c) {
                                $("#projeto_" + id).submit();
                            }
                            return false;
                        }
                    </script>
                </fieldset>
            </div>
        </div>
    </body>
</html>

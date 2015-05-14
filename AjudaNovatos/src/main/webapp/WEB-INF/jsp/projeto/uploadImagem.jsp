<%-- 
    Document   : uploadImagem
    Created on : 13/05/2015, 21:19:06
    Author     : Tiago Luiz Gomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h2>Teste de upload de imagem</h2>
        <c:out value="${msg}"/>
        <form action="<c:url value="/uploadImagem"/>" method="POST" enctype="multipart/form-data">
            <fieldset>
                <legend>Upload de Imagem</legend>
                <input type="file" name="imagem" />
                <button type="submit">Enviar</button>
            </fieldset>
        </form>
        <a href="<c:url value="/"/>">Voltar</a>

    </center>
</body>
</html>

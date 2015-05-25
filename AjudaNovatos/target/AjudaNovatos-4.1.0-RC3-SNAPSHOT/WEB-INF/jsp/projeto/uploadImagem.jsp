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
    <body class="metro">
        <c:import url="../componentes/header.jsp" />
    <center >
        <div class="container">
            <div class="span7" style="text-align: justify">
                <h1>Upload de imagem</h1>
                <c:out value="${msg}"/>
                <p>Seu projeto foi criado com sucesso, agora você pode inserir a imagem de logotipo.</p>
                <div class="span7 text-center" style="height: 270px;border: 2px solid lightgray">
                    <img width="50%" id="logotipo"/>
                </div>
                <div class="row">
                    <form action="<c:url value="/uploadImagem"/>" method="POST" enctype="multipart/form-data">
                        <input type="hidden" value="${nomeprojeto}" name="nomeprojeto" />
                        <div class="row ">
                            <input type="file" name="imagem" value="{projeto.logotipo}" id="setlogo"/>
                        </div>
                        <div class="row" style="margin-top: 20px">
                            <button type="submit">Salvar Imagem</button>
                            <a class="button" href="<c:url value="/"/>">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </center>
    <script type="text/javascript">
        $(function () {
            $("#setlogo").on("change", function () {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#logotipo').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(this.files[0]);
                }
            });
        });
    </script>

</body>
</html>

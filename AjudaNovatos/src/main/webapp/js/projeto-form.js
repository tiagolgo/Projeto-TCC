
// VALIDAÇÕES
$(function () {
    $("#dados-form").on("submit", function (event) {
        //dados do formulario                          
        var nome = $("#dados-nome").val();
        var site = $("#dados-site").val();
        var licenca = $("#dados-licenca").val();
        var fonte = $("#dados-codigoFonte").val();
        var bug = $("#dados-gestorBug").val();
        var descricao = $("#dados-descricao").val();
        var msg = "";
        if (nome == "") {
            msg += "- Informe o Nome do Projeto."
        }
        if (site == "") {
            msg += "- Informe o Site do Projeto."
        }
        if (descricao == "") {
            msg += "- Insira uma Descrição do Projeto."
        }
        if (msg != "") {
            event.preventDefault();
            alert(msg);
        } else {
            $(this).submit();
        }
    });
});

// OPTION SE POSSUI FEEDS OU NÃO
// Exibe/Esconde as opções para inserir/editar feeds de acordo com a opção selecionada
$(function () {
    $(".question").on("change", function () {
        var op = $(this).val();
        if (op == "true") {
            console.log("exibir opcoes " + op);
            $(".row-show").slideDown();
        } else {
            console.log("esconder opcoes")
            $(".row-show").hide("slow");
        }
    });
});

// INSERIR FEED
$(function () {
    $(".feeds-insert").on("click", function () {
        var linhas = document.getElementById("feeds-tabela").rows.length;
        var container = $(this).closest(".feeds-container");
        var titulo = $(container).find(".feed-title").val();
        var url = $(container).find(".feed-url").val();
        if (titulo == "" && url == "") {
            alert("Titulo e Url devem ser informados!")
        } else {
            $(".table-feeds tbody").append(
                    "<tr><td><input type='hidden' name='projeto.comoIniciar.tarefaFacil.feeds[" + linhas + "].titulo' value='" + titulo + "'/>" + titulo + "</td>" +
                    "<td><input type='hidden' name='projeto.comoIniciar.tarefaFacil.feeds[" + linhas + "].url' value='" + url + "'/>" + url + "</td>" +
                    "<td><input type='button' value='excluir' class='small bg-red fg-white feed-remove'/> </td></tr> "
                    );
            $(container).find("input").val("");
        }
    });
});
  
// REMOVER FEED
$(function () {
    $(".feed-remove").on("click", function () {
        var obj = $(this).val();
        var linha = $(this).closest("tr");
        if (obj != "") {
            console.log("remover feed "+obj);
            $.ajax({
                type: 'GET',
                url: '/AjudaNovatos/removeFeed',
                data: "id=" + obj
            }).done(function (data) {
                $(linha).remove();
            }).fail(function (data) {
                alert("Não foi possível remover o Feed: " + data.val());
            });
        }
    });
});

// OPTION SE POSSUI IRC OU NÃO
// Exibe/esconnde opções de inserção das informações sobre o IRC do projeto 
$(function () {
    $("#ircQuestao").on("change", function () {
        var op = $(this).val();
        if (op == "true") {
            $("#rowIrc").slideDown();
        } else {
            $("#rowIrc").hide("slow");
        }
    });
});

// OPTION LISTA DE DISCUSSÃO
// exibe/esconde opções de inserção/edição das informações sobre a lista de discussão
$(function () {
    $("#listaQuestao").on("change", function () {
        var op = $(this).val();
        if (op == "true") {
            $("#rowLista").slideDown();
        } else {
            //$("#rowLista").hide("slow");
            tinymce.get("#listaT");

        }
    });
});

// OPTION TIPO DE REPOSITÓRIO
// habilita/desabilita input para iserção/edição do link para o repositório
$(function () {
    $("#repos").on("change", function () {
        var aux = $(this).val();
        if (aux != "-") {
            $("#dados-codigoFonte").attr("disabled", false);
        } else {
            $("#dados-codigoFonte").attr("disabled", true);
        }
    });
});

// ADICIONA NOVA LINGUAGEM AO PROJETO
$(function () {
    $("#add_linguagem").on("click", function () {
        var linhas = document.getElementById("tab_linguagem").rows.length;
        var lang = $("#lang").val();
        $("#tab_linguagem").append("<tr><td><input class='no-border fg-green' type='text' name='projeto.linguagens[" + linhas + "].texto' value='" + lang + "'/></td><td><button type='button' class='bg-red mini fg-white remove_lang'>Remover</button></td></tr>");
    });
});

// REMOVE LINGUAGEM DO PROJETO
$(function () {
    $(document).on("click", ".remove_lang", function () {
        var linha = $(this).closest("tr");
        var obj = $(this).val();
        if (obj == "") {
            $($(this).closest("tr")).remove();
        } else {
            $.ajax({
                type: 'GET',
                url: '/AjudaNovatos/removeLinguagem"',
                data: "id=" + obj
            }).done(function (data) {
                $(linha).remove();
            }).fail(function (data) {
                alert("Linguagem nao removida: " + data);
            });
        }
    });
});

// ADICIONA PLATAFORMA AO PROJETO
$(function () {
    $("#add_plataforma").on("click", function () {
        var linhas = document.getElementById("tab_plataforma").rows.length;
        var plat = $("#plat").val();
        $("#tab_plataforma").append("<tr><td><input class='no-border fg-green' type='text' name='projeto.plataformas[" + linhas + "].texto' value='" + plat + "'/></td><td><button type='button' class='bg-red mini fg-white remove_plat'>Remover</button></td></tr>");
    });
});

//REMOVE PLATAFORMA DO PROJETO
$(function () {
    $(document).on("click", ".remove_plat", function () {
        var linha = $(this).closest("tr");
        var obj = $(this).val();
        if (obj == "") {
            $($(this).closest("tr")).remove();
        } else {
            $.ajax({
                type: 'GET',
                url: '/AjudaNovatos/removePlataforma',
                data: "id=" + obj
            }).done(function (data) {
                $(linha).remove();
            }).fail(function (data) {
                alert("Plataforma nao removida: " + data);
            });
        }
    });
});
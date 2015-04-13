/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dao.especificos.DaoComentario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Submeter_Mudanca;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class ComentarioController {

    private final Result result;
    private final Validator validator;
    private final DaoComentario dao;

    public ComentarioController() {
        this.result = null;
        this.validator = null;
        this.dao = null;
    }

    @Inject
    public ComentarioController(Result result, Validator validator, DaoComentario dao) {
        this.result = result;
        this.validator = validator;
        this.dao = dao;
    }

    @Get("/adicionarComentario")
    public void adicionaComentario(Long id_alvo, String alvo, String comentario_autor, String comentario_texto, String comentario_data) {
        // ALVOS -> tarefa, pesquisa, lista, fluxo, mentor, chat, mudanca, requisito, codigo, workspace      
        if (this.dao.saveComentario(id_alvo, alvo, comentario_autor, comentario_texto, comentario_data)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

}

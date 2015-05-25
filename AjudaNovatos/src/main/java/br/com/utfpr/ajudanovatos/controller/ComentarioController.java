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
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class ComentarioController {

    @Inject
    private Result result;
    @Inject
    private Validator validator;
    @Inject
    private DaoComentario dao;

    @Get("/adicionarComentario")
    public void adicionaComentario(Long id_alvo, String alvo, String comentario_autor, String comentario_texto, String comentario_data, int nota) {
        // ALVOS -> tarefa, pesquisa, lista, fluxo, mentor, chat, mudanca, requisito, codigo, workspace      
        if (this.dao.salvar(id_alvo, alvo, comentario_autor, comentario_texto, comentario_data, nota)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

}

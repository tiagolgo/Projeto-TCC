/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dao.especificos.DaoProjeto;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class IndexController {

    private final Result result;
    private final DaoProjeto dp;

    public IndexController() {
        this.result = null;
        this.dp = null;
    }

    @Inject
    public IndexController(Result result, DaoProjeto d) {
        this.result = result;
        this.dp = d;
    }

    @Path("/")
    public void index() {
        try {
            List<ProjetoBean> projetos = this.dp.getPaginacao(0, 10);
            List<ProjetoBean> recentes = this.dp.getRecentes();
            this.result.include("projetosLista", projetos).include("projetosRecentes", recentes);
        } catch (Exception e) {
            System.out.println(e.getCause());
        }
    }
}

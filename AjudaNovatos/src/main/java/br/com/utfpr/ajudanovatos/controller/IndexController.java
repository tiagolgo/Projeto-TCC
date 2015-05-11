/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dados_Globais.Dados;
import Dao.especificos.DaoProjeto;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class IndexController {

    @Inject
    private DaoProjeto dp;
    @Inject
    private Dados informacoes;

    @Path(value = {"/"})
    public void index() {
        System.out.println("no index controle");
        if (!this.informacoes.isAtualizado()) {
            List<ProjetoBean> recentes = this.dp.getRecentes();
            List<ProjetoBean> projetos = this.dp.getPaginacao(0, 10);
            List linguagens = this.dp.getLinguagens();
            //Object projetoCount = this.dp.projetoCount();
            this.informacoes.setAtualizado(true);
            this.informacoes.setLinguagens(linguagens);
            this.informacoes.setProjetos(projetos);
            this.informacoes.setProjetosRecentes(recentes);
            //this.informacoes.setTotalProjetos((Integer.parseInt(projetoCount.toString())));
        }
    }
}

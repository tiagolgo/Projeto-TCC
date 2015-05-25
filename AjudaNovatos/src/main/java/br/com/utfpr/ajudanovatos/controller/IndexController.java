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
        if (!this.informacoes.isAtualizado()) {
           // List<ProjetoBean> recentes = this.dp.getPaginacao(0, 10, true);
           // List<ProjetoBean> projetos = this.dp.getPaginacao(0, 10, false);
           // List linguagens = this.dp.listLinguagens();
            this.informacoes.setAtualizado(true);
            this.informacoes.setLinguagens(this.dp.listLinguagens());
            this.informacoes.setProjetosAntigo(this.dp.getPaginacao(0, 10, false));
            this.informacoes.setProjetosRecente(this.dp.getPaginacao(0, 10, true));
        }
    }
}

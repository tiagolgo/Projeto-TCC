/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dados_Globais;

import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
@Named("informacoesProjetos")
public class Dados {

    private boolean atualizado = false;
    private final List linguagens = new ArrayList<>();
    private List<ProjetoBean> projetos = new ArrayList();
    private List<ProjetoBean> projetosRecentes = new ArrayList();
    private int totalProjetos;

    public List getLinguagens() {
        return linguagens;
    }

    public void setLinguagens(List novasLinguagens) {
        List l1 = novasLinguagens;
        System.out.println("tamanho antes: " + l1.size());
        for (Object obj1 : novasLinguagens) {
            Object[] aux1 = (Object[]) obj1;
            for (Object obj2 : this.linguagens) {
                Object[] aux2 = (Object[]) obj2;
                if (aux1[1].equals(aux2[1])) {
                    l1.remove(obj1);
                }
            }
        }

        for (Object l2 : l1) {
            this.linguagens.add(l2);
        }
        System.out.println("tamanho depois: " + l1.size());
    }

    public List<ProjetoBean> getProjetos() {
        return projetos;
    }

    public void setProjeto(Projeto nomeProjeto) {
        //adicionar projeto caso nao exista na lista
        ProjetoBean projeto = new ProjetoBean();
        projeto.setNome(nomeProjeto.getNome());
        if (this.projetos.size() == 10) {
            this.projetos.remove(9);
        }
        this.projetos.add(projeto);
        this.setProjetoRecente(projeto);
        this.incrementaTotalProjetos();
    }

    public void setProjetos(List<ProjetoBean> projetos) {
        this.projetos = projetos;
    }

    public int getTotalProjetos() {
        return totalProjetos;
    }

    private void incrementaTotalProjetos() {
        this.totalProjetos = this.totalProjetos + 1;
    }

    public List<ProjetoBean> getProjetosRecentes() {
        return projetosRecentes;
    }

    public void setProjetoRecente(ProjetoBean projetoRecente) {
        if (this.projetosRecentes.size() == 10) {
            this.projetos.remove(9);
        }
        this.projetosRecentes.add(0, projetoRecente);
    }

    public void setAtualizado(boolean atualizado) {
        this.atualizado = atualizado;
    }

    public boolean isAtualizado() {
        return atualizado;
    }

    public void setProjetosRecentes(List<ProjetoBean> projetosRecentes) {
        this.projetosRecentes = projetosRecentes;
    }

    public void setTotalProjetos(int totalProjetos) {
        this.totalProjetos = totalProjetos;
    }
}

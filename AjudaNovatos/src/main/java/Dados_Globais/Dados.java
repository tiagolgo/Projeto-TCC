/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dados_Globais;

import br.com.utfpr.ajudanovatos.projeto.beans.LinguagemBean;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    private List<LinguagemBean> linguagens = new ArrayList<>();
    private List<ProjetoBean> projetosAntigo = new ArrayList();
    private List<ProjetoBean> projetosRecente = new ArrayList();
    private int totalProjetos;
    private final HashMap<String, Integer> totais = new HashMap<>();

    public boolean isAtualizado(){
        return atualizado;
    }

    public void setAtualizado(boolean atualizado){
        this.atualizado = atualizado;
    }

    public List<ProjetoBean> getProjetosAntigo(){
        return projetosAntigo;
    }

    public void setProjetosAntigo(List<ProjetoBean> projetosAntigo){
        this.projetosAntigo = projetosAntigo;
    }

    public List<ProjetoBean> getProjetosRecente(){
        return projetosRecente;
    }

    public void setProjetosRecente(List<ProjetoBean> projetosRecente){
        this.projetosRecente = projetosRecente;
    }

    public int getTotalProjetos(){
        return totalProjetos;
    }

    public void setProjetoRecente(ProjetoBean projeto){
        boolean existe = false;
        for (ProjetoBean p : this.projetosRecente) {
            if (p.getNome().equals(projeto.getNome())) {
                existe = true;
                break;
            }
        }
        if (!existe&&this.projetosRecente.size()==10) {
            this.projetosRecente.remove(9);
        }
        this.projetosRecente.add(0, projeto);

        this.totalProjetos = totalProjetos+1;
    }

    public void setProjetoAntigo(ProjetoBean projeto){
        boolean existe = false;
        for (ProjetoBean p : this.projetosAntigo) {
            if (p.getNome().equals(projeto.getNome())) {
                p.setId(projeto.getId());
                p.setLogotipo(projeto.getLogotipo());
                p.setNome(projeto.getNome());
                existe = true;
                break;
            }
        }

        if (!existe&&this.projetosAntigo.size()<10) {
            this.projetosAntigo.add(projeto);
        }
    }

    public void updateLogoProjeto(String projeto, String logo){
        for (ProjetoBean p : this.projetosRecente) {
            if (!p.getNome().equals(projeto)) {
                p.setLogotipo(logo);
                break;
            }
        }
    }

    public List getLinguagens(){
        return linguagens;
    }

    public void setLinguagens(List<Linguagem> langs){
        for (Linguagem lang : langs) {
            if (!totais.containsKey(lang.getTexto())) {//nao contem
                totais.put(lang.getTexto(), 1);
            } else {//ja contem
                int t = totais.get(lang.getTexto())+1;
                totais.put(lang.getTexto(), t);
            }
        }
        this.linguagens.clear();
        for (Map.Entry<String, Integer> entrySet : totais.entrySet()) {
            LinguagemBean lb = new LinguagemBean();
            lb.setTexto(entrySet.getKey());
            lb.setQuantidade(entrySet.getValue());
            this.linguagens.add(lb);
        }
    }

    public HashMap<String, Integer> getTotais(){
        return totais;
    }

    public void updateLogo(String projeto, String logo){
        for (ProjetoBean p : this.projetosAntigo) {
            if (p.getNome().equals(projeto)) {
                p.setLogotipo(logo);
                break;
            }
        }
        for (ProjetoBean p : this.projetosRecente) {
            if (p.getNome().equals(projeto)) {
                p.setLogotipo(logo);
                break;
            }
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dados_Globais;

import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
@Named("linguagens")
public class Dados {

    private List<Linguagem> liguagens = new ArrayList<>();
    private int totalProjetos;

    public List<Linguagem> getLinguagens() {
        return liguagens;
    }

    public void setLinguagens(List<Linguagem> linguagens) {
        this.liguagens = linguagens;
    }

    public int getTotalProjetos() {
        return totalProjetos;
    }

    public void setTotalProjetos(int totalProjetos) {
        this.totalProjetos = totalProjetos;
    }

}

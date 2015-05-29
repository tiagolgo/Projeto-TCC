/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
@Table(name = "requisito")
public class Requisito implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String requisitosBasico, requisitosAdicionais;
    @OneToMany(cascade = {CascadeType.REMOVE})
    @JoinColumn(name = "requisito", updatable = false)
    private List<Comentario> comentarios = new ArrayList<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRequisitosBasico() {
        return requisitosBasico;
    }

    public void setRequisitosBasico(String requisitosBasico) {
        this.requisitosBasico = requisitosBasico;
    }

    public String getRequisitosAdicionais() {
        return requisitosAdicionais;
    }

    public void setRequisitosAdicionais(String requisitosAdicionais) {
        this.requisitosAdicionais = requisitosAdicionais;
    }

    public List<Comentario> getComentarios() {
        return comentarios;
    }

    public void setComentarios(List<Comentario> comentarios) {
        this.comentarios = comentarios;
    }
    
}

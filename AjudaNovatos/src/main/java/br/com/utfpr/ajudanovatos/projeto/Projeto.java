/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.projeto;

import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import br.com.utfpr.ajudanovatos.projeto.infos.Plataforma;
import br.com.utfpr.ajudanovatos.projeto.infos.Repositorio;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Como_Iniciar;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Comunicacao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Configurar_Workspace;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Entendendo_Codigo;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Requisito;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Submeter_Mudanca;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Entity
@Table(name = "projeto")
public class Projeto implements Serializable {

    @Id
    @GeneratedValue
    Long id;
    @Column(columnDefinition = "MEDIUMTEXT")
    String descricao;
    String nome, site, codFonte, gestorBug, dataCriacao, listaDiscussao, openHub, wiki, logotipo;
    Long usuario;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "projeto")
    private List<Linguagem> linguagens = new ArrayList<>();

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "projeto")
    private List<Plataforma> plataformas = new ArrayList<>();

    @OneToOne(cascade = CascadeType.ALL)
    private Repositorio repositorio;

    @OneToOne(cascade = CascadeType.ALL)
    private Como_Iniciar comoIniciar;

    @OneToOne(cascade = CascadeType.ALL)
    private Comunicacao comunicacao;

    @OneToOne(cascade = CascadeType.ALL)
    private Configurar_Workspace configurarWorkspace;

    @OneToOne(cascade = CascadeType.ALL)
    private Entendendo_Codigo entendendoCodigo;

    @OneToOne(cascade = CascadeType.ALL)
    private Requisito requisito;

    @OneToOne(cascade = CascadeType.ALL)
    private Submeter_Mudanca submeterMudanca;

    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getDescricao(){
        return descricao;
    }

    public void setDescricao(String descricao){
        this.descricao = descricao;
    }

    public String getNome(){
        return nome;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public String getSite(){
        return site;
    }

    public void setSite(String site){
        this.site = site;
    }

    public String getCodFonte(){
        return codFonte;
    }

    public void setCodFonte(String codFonte){
        this.codFonte = codFonte;
    }

    public String getGestorBug(){
        return gestorBug;
    }

    public void setGestorBug(String gestorBug){
        this.gestorBug = gestorBug;
    }

    public String getDataCriacao(){
        return dataCriacao;
    }

    public void setDataCriacao(String dataCriacao){
        this.dataCriacao = dataCriacao;
    }

    public String getListaDiscussao(){
        return listaDiscussao;
    }

    public void setListaDiscussao(String listaDiscussao){
        this.listaDiscussao = listaDiscussao;
    }

    public String getOpenHub(){
        return openHub;
    }

    public void setOpenHub(String openHub){
        this.openHub = openHub;
    }

    public String getWiki(){
        return wiki;
    }

    public void setWiki(String wiki){
        this.wiki = wiki;
    }

    public String getLogotipo(){
        return logotipo;
    }

    public void setLogotipo(String logotipo){
        this.logotipo = logotipo;
    }

    public Long getUsuario(){
        return usuario;
    }

    public void setUsuario(Long usuario){
        this.usuario = usuario;
    }

    public List<Linguagem> getLinguagens(){
        return linguagens;
    }

    public void setLinguagens(List<Linguagem> linguagens){
        this.linguagens = linguagens;
    }

    public List<Plataforma> getPlataformas(){
        return plataformas;
    }

    public void setPlataformas(List<Plataforma> plataformas){
        this.plataformas = plataformas;
    }

    public Repositorio getRepositorio(){
        return repositorio;
    }

    public void setRepositorio(Repositorio repositorio){
        this.repositorio = repositorio;
    }

    public Como_Iniciar getComoIniciar(){
        return comoIniciar;
    }

    public void setComoIniciar(Como_Iniciar comoIniciar){
        this.comoIniciar = comoIniciar;
    }

    public Comunicacao getComunicacao(){
        return comunicacao;
    }

    public void setComunicacao(Comunicacao comunicacao){
        this.comunicacao = comunicacao;
    }

    public Configurar_Workspace getConfigurarWorkspace(){
        return configurarWorkspace;
    }

    public void setConfigurarWorkspace(Configurar_Workspace configurarWorkspace){
        this.configurarWorkspace = configurarWorkspace;
    }

    public Entendendo_Codigo getEntendendoCodigo(){
        return entendendoCodigo;
    }

    public void setEntendendoCodigo(Entendendo_Codigo entendendoCodigo){
        this.entendendoCodigo = entendendoCodigo;
    }

    public Requisito getRequisito(){
        return requisito;
    }

    public void setRequisito(Requisito requisito){
        this.requisito = requisito;
    }

    public Submeter_Mudanca getSubmeterMudanca(){
        return submeterMudanca;
    }

    public void setSubmeterMudanca(Submeter_Mudanca submeterMudanca){
        this.submeterMudanca = submeterMudanca;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dados_Globais.Dados;
import Dao.especificos.DaoProjeto;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import static br.com.caelum.vraptor.view.Results.json;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.entidade.usuario.UsuarioLogado;
import java.time.LocalDate;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.HibernateException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class ProjetoController {

    @Inject
    private Result result;
    @Inject
    private DaoProjeto dao;
    @Inject
    private UsuarioLogado usuario;
    @Inject
    private Validator validator;
    @Inject
    private Dados dados;
    @Inject
    Upload_File upload;

    @Get(value = {"pt/novo/projeto", "en/new/project"})
    public void formulario() {
        this.validator.addIf(!this.usuario.isLogado(), new SimpleMessage("login", "login.necessario"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
    }

    @Get(value = {"pt/projeto/{id}", "en/project/{id}"})
    public void projeto(Long id) {
        Projeto p = this.dao.getPorId(id);
        this.result.include("projeto", p);
    }

    @Post(value = {"pt/salvar/projeto", "en/save/project"})
    public void salvar(Projeto projeto, UploadedFile logo) {
        projeto.setDataCriacao(LocalDate.now().toString());
        projeto.setUsuario(this.usuario.getId());

        try {
            dao.persiste(projeto);
            if (projeto.getId() == null) {
                this.dados.setProjeto(projeto);
                this.dados.setLinguagens(projeto.getLinguagens());
            }
        } catch (HibernateException e) {
            System.err.println("Erro ao tentar salvar projeto........");
            e.printStackTrace();
        }
        this.result.of(this).formulario();
    }

    @Get(value = {"pt/editar/projeto/{id}", "en/edit/project/{id}"})
    public void alterar(Long id) {
        Projeto p = this.dao.getPorId(id);
        this.result.include("projeto", p);
        this.result.of(this).formulario();
    }

    @Delete(value = {"pt/remove/projeto", "en/remove/project"})
    public void remover(Long projeto) {
        try {
            this.dao.deletar(projeto);
            this.result.include("msg", "Projeto removido com sucesso!");
        } catch (Exception e) {
            this.result.include("msg", "Erro ao tentar remover projeto");
        }
        this.result.forwardTo(UsuarioController.class).meusProjetos();
    }

    @Get(value = {"pt/projetos", "en/projects"})
    public void projetos() {
    }

    @Get(value = {"pt/projetos/todos", "en/projects/all"})
    public void projetosTodos() {
        List<Projeto> lista = this.dao.lista();
        this.result.include("projetos", lista);
        this.result.of(this).projetos();
    }

    @Get(value = {"pt/projeto/linguagem/{linguagem}", "en/project/language/{linguagem}"})
    public void getProjetosLinguagem(String linguagem) {
        List lista = this.dao.getProjetoLinguagem(linguagem);
        this.result.include("projetos", lista);
        this.result.forwardTo(this).projetos();
    }

    @Get(value = {"pt/projetos/nome", "en/projects/name"})
    public void getProjetosNome(String busca) {
        List list = this.dao.pesquisarTrecho(busca);
        this.result.include("projetos", list);
        this.result.forwardTo(this).projetos();
    }

    @Get("/paginacao.json")
    public void paginacao() {
        List list = this.dao.getPaginacao(1, 10);
        this.result.use(json()).from(list).serialize();
    }

    public void uploadLogo(Projeto id, UploadedFile logo) {

    }

    @Get("/projetos.json")
    public void getJson(String trecho) {
        if (trecho != null) {
            List list = this.dao.pesquisarTrechoJson(trecho);
            this.result.use(json()).from(list).serialize();
        }
    }

    @Get("/removeLinguagem")
    public void removeLinguagem(Long id) {
        if (this.dao.removeLinguagem(id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removePlataforma")
    public void removePlataforma(Long id) {
        if (this.dao.removePlataforma(id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removeFeed")
    public void removeFeed(Long id) {
        if (this.dao.removeFeed(id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Post("/uploadImagem")
    public void salvaImagem(UploadedFile imagem) {
      this.upload.salva(imagem);
    }

    @Get("/upload/form")
    public void uploadImagem() {
    }
}

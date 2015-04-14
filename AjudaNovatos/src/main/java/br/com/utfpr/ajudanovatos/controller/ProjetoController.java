/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

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

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class ProjetoController {

    private final Result result;
    private final DaoProjeto dao;
    private final UsuarioLogado usuario;
    private final Validator validator;

    @Inject
    public ProjetoController(Result result, DaoProjeto dao, UsuarioLogado user, Validator v) {
        this.result = result;
        this.dao = dao;
        this.usuario = user;
        this.validator = v;
    }

    public ProjetoController() {
        this.result = null;
        this.dao = null;
        this.usuario = null;
        this.validator = null;
    }

    @Get("/projeto/novo")
    public void formulario() {
        this.validator.addIf(!this.usuario.isLogado(), new SimpleMessage("login", "E necessario estar logado!"));
        this.validator.onErrorRedirectTo(UsuarioController.class).login();
    }

    @Get("/projeto/{id}")
    public void projeto(Long id) {
        Projeto p = this.dao.getPorId(id);
        this.result.include("projeto", p);
    }

    @Post("/projeto/salvar")
    public void salvar(Projeto projeto) {        
        projeto.setDataCriacao(LocalDate.now().toString());
        projeto.setUsuario(this.usuario.getId());

        try {
            dao.persiste(projeto);
        } catch (HibernateException e) {
            System.err.println("Erro ao tentar salvar projeto........");
            e.printStackTrace();
        }
        this.result.of(this).formulario();
    }

    @Get("/editar-projeto/{id}")
    public void alterar(Long id) {
        Projeto p = this.dao.getPorId(id);
        this.result.include("projeto", p);
        this.result.of(this).formulario();
    }

    @Delete("/remove-projeto")
    public void remover(Long projeto) {
        try {
            this.dao.deletar(projeto);
            this.result.include("msg", "Projeto removido com sucesso!");
        } catch (Exception e) {
            this.result.include("msg", "Erro ao tentar remover projeto");
        }
        this.result.forwardTo(UsuarioController.class).meusProjetos();
    }

    @Get("/projetos")
    public void projetos() {
    }

    @Get("/projetos/todos")
    public void projetosTodos() {
        List<Projeto> lista = this.dao.lista();
        this.result.include("projetos", lista);
        this.result.of(this).projetos();
    }

    @Get("/projeto/linguagem/{linguagem}")
    public void getProjetosLinguagem(String linguagem) {
        List lista = this.dao.getProjetoLinguagem(linguagem);
        this.result.include("projetos", lista);
        this.result.forwardTo(this).projetos();
    }

    @Post("/projetos/nome")
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
}

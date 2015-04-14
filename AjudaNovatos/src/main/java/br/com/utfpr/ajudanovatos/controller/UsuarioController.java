/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dao.especificos.DaoUsuario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.utfpr.ajudanovatos.entidade.usuario.Usuario;
import br.com.utfpr.ajudanovatos.entidade.usuario.UsuarioLogado;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.HibernateException;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class UsuarioController {

    private final Result result;
    private final DaoUsuario dao;
    private final UsuarioLogado userLogado;
    private final Validator validator;

    @Inject
    public UsuarioController(Result result, DaoUsuario d, UsuarioLogado user, Validator val) {
        this.result = result;
        this.dao = d;
        this.userLogado = user;
        this.validator = val;
    }

    public UsuarioController() {
        this.result = null;
        this.dao = null;
        this.userLogado = null;
        this.validator = null;
    }

    @Get("/usuario/formulario")
    public void formulario() {
        this.result.include("nome", "Tiago Luiz Gomes de Oliveira");
    }

    @Post("/usuario/salvar")
    public void adicionar(Usuario usuario) {
        this.validator.addIf(usuario.getNome().isEmpty(), new SimpleMessage("nome", "Nome inválido!"));
        validator.onErrorRedirectTo(this).formulario();
        this.validator.addIf(usuario.getEmail().isEmpty(), new SimpleMessage("email", "Email inválido!"));
        validator.onErrorRedirectTo(this).formulario();
        this.validator.addIf(usuario.getLogin().isEmpty(), new SimpleMessage("login", "Login inválido!"));
        validator.onErrorRedirectTo(this).formulario();
        this.validator.addIf(usuario.getPassword().getSenha().isEmpty(), new SimpleMessage("senha", "Senha inválida!"));
        validator.onErrorRedirectTo(this).formulario();

        try {
            usuario.setId(this.userLogado.getId());
            this.dao.persiste(usuario);
            this.result.include("sucesso", "Usuario salvo com sucesso!");
            this.result.of(IndexController.class).index();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    @Get("/usuario/{id}")
    public void consultar(Long id) {
        Usuario usuario = (Usuario) this.dao.getPorId(id);
        this.result.include("usuario", usuario);
    }

    @Put
    public void alterar() {

    }

    @Delete("/usuario/remove/{id}")
    public void remover(Long id) {
        try {
            Usuario usuario = new Usuario();
            usuario.setId(id);
            this.dao.delete(usuario);
            this.result.include("success", "Usuario removido com sucesso!");
        } catch (Exception e) {
            System.out.println("erro ao tentar excluir");
        }
    }

    @Get("/perfil")
    public void perfil() {
        Usuario usuario = this.dao.getPorId(this.userLogado.getId());
        this.result.include("usuario", usuario);
    }

    @Get("/meus-projetos")
    public void meusProjetos() {
        List projetosUser = this.dao.getProjetosUser(this.userLogado.getId());
        this.result.include("projetosUser", projetosUser);
    }

    @Get("/usuario/login")
    public void login() {

    }
}

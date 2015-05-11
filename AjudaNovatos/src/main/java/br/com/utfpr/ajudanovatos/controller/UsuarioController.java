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

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class UsuarioController {

    @Inject
    private Result result;
    @Inject
    private DaoUsuario dao;
    @Inject
    private UsuarioLogado userLogado;
    @Inject
    private Validator validator;

    @Get(value = {"en/user/form", "pt/usuario/formulario"})
    public void formulario() {
        this.result.include("nome", "Tiago Luiz Gomes de Oliveira");
    }

    @Post(value = {"en/user/save", "pt/usuario/salvar"})
    public void adicionar(Usuario usuario) {
        this.validator.addIf(usuario.getNome() == null, new SimpleMessage("nome", "Nome inválido!"));
        this.validator.addIf(usuario.getEmail() == null, new SimpleMessage("email", "Email inválido!"));
        this.validator.addIf(usuario.getLogin() == null, new SimpleMessage("login", "Login inválido!"));
        this.validator.addIf(usuario.getPassword().getSenha() == null, new SimpleMessage("senha", "Senha inválida!"));
        validator.onErrorRedirectTo(this).formulario();

        this.result.of(IndexController.class).index();
        /*try {
         usuario.setId(this.userLogado.getId());
         this.dao.persiste(usuario);
         } catch (HibernateException e) {
         e.printStackTrace();
         }*/
    }

    @Get(value = {"en/user/{id}", "pt/usuario/{id}"})
    public void consultar(Long id) {
        Usuario usuario = (Usuario) this.dao.getPorId(id);
        this.result.include("usuario", usuario);
    }

    @Put
    public void alterar() {

    }

    @Delete(value = {"en/user/remove/{id}", "pt/usuario/remove/{id}"})
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

    @Get(value = {"en/perfil", "pt/perfil"})
    public void perfil() {
        Usuario usuario = this.dao.getPorId(this.userLogado.getId());
        this.result.include("usuario", usuario);
    }

    @Get(value = {"en/my-projects", "pt/meus-projetos"})
    public void meusProjetos() {
        List projetosUser = this.dao.getProjetosUser(this.userLogado.getId());
        this.result.include("projetosUser", projetosUser);
    }

    @Get(value = {"/pt/usuario/login", "/en/user/login"})
    public void login() {

    }
}

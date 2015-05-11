/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dao.especificos.DaoUsuario;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.utfpr.ajudanovatos.entidade.usuario.Usuario;
import br.com.utfpr.ajudanovatos.entidade.usuario.UsuarioLogado;
import javax.inject.Inject;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class LoginController {

    @Inject
    private Result result;
    @Inject
    private Validator validator;
    @Inject
    private DaoUsuario du;
    @Inject
    private UsuarioLogado ul;

    @Post("/login")
    public void login(String login, String senha) {
        this.validator.addIf(login == null || senha == null, new SimpleMessage("login", "Login ou Senha invalidos"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
        Usuario user = du.getUserAutenticado(login, senha);
        this.validator.addIf(user == null, new SimpleMessage("user-login", "Usuário não encontrado"));
        this.validator.onErrorForwardTo(UsuarioController.class).login();
        if (user != null) {
            this.ul.setLogado(true);
            this.ul.setNome(user.getNome());
            this.ul.setId(user.getId());
        }
        this.result.forwardTo(IndexController.class).index();
    }

    @Path("/logout")
    public void logout() {
        this.ul.setLogado(false);
        this.result.redirectTo(IndexController.class).index();
    }
}

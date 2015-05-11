/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import java.util.Locale;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.jstl.core.Config;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class LocaleController {

    @Inject
    HttpServletRequest request;
    @Inject
    Result resultado;

    @Path("/en")
    public void english() {
        Locale locale = new Locale("en", "US");
        setLocale(locale);
    }

    @Path("/pt")
    public void portugues() {
        Locale locale = new Locale("pt", "BR");
        setLocale(locale);
    }

    private void setLocale(Locale novo) {
        Config.set(request.getSession(), Config.FMT_LOCALE, novo);
        Config.set(request.getSession(), Config.FMT_FALLBACK_LOCALE, novo);
        this.resultado.forwardTo(IndexController.class).index();
    }
}

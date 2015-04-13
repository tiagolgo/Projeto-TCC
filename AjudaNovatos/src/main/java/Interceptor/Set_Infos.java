/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interceptor;

import Dados_Globais.Dados;
import Dao.especificos.DaoProjeto;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Intercepts
@RequestScoped
public class Set_Infos {

    private final HttpServletRequest request;
    private final Dados lang_list;
    private final DaoProjeto dp;

    public Set_Infos() {
        this.request = null;
        this.lang_list = null;
        this.dp = null;
    }

    @Inject
    public Set_Infos(HttpServletRequest request, Dados lang, DaoProjeto dp) {
        this.request = request;
        this.lang_list = lang;
        this.dp = dp;
    }

    @AroundCall
    public void interceptar(SimpleInterceptorStack stack) {
        // código a ser executado antes da lógica
        System.out.println("Interceptando " + request.getRequestURI());
        System.out.println(request.getMethod());

        try {
            if (request.getMethod().equalsIgnoreCase("GET")) {
                this.lang_list.setLinguagens(this.dp.getLinguagens());
                this.lang_list.setTotalProjetos((int) this.dp.projetoCount());
                System.out.println("projetos " + this.lang_list.getTotalProjetos());
            }
        } catch (Exception e) {
        }
        stack.next(); // continua a execução
    }
}

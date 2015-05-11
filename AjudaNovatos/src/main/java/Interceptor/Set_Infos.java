/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interceptor;

import br.com.caelum.vraptor.AfterCall;
import br.com.caelum.vraptor.Intercepts;
import javax.enterprise.context.RequestScoped;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Intercepts
@RequestScoped
public class Set_Infos {

    @AfterCall
    public void carregarInformacoesProjetos() {
        
    }
    /*
     @Accepts
     public boolean accepts(ControllerMethod metodo) {
     return metodo.getMethod().getName().equals("index");
     }*/
}

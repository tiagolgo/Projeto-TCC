/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.especificos;

import Dao.Dao_Basic;
import br.com.utfpr.ajudanovatos.entidade.usuario.Usuario;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import javax.inject.Inject;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoUtils extends Dao_Basic<Projeto> {

    @Inject
    public DaoUtils(Session sessao){
        session = sessao;
        classe = Usuario.class;
    }
}

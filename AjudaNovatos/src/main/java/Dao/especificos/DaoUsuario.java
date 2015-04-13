/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.especificos;

import Dao.Dao_Basic;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.entidade.usuario.Usuario;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoUsuario extends Dao_Basic {

    @Inject
    public DaoUsuario(Session s) {
        session = s;
        classe = Usuario.class;
    }

    public Usuario getUserAutenticado(String login, String senha) {
        try {
            Criteria c = session.createCriteria(classe);
            c.add(Restrictions.eq("login", login));
            Criteria c2 = c.createCriteria("password");
            c2.add(Restrictions.eq("senha", senha));
            return (Usuario) c.uniqueResult();
        } catch (HibernateException e) {
            return null;
        }
    }

    public List getProjetosUser(Long id) throws HibernateException{
        Criteria c = session.createCriteria(Projeto.class);
        c.add(Restrictions.eq("usuario", id));
        return c.list();
    }
}

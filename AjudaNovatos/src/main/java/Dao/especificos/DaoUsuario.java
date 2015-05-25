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
public class DaoUsuario extends Dao_Basic<Usuario> {

    @Inject
    public DaoUsuario(Session sessao) {
        session = sessao;
        classe = Usuario.class;
    }

    public Usuario usuarioAutenticado(String email, String senha) {
        try {
            Criteria c = session.createCriteria(classe);
            c.add(Restrictions.eq("email", email));
            Criteria c2 = c.createCriteria("password");
            c2.add(Restrictions.eq("senha", senha));
            return (Usuario) c.uniqueResult();
        } catch (HibernateException e) {
            return null;
        }
    }

    public List usuarioProjetos(Long id) throws HibernateException {
        Criteria c = session.createCriteria(Projeto.class);
        c.add(Restrictions.eq("usuario", id));
        return c.list();
    }

    public boolean seUsuarioExiste(String email) {
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.eq("email", email));
        Object r = c.uniqueResult();
        return r != null;
    }

}

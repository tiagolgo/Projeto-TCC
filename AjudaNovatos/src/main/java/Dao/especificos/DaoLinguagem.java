/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.especificos;

import Dao.Dao_Basic;
import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoLinguagem extends Dao_Basic<Linguagem> {

    @Inject
    public DaoLinguagem(Session s) {
        session = s;
        classe = Linguagem.class;
    }

    public List listLinguagens() {
        try {
            Criteria c = session.createCriteria(classe);
            /*ProjectionList prolist = Projections.projectionList();
            prolist.add(Projections.count("texto"), "qtd");
            prolist.add(Projections.groupProperty("texto"), "texto");
            c.setProjection(prolist);
            c.setResultTransformer(Transformers.aliasToBean(LinguagemBean.class));*/
            List l= c.list();
            return l;
        } catch (HibernateException e) {
            System.out.println("Uma excecao ocorreu");
            System.out.println("Causa: "+e.getCause());
            System.out.println("Message: "+e.getMessage());
        }
        return null;
    }

}

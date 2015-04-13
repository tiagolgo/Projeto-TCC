/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.especificos;

import Dao.Dao_Basic;
import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoProjeto extends Dao_Basic<Projeto> {

    @Inject
    public DaoProjeto(Session s) {
        session = s;
        classe = Projeto.class;
    }

    public List getPropriedadesProjetos() {
        Criteria cri = session.createCriteria(classe);
        ProjectionList prolist = Projections.projectionList();
        prolist.add(Projections.property("nome"));
        prolist.add(Projections.property("site"));
        prolist.add(Projections.property("codFonte"));
        prolist.add(Projections.property("gestorBug"));
        cri.setProjection(prolist);
        List list = cri.list();
        return list;
    }

    public List getPaginacao(int inicial, int maximo) {
        try {
            Criteria c = session.createCriteria(classe);
            ProjectionList prolist = Projections.projectionList();
            prolist.add(Projections.property("id"), "id");
            prolist.add(Projections.property("nome"), "nome");
            c.setProjection(prolist);
            c.setFirstResult(inicial);
            c.setMaxResults(maximo);
            c.setResultTransformer(Transformers.aliasToBean(ProjetoBean.class));
            List r = c.list();
            return r;
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List getRecentes() {
        try {
            Criteria c = session.createCriteria(classe);
            ProjectionList prolist = Projections.projectionList();
            prolist.add(Projections.property("id"), "id");
            prolist.add(Projections.property("nome"), "nome");
            c.setProjection(prolist);
            c.addOrder(Order.desc("dataCriacao"));
            c.setMaxResults(10);
            c.setResultTransformer(Transformers.aliasToBean(ProjetoBean.class));
            List list = c.list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List pesquisarTrecho(String trecho) {
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.ilike("nome", trecho, MatchMode.START));
        return c.list();
    }

    public List pesquisarTrechoJson(String trecho) {
        SQLQuery c = session.createSQLQuery("select id, nome from projeto where nome like '" + trecho + "%'");
        return c.list();
    }

    public List getLinguagens() {
        Criteria c = session.createCriteria(Linguagem.class);
        c.setProjection(Projections.projectionList().
                add(Projections.count("texto"), "quantidade").
                add(Projections.groupProperty("texto"), "texto"));
        return c.list();
    }

    public List getProjetoLinguagem(String linguagem) {
        Criteria projeto = session.createCriteria(Projeto.class)
                .createCriteria("linguagens")
                .add(Restrictions.eq("texto", linguagem));
        return projeto.list();
    }

    public Object projetoCount() {
        Criteria c = session.createCriteria(Projeto.class);
        c.setProjection(Projections.rowCount());
        return c.uniqueResult();
    }

    public boolean deletar(Long id) {
        try {
            Query q = session.createQuery("delete from Projeto where id = :codigo");
            q.setParameter("codigo", id);
            q.executeUpdate();
            session.beginTransaction().commit();
            return true;
        } catch (HibernateException e) {
            System.out.println("erro ao deletar ");
            System.out.println(e.getCause());
            return false;
        }
    }

    public boolean removeLinguagem(Long id) {
        try {
            session.createSQLQuery("delete from linguagem where id = " + id).executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removePlataforma(Long id) {
        try {
            session.createSQLQuery("delete from plataforma where id = " + id).executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
    public boolean removeFeed(Long id) {
        System.out.println("feed a ser removido "+id);    
        try {
            SQLQuery q = session.createSQLQuery("delete from feed where id = " + id);
            q.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public void persisteComentario(String classe){
        
    }
}

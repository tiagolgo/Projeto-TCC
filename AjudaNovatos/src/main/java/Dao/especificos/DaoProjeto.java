/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.especificos;

import Dao.Dao_Basic;
import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.projeto.beans.LinguagemBean;
import br.com.utfpr.ajudanovatos.projeto.beans.ProjetoBean;
import java.util.List;
import javax.inject.Inject;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
    public DaoProjeto(Session sessao){
        session = sessao;
        classe = Projeto.class;
    }

    public List listPropriedadesProjetos(){
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

    public List getPaginacao(int inicial, int maximo, boolean ordenar){
        try {
            Criteria c = session.createCriteria(classe);
            ProjectionList prolist = Projections.projectionList();
            prolist.add(Projections.property("id"), "id");
            prolist.add(Projections.property("nome"), "nome");
            prolist.add(Projections.property("logotipo"), "logotipo");
            c.setProjection(prolist);
            if (ordenar) {
                c.addOrder(Order.desc("dataCriacao"));
            }
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

    public List listProjetos(String trecho){
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.ilike("nome", trecho, MatchMode.START));
        return c.list();
    }

    public Projeto buscaPorNome(String nomeProjeto){
        Criteria c = session.createCriteria(classe);
        c.add(Restrictions.eq("nome", nomeProjeto));
        return (Projeto) c.uniqueResult();
    }

    public List pesquisarTrechoJson(String trecho){
        SQLQuery c = session.createSQLQuery("select id, nome from projeto where nome like '"+trecho+"%'");
        return c.list();
    }

    public List listLinguagens(){
        Criteria c = session.createCriteria(Linguagem.class);
        return c.list();
    }

    public List getProjetoLinguagem(String linguagem){
        Criteria projeto = session.createCriteria(classe)
                .createCriteria("linguagens")
                .add(Restrictions.eq("texto", linguagem));
        return projeto.list();
    }

    public Object projetoCount(){
        Criteria c = session.createCriteria(classe);
        c.setProjection(Projections.rowCount());
        return c.uniqueResult();
    }

    public boolean seProjetoExiste(String nome){
        SQLQuery c = session.createSQLQuery("select id from projeto where nome='"+nome+"';");
        return c.uniqueResult()!=null;
    }

    public void persisteLogo(String logo, String projeto) throws HibernateException{
      //  SQLQuery c = session.createSQLQuery("update projeto set logotipo='"+logo+"' where nome='"+projeto+"';");
        SQLQuery c = session.createSQLQuery("update projeto set logotipo='"+logo+"' where nome='"+projeto+"';");
        c.executeUpdate();
        session.beginTransaction().commit();
        session.flush();
    }
}

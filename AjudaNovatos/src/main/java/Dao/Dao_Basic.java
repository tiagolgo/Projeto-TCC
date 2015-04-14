/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 * @author Tiago Luiz Gomes
 * @param <T>
 */
public class Dao_Basic<T> implements Dao<T> {

    protected static Class classe;
    protected static Session session;

    @Override
    public void persiste(T o) throws HibernateException {
        session.saveOrUpdate(o);
        session.beginTransaction().commit();
    }

    @Override
    public T getPorId(Long id) throws HibernateException {
        return (T) session.createCriteria(classe).add(Restrictions.eq("id", id)).uniqueResult();
    }

    @Override
    public boolean delete(T o) throws HibernateException {
        try {
            session.delete(o);
            session.beginTransaction().commit();
            return true;
        } catch (HibernateException e) {
            System.out.println("erro ao deletar ...");
            System.out.println(e.getCause());
            return false;
        }
    }

    @Override
    public List<T> lista() throws HibernateException {
        try {
            return session.createCriteria(classe).list();
        } catch (HibernateException e) {
            return null;
        }
    }

    @Override
    public boolean deletePorId(Long id) throws HibernateException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

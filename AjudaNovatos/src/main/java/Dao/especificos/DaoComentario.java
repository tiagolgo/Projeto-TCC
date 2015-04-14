/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.especificos;

import Dao.Dao_Basic;
import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.inject.Inject;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class DaoComentario extends Dao_Basic<Comentario> {

    @Inject
    public DaoComentario(Session sessao) {
        session = sessao;
        classe = Comentario.class;
    }

    public boolean saveComentario(Long id, String alvo, String autor, String texto, String data) {
        StringBuilder sb = new StringBuilder();
        sb.append("insert into comentario (autor, dataComentario, texto, ").append(alvo).append(") values ('").append(autor).append("','").append(data).append("','").append(texto).append("',").append(id).append(")");
        String sql = sb.toString();
        try {
            SQLQuery query = session.createSQLQuery(sql);
            query.executeUpdate();
            session.beginTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}

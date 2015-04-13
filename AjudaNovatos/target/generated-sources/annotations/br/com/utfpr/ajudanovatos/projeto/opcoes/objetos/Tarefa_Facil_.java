package br.com.utfpr.ajudanovatos.projeto.opcoes.objetos;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Tarefa_Facil.class)
public abstract class Tarefa_Facil_ {

	public static volatile SingularAttribute<Tarefa_Facil, String> texto;
	public static volatile ListAttribute<Tarefa_Facil, Feed> feeds;
	public static volatile SingularAttribute<Tarefa_Facil, Long> id;
	public static volatile ListAttribute<Tarefa_Facil, Comentario> comentarios;

}


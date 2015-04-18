package br.com.utfpr.ajudanovatos.projeto.comentario;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Comentario.class)
public abstract class Comentario_ {

	public static volatile SingularAttribute<Comentario, String> texto;
	public static volatile SingularAttribute<Comentario, String> dataComentario;
	public static volatile SingularAttribute<Comentario, Long> id;
	public static volatile SingularAttribute<Comentario, Integer> nota;
	public static volatile SingularAttribute<Comentario, String> autor;

}


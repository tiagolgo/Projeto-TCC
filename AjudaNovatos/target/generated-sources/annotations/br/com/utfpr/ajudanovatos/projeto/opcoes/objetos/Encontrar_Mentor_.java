package br.com.utfpr.ajudanovatos.projeto.opcoes.objetos;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Encontrar_Mentor.class)
public abstract class Encontrar_Mentor_ {

	public static volatile SingularAttribute<Encontrar_Mentor, String> texto;
	public static volatile SingularAttribute<Encontrar_Mentor, Long> id;
	public static volatile ListAttribute<Encontrar_Mentor, Comentario> comentarios;

}


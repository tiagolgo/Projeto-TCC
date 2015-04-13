package br.com.utfpr.ajudanovatos.projeto.opcoes.objetos;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Lista_Discussao.class)
public abstract class Lista_Discussao_ {

	public static volatile SingularAttribute<Lista_Discussao, String> subscricao;
	public static volatile SingularAttribute<Lista_Discussao, String> informacao;
	public static volatile SingularAttribute<Lista_Discussao, Long> id;
	public static volatile ListAttribute<Lista_Discussao, Comentario> comentarios;

}


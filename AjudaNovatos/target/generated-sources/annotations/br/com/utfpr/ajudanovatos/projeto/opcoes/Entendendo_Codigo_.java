package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Entendendo_Codigo.class)
public abstract class Entendendo_Codigo_ {

	public static volatile SingularAttribute<Entendendo_Codigo, Long> id;
	public static volatile SingularAttribute<Entendendo_Codigo, String> documentacao;
	public static volatile ListAttribute<Entendendo_Codigo, Comentario> comentarios;

}


package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Requisito.class)
public abstract class Requisito_ {

	public static volatile SingularAttribute<Requisito, String> requisitosAdicionais;
	public static volatile SingularAttribute<Requisito, String> requisitosBasico;
	public static volatile SingularAttribute<Requisito, Long> id;
	public static volatile ListAttribute<Requisito, Comentario> comentarios;

}


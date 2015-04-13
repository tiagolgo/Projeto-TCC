package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Submeter_Mudanca.class)
public abstract class Submeter_Mudanca_ {

	public static volatile SingularAttribute<Submeter_Mudanca, String> texto;
	public static volatile SingularAttribute<Submeter_Mudanca, Long> id;
	public static volatile ListAttribute<Submeter_Mudanca, Comentario> comentarios;

}


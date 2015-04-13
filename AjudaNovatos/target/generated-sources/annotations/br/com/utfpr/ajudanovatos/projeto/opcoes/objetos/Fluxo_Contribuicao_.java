package br.com.utfpr.ajudanovatos.projeto.opcoes.objetos;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Fluxo_Contribuicao.class)
public abstract class Fluxo_Contribuicao_ {

	public static volatile SingularAttribute<Fluxo_Contribuicao, String> texto;
	public static volatile SingularAttribute<Fluxo_Contribuicao, Long> id;
	public static volatile ListAttribute<Fluxo_Contribuicao, Comentario> comentarios;

}


package br.com.utfpr.ajudanovatos.projeto.opcoes.objetos;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Pesquisar_Antes.class)
public abstract class Pesquisar_Antes_ {

	public static volatile SingularAttribute<Pesquisar_Antes, String> texto;
	public static volatile SingularAttribute<Pesquisar_Antes, Long> id;
	public static volatile ListAttribute<Pesquisar_Antes, Comentario> comentarios;

}


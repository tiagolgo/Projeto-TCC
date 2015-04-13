package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Configurar_Workspace.class)
public abstract class Configurar_Workspace_ {

	public static volatile SingularAttribute<Configurar_Workspace, String> texto;
	public static volatile SingularAttribute<Configurar_Workspace, Long> id;
	public static volatile ListAttribute<Configurar_Workspace, Comentario> comentarios;

}


package br.com.utfpr.ajudanovatos.projeto.opcoes.objetos;

import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Chat_Irc.class)
public abstract class Chat_Irc_ {

	public static volatile SingularAttribute<Chat_Irc, String> texto;
	public static volatile SingularAttribute<Chat_Irc, Long> id;
	public static volatile ListAttribute<Chat_Irc, Comentario> comentarios;
	public static volatile SingularAttribute<Chat_Irc, String> url;

}


package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Chat_Irc;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Lista_Discussao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Pesquisar_Antes;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Comunicacao.class)
public abstract class Comunicacao_ {

	public static volatile SingularAttribute<Comunicacao, Pesquisar_Antes> pesquisa;
	public static volatile SingularAttribute<Comunicacao, Lista_Discussao> lista;
	public static volatile SingularAttribute<Comunicacao, Long> id;
	public static volatile SingularAttribute<Comunicacao, Chat_Irc> irc;

}


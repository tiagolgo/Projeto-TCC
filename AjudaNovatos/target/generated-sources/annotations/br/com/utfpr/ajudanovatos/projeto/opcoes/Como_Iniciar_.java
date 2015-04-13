package br.com.utfpr.ajudanovatos.projeto.opcoes;

import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Encontrar_Mentor;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Fluxo_Contribuicao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Tarefa_Facil;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Como_Iniciar.class)
public abstract class Como_Iniciar_ {

	public static volatile SingularAttribute<Como_Iniciar, Encontrar_Mentor> mentor;
	public static volatile SingularAttribute<Como_Iniciar, Fluxo_Contribuicao> fluxo;
	public static volatile SingularAttribute<Como_Iniciar, Long> id;
	public static volatile SingularAttribute<Como_Iniciar, Tarefa_Facil> tarefaFacil;

}


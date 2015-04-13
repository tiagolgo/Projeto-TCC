package br.com.utfpr.ajudanovatos.projeto;

import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import br.com.utfpr.ajudanovatos.projeto.infos.Plataforma;
import br.com.utfpr.ajudanovatos.projeto.infos.Repositorio;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Como_Iniciar;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Comunicacao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Configurar_Workspace;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Entendendo_Codigo;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Requisito;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Submeter_Mudanca;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Projeto.class)
public abstract class Projeto_ {

	public static volatile SingularAttribute<Projeto, Repositorio> repositorio;
	public static volatile SingularAttribute<Projeto, String> codFonte;
	public static volatile SingularAttribute<Projeto, String> wiki;
	public static volatile SingularAttribute<Projeto, Entendendo_Codigo> entendendoCodigo;
	public static volatile SingularAttribute<Projeto, Submeter_Mudanca> submeterMudanca;
	public static volatile SingularAttribute<Projeto, String> nome;
	public static volatile SingularAttribute<Projeto, Como_Iniciar> comoIniciar;
	public static volatile SingularAttribute<Projeto, String> descricao;
	public static volatile SingularAttribute<Projeto, String> site;
	public static volatile ListAttribute<Projeto, Plataforma> plataformas;
	public static volatile SingularAttribute<Projeto, Comunicacao> comunicacao;
	public static volatile SingularAttribute<Projeto, String> listaDiscussao;
	public static volatile SingularAttribute<Projeto, String> logotipo;
	public static volatile SingularAttribute<Projeto, Requisito> requisito;
	public static volatile SingularAttribute<Projeto, Long> usuario;
	public static volatile SingularAttribute<Projeto, Configurar_Workspace> configurarWorkspace;
	public static volatile SingularAttribute<Projeto, Long> id;
	public static volatile ListAttribute<Projeto, Linguagem> linguagens;
	public static volatile SingularAttribute<Projeto, String> gestorBug;
	public static volatile SingularAttribute<Projeto, String> dataCriacao;
	public static volatile SingularAttribute<Projeto, String> openHub;

}


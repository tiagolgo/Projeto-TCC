/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexao;

import br.com.utfpr.ajudanovatos.entidade.usuario.Senha;
import br.com.utfpr.ajudanovatos.entidade.usuario.Usuario;
import br.com.utfpr.ajudanovatos.projeto.Projeto;
import br.com.utfpr.ajudanovatos.projeto.comentario.Comentario;
import br.com.utfpr.ajudanovatos.projeto.infos.Linguagem;
import br.com.utfpr.ajudanovatos.projeto.infos.Plataforma;
import br.com.utfpr.ajudanovatos.projeto.infos.Repositorio;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Como_Iniciar;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Comunicacao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Configurar_Workspace;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Entendendo_Codigo;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Requisito;
import br.com.utfpr.ajudanovatos.projeto.opcoes.Submeter_Mudanca;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Chat_Irc;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Encontrar_Mentor;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Feed;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Fluxo_Contribuicao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Lista_Discussao;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Pesquisar_Antes;
import br.com.utfpr.ajudanovatos.projeto.opcoes.objetos.Tarefa_Facil;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
public class ConexaoBanco {

    private SessionFactory factory = null;

    @Produces
    @ApplicationScoped
    public SessionFactory ConexaoBanco(){
        if (this.factory==null) {
            Configuration configuration = new Configuration().configure();
            configuration.addAnnotatedClass(Projeto.class);
            configuration.addAnnotatedClass(Senha.class);
            configuration.addAnnotatedClass(Usuario.class);
            configuration.addAnnotatedClass(Comentario.class);
            configuration.addAnnotatedClass(Linguagem.class);
            configuration.addAnnotatedClass(Plataforma.class);
            configuration.addAnnotatedClass(Repositorio.class);
            configuration.addAnnotatedClass(Como_Iniciar.class);
            configuration.addAnnotatedClass(Comunicacao.class);
            configuration.addAnnotatedClass(Configurar_Workspace.class);
            configuration.addAnnotatedClass(Entendendo_Codigo.class);
            configuration.addAnnotatedClass(Requisito.class);
            configuration.addAnnotatedClass(Submeter_Mudanca.class);
            configuration.addAnnotatedClass(Chat_Irc.class);
            configuration.addAnnotatedClass(Encontrar_Mentor.class);
            configuration.addAnnotatedClass(Feed.class);
            configuration.addAnnotatedClass(Fluxo_Contribuicao.class);
            configuration.addAnnotatedClass(Lista_Discussao.class);
            configuration.addAnnotatedClass(Pesquisar_Antes.class);
            configuration.addAnnotatedClass(Tarefa_Facil.class);
          //  new SchemaExport(configuration).create(true, true); 
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            this.factory = configuration.buildSessionFactory(serviceRegistry);
        }
        return this.factory;
    }

    public void fechaConexao(@Disposes SessionFactory factory){
        factory.close();
    }
}

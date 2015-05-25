/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import Dados_Globais.Dados;
import Dao.especificos.DaoProjeto;
import br.com.utfpr.ajudanovatos.utils.UploadImagem;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import javax.inject.Inject;
import org.hibernate.HibernateException;

/**
 *
 * @author Tiago Luiz Gomes
 */
@Controller
public class UtilsController {

    @Inject
    UploadImagem upload;
    @Inject
    Result result;
    @Inject
    DaoProjeto dao;
    @Inject
    Dados dados;

    @Get("/removeLinguagem")
    public void removeLinguagem(Long id){
        if (this.dao.deletePorId("linguagem", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removePlataforma")
    public void removePlataforma(Long id){
        if (this.dao.deletePorId("plataforma", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Get("/removeFeed")
    public void removeFeed(Long id){
        if (this.dao.deletePorId("feed", id)) {
            this.result.nothing();
        } else {
            this.result.notFound();
        }
    }

    @Post("/uploadImagem")
    public void salvaImagem(UploadedFile imagem, String nomeprojeto){
        String type = imagem.getContentType();
        String ext = type.substring(type.lastIndexOf("/")+1);
        String logolabel = nomeprojeto+"."+ext;
        if (this.upload.gravarImagem(imagem, logolabel)) {
            try {
                this.dao.persisteLogo(logolabel, nomeprojeto);
                this.dados.updateLogo(nomeprojeto, logolabel);
                this.result.redirectTo(IndexController.class).index();
            } catch (HibernateException e) {
                this.result.include("nomeprojeto", nomeprojeto);
                this.result.forwardTo(ProjetoController.class).uploadImagem();
            }
        }
    }

    @Path("/enviarEmail")
    public void enviarMail(){

    }
}

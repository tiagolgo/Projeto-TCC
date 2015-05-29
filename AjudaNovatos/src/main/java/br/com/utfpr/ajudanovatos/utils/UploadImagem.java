/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils;

import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.utfpr.ajudanovatos.controller.ProjetoController;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
public class UploadImagem {

    File pastaImagens;
    ServletContext context;

    public UploadImagem(){
        this.pastaImagens = null;
        this.context = null;
    }

    @Inject
    public UploadImagem(ServletContext context){
        this.context = context;
        if (this.pastaImagens==null) {
           String caminhoImagens = this.context.getRealPath("/images/logo");
            pastaImagens = new File(caminhoImagens);
            //pastaImagens = new File("C:/Projeto-TCC/AjudaNovatos/src/main/webapp/images/logo");
            pastaImagens.mkdir();
            pastaImagens.setWritable(true);
        }
    }

    public boolean gravarImagem(UploadedFile img, String nomelogo){
        File destino = new File(pastaImagens, nomelogo);
        try {
            IOUtils.copy(img.getFile(), new FileOutputStream(destino));
            return true;
        } catch (IOException ex) {
            Logger.getLogger(ProjetoController.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Erro ao copiar imagem", ex);
        }
    }

    public boolean remove(UploadedFile imagem){
        return true;
    }
}

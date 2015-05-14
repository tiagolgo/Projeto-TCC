/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.controller;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
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
public class Upload_File {

    @Inject
    Result result;
    @Inject
    ServletContext context;
    File pastaImagens;

    public void salva(UploadedFile imagem) {
        if (this.pastaImagens == null) {
            String caminhoImagens = context.getRealPath("/WEB-INF/imagens");
            pastaImagens = new File(caminhoImagens);
            pastaImagens.mkdir();
        }
               
        System.out.println("Caminho -> " + pastaImagens.getAbsolutePath());
        File destino = new File(pastaImagens, "produto1.imagem");
        try {
            IOUtils.copy(imagem.getFile(), new FileOutputStream(pastaImagens.getAbsolutePath()));
            System.out.println("Imagem salva com sucesso!");
        } catch (IOException ex) {
            Logger.getLogger(ProjetoController.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Erro ao copiar imagem", ex);
        }
        this.result.redirectTo(ProjetoController.class).uploadImagem();
    }
}

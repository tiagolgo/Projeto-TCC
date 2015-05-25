/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.ajudanovatos.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.ApplicationScoped;

/**
 *
 * @author Tiago Luiz Gomes
 */
@ApplicationScoped
public class EncriptacaoPassword {

    public String encripta(String senha){
        try {
            MessageDigest algoritmo = MessageDigest.getInstance("SHA-256");
            byte[] msg = algoritmo.digest(senha.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : msg) {
                hexString.append(String.format("%02X", 0xFF&b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException|UnsupportedEncodingException ex) {
            Logger.getLogger(EncriptacaoPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

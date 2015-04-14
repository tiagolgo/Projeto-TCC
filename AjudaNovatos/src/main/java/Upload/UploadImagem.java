/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

/**
 *
 * @author Tiago Luiz Gomes
 */
public class UploadImagem {
/*
    private File diretorioImagens;
    private final ServletContext contexto;

    public UploadImagem() {
        this.contexto = null;
        this.diretorioImagens = null;
    }

    @Inject
    public UploadImagem(ServletContext contexto) {
        this.contexto = contexto;
        criaDiretorio();
    }

    private void criaDiretorio() {
        try{
        String caminho = contexto.getRealPath("WEB-INF/logotipos");
        diretorioImagens = new File(caminho);
        diretorioImagens.mkdir();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void salvarImagem(UploadedFile imagem) {
        InputStream logo = imagem.getFile();

        try {
            OutputStream saida = new FileOutputStream(diretorioImagens);
            IOUtils.copy(logo, saida);
            saida.flush();
            saida.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UploadImagem.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UploadImagem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
}

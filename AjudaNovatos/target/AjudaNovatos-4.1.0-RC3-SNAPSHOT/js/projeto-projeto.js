/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// BUSCA NO GOOGLE
$(".google-search").on("submit", function (event) {
    event.preventDefault();
    var dominio = "http://mail.kde.org/pipermail/amarok-devel/";
    var site = "http://mail.kde.org/pipermail/amarok-devel/";
    var texto = $(this).find("input").val();
    if (texto.length > 0) {
        window.open("https://www.google.com.br/?gws_rd=ssl#q=" + texto + "&domains=" + dominio + "&sitesearch=" + site);
    }
});
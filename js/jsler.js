
jQuery(document).ready(function ($) {

    $('a[rel*=facebox]').facebox({

        loadingImage: 'http://www.oyunde.com/images/loading.gif',
        closeImage: 'http://www.oyunde.com/images/kapat.png'

    })

})


(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/tr_TR/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));







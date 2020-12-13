<!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8" />
            <meta http-equiv="Expires" content="0">
            <meta http-equiv="Last-Modified" content="0">
            <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
            <meta http-equiv="Pragma" content="no-cache">
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
            <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
            <link rel="stylesheet" href="public/css/papier.css" />
            <link rel="stylesheet" href="public/css/estilo.css?v=<?php echo time(); ?>" />
            <link rel="shortcut icon" href="public/imgs/hospital-2_icon-icons.com_66067.ico">
            <link rel="stylesheet" href="public/css/hero.css?v=<?php echo time(); ?>" />
            <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
            <script src="public/js/jquery.min.js?v=<?php echo time(); ?>"></script>
            <title>{{page_title}}</title>
            {{foreach css_ref}}
                <link rel="stylesheet" href="{{uri}}" />
            {{endfor css_ref}}
        </head>
        <body>
          <div class="menu">
              
                 
            <div class="brand"><a href="index.php?page=principal">{{page_title}}</a></div>
            <a href="index.php?page=principal"><img src="public/imgs/hospital-2_icon-icons.com_66067.png"></a>
                   
            <ul>
                {{if cartEntries}}
                <li><a href="index.php?page=cartanon"><span class="ion-ios-cart"></span> <span id="cartcounter">{{cartEntries}}</span> </a></li>
                {{endif cartEntries}}
                <li><a href="index.php?page=login">Iniciar Sesión</a></li>
                <li><a href="index.php?page=register">Crear Cuenta</a></li>
                <li><a href="index.php?page=home">Catalogo</a></li>
            </ul>
            <div class="hbtn"> <div>&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div></div>
              
          </div>
            <div class="contenido">
                {{{page_content}}}
            </div>

            <div class="footer">
                <div class="derecho"><a>Derechos Reservados 2020 &copy;</a></div>
                <div class="rounded-social-buttons">
                    <a class="social-button facebook" href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a class="social-button twitter" href="https://www.twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a class="social-button linkedin" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin"></i></a>
                    <a class="social-button youtube" href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
                    <a class="social-button instagram" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            {{foreach js_ref}}
                <script src="{{uri}}"></script>
            {{endfor js_ref}}
            <script>
              $().ready(function(e){
                $(".hbtn").click(function(e){
                  e.preventDefault();
                  e.stopPropagation();
                  $(".menu").toggleClass('open');
                  });
              });
            </script>
        </body>
    </html>

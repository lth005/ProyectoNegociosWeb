
<div class="heropanel">
    <img src="public/imgs/national-cancer-institute-cw2Zn2ZQ9YQ-unsplash.jpg"/>
    <h1>GEM Farma<small style="color:#191970;"> Honduras</small></h1>
    <p>
        Bienvenido a nuestra tienda en linea, aquí encontrara una gran variedad de medicamentos para tu familia.Siendo el principal objetivo contribuir a un cuidado seguro, de alta calidad y a la satisfacción de los clientes, poniendo a la disposición el conocimiento y respaldo del hospital y el cuerpo médico para la dispensación adecuada de los medicamentos indicados.
    </p>
</div>

         <section class="row bg-white">
             
            <section class="row1 tittle">
                        <div class="col1-sm-12-a">
                            <div>
                                <h2>Catalogo</h2>
                            </div>
                        </div>
            </section>
          
                <div>
                    <section class="cards row ">
                        {{foreach productos}}
                        <section class="col-12 col-sm-2 col-md-6  m-padding m-margin">
                            <div class="card col-12 depth-2 m-padding ">
                            <span class="col-sm-12 center depth-1">
                                {{if urlthbprd}}
                                    <img src="{{urlthbprd}}" alt="{{skuprd}} {{dscprd}}" class="imgthumb center" />
                                {{endif urlthbprd}}
                            </span>
                            <span class="col-12 center depth-1 m-padding card-desc bg-blue-grey">
                                <span class="card-side">{{skuprd}}</span>
                
                                <span class="col-12">{{dscprd}}</span>
                            </span>
                            <span class="col-12 center depth-1 m-padding bg-blue-grey">
                                <span class="col-6 m-padding">Disponibles</span>
                
                                <span class="col-6 right m-padding">{{stkprd}}</span>
                                <span class="col-12 bold center m-padding">
                                <a href="index.php?page=addtocart&codprd={{codprd}}"
                                    class="l-padding btn btn-primary col-12 sendToCart">
                                    L {{prcprd}} <span class="ion-plus-circled"></span>
                                </a>
                                </span>
                            </span>
                            </div>
                        </section>
                        {{endfor productos}}
                       
                    </section>
                     <section class="row center s-padding">
                       <a href="index.php?page=home"> <button class="bg-black" id="btnSend">Ver Mas</button></a>
                    </section>
    
                </div>
            
        </section>
        <section>

        </section>
        <section class="row1">
            <div class="col1-sm-6-a">
                <div class="imagen">
                    <a href="#">
                        <img src="public/imgs/hpd.jpg" alt="vacuna">
                    </a>
                </div>
            </div>

            <div class="col1-sm-6-a">
                <div>
                    <h2>Mision</h2>
                   <p>Ofrecer una asistencia sanitaria de calidad, para alcanzar y mantener la salud, ofreciendo servicios farmacéuticos y productos, de forma profesional, servicial y cercana.</p>
                </div>
            </div>
        </section>
        <section class="row1 reverse">
            <div class="col1-sm-6-a">
                <div class="imagen">
                     <a href="#">
                        <img src="public/imgs/national-cancer-institute-cw2Zn2ZQ9YQ-unsplash.jpg" alt="mascota">
                    </a>
                </div>
                </div>
            <div class="col1-sm-6-a">
                <div>
                    <h2>Vision</h2>
                    <p>Con respecto a nuestros usuarios: facilitar un rápido acceso a los productos que precisen, primando los servicios profesionales, para que saquen el máximo beneficio a sus medicamentos.Sobre nuestro equipo: responsabilizarse, respetar y cumplir el trabajo de forma individual, siendo conscientes de la importancia que tiene el trabajo de cada uno para conseguir un equipo eficaz y dinámico</p>
                </div>
            </div>
        </section>
       

<script>
  $().ready(function(){
    $(".sendToCart").click( function(e){
      e.preventDefault();
      e.stopPropagation();
      $.post(
        $(this).attr("href"),
        function( data, success, xqXML ){
          console.log(data);
          if(data.cartAmount && data.cartAmount > 0){
              window.location.reload();
          }
        }
      );
    });
  });
</script>
<style>
  .card{
    position: relative;
  }
  .card-desc{
    height: 4em;
    overflow: scroll;
  }
  .card-side{
      position: absolute;
      top:6em;
      left:1em;
      transform-origin: left top;
      transform: rotate(-90deg);
  }
</style>
   

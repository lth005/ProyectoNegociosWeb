<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>Si eres parte de nuestra familia, Ingresa YA!</h1>
    </div>
  </section>
</header>
<section class="row1">
  <form id="formLogin" action="index.php?page=login" method="POST" class="col-md-6 col-offset-3 card">
    <h2>Inicio de Sesión</h2>
    <input name="returnto" value="{{returnto}}" type="hidden" />
    <input name="tocken" value="{{tocken}}" type="hidden"/>
    <div class="row">
      <label class="col-md-5" for="txtEmail" >Correo Electrónico</label>
      <input class="col-md-7" type="text" name="txtEmail" id="txtEmail" value="{{txtEmail}}"  />
    </div>
    <div class="row">
      <label class="col-md-5" for="txtPswd">Contraseña</label>
      <input class="col-md-7" type="password" name="txtPswd" id="txtPswd" value=""  />
    </div><br/>
    <div class="row">
      <button class="col-md-12 bg-almost-black" id="btnSend"><span class="ion-log-in"></span>&nbsp;Iniciar Sesión</button>
    </div>
    {{if showerrors}}
        <div class="alert alert-danger">
          <ul style="margin-bottom:1em !important;">
            {{foreach errors}}
              <li>
                {{this}}
              </li>
            {{endfor errors}}
          </ul>
        </div>
    {{endif showerrors}}
  </form>
</section>
<script>
  $().ready(
    function(){
      $("#btnSend").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          $("#formLogin").submit();
        });
    }
    );
</script>

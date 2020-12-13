<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>{{modedsc}}</h1>
    </div>
  </section>
</header>
<section class="row1">
  <form class="col-md-6 col-offset-3 card m-margin" method="post" action="index.php?page=principio_activo&mode={{mode}}&idprincipio_activo={{idprincipio_activo}}">
    <input type="hidden" name="mode" value="{{mode}}"/>
    <input type="hidden" name="idprincipio_activo" value="{{idprincipio_activo}}"/>
    <input type="hidden" name="xsstoken" value="{{xsstoken}}"/>
    <div>
    <label class="col-md-5" for="idprincipio_activo">ID Principio Activo</label>
    <input class="col-md-7" {{readonly}} type="text" name="idprincipio_activo" id="idprincipio_activo" value="{{idprincipio_activo}}" placeholder="ID Principio Activo" disabled/>
    </div>
    <div>
    <label class="col-md-5" for="nombre_principio_activo">Nombre de Principio Activo</label>
    <input class="col-md-7" {{readonly}} type="text" name="nombre_principio_activo" id="nombre_principio_activo" value="{{nombre_principio_activo}}" placeholder="Nombre de Principio Activo" />
    </div>
    <div>
      <label class="col-md-5" for="estado">Estado</label>
      <select class="col-md-7" name="estado" id="estado" {{readonly}}>
        <option value="ACT" {{estado_ACT}}>Activo</option>
        <option value="INA" {{estado_INA}}>Inactivo</option>
      </select>
    </div>
    {{if deletemsg}}
      <div class="alert">
        {{deletemsg}}
      </div>
    {{endif deletemsg}}
    <div class="center">
      <button class="bg-almost-black m-margin" id="btnsubmit" name="btnsubmit" type="submit">Enviar</button>
      <button class="bg-almost-black m-margin" id="btncancel">Cancelar</button>
    </div>
  </form>
</section>

<script>
  $().ready(function(){
    $("#btncancel").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      location.assign("index.php?page=principios_activos");
    });
  });
</script>

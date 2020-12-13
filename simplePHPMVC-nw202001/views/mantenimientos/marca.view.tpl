<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>{{modedsc}}</h1>
    </div>
  </section>
</header>
<section class="row1">
  <form class="col-md-6 col-offset-3 card m-margin" method="post" action="index.php?page=marca&mode={{mode}}&id_marca={{id_marca}}">
    <input type="hidden" name="mode" value="{{mode}}"/>
    <input type="hidden" name="id_marca" value="{{id_marca}}"/>
    <input type="hidden" name="xsstoken" value="{{xsstoken}}"/>
    <div>
    <label class="col-md-5" for="id_marca">ID Marca: </label>
    <input class="col-md-7" {{readonly}} type="text" name="id_marca" id="id_marca" value="{{id_marca}}" placeholder="ID Marca" disabled/>
    </div>
    <div>
    <label class="col-md-5" for="nombre_marca">Nombre de Marca: </label>
    <input class="col-md-7" {{readonly}} type="text" name="nombre_marca" id="nombre_marca" value="{{nombre_marca}}" placeholder="Nombre de Marca" />
    </div>
    <div>
      <label class="col-md-5" for="estado">Estado: </label>
      <select class="col-md-7 colorfont" name="estado" id="estado" {{readonly}}>
        <option value="ACT" {{estado_ACT}}>Activo</option>
        <option value="INA" {{estado_INA}}>Inactivo</option>
      </select>
    </div>
    {{if deletemsg}}
      <div class="alert">
        {{deletemsg}}
      </div>
    {{endif deletemsg}}
    <section class="row center">
      <button class="bg-almost-black m-margin" id="btnsubmit" name="btnsubmit" type="submit">Enviar</button>
      <button class="bg-almost-black" id="btncancel">Cancelar</button>
    </section>
  </form>
</section>

<script>
  $().ready(function(){
    $("#btncancel").click(function(e){
      e.preventDefault();
      e.stopPropagation();
      location.assign("index.php?page=marcas");
    });
  });
</script>

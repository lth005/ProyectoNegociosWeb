<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>{{modedsc}}</h1>
    </div>
  </section>
</header>
<section class="row1">
  <form class="col-md-6 col-offset-3 card m-margin" method="post" action="index.php?page=proveedor&mode={{mode}}&idproveedor={{idproveedor}}">
    <input type="hidden" name="mode" value="{{mode}}"/>
    <input type="hidden" name="idproveedor" value="{{idproveedor}}"/>
    <input type="hidden" name="xsstoken" value="{{xsstoken}}"/>
    <div>
    <label class="col-md-5" for="idproveedor">ID del Proveedor</label>
    <input class="col-md-7" {{readonly}} type="text" name="idproveedor" id="idproveedor" value="{{idproveedor}}" placeholder="ID del Proveedor" disabled/>
    </div>
    <div>
    <label class="col-md-5" for="nombre_proveedor">Nombre del Proveedor</label>
    <input class="col-md-7" {{readonly}} type="text" name="nombre_proveedor" id="nombre_proveedor" value="{{nombre_proveedor}}" placeholder="Nombre del Proveedor" />
    </div>
    <div>
      <label class="col-md-5" for="telefono_proveedor">Teléfono Proveedor</label>
      <input class="col-md-7" {{readonly}} type="text" name="telefono_proveedor" id="telefono_proveedor" value="{{telefono_proveedor}}" placeholder="Teléfono Proveedor" />
    </div>
    <div>
      <label class="col-md-5" for="direccion_proveedor">Direccion Proveedor</label>
      <input class="col-md-7" {{readonly}} type="text" name="direccion_proveedor" id="direccion_proveedor" value="{{direccion_proveedor}}" placeholder="Direccion Proveedor" />
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
      location.assign("index.php?page=proveedores");
    });
  });
</script>


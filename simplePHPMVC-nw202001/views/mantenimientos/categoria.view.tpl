<section>
  <header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>{{modedsc}}</h1>
    </div>
  </section>
</header>
  <main class="row1">
    <form action="index.php?page=categoria&mode={{mode}}&ctgcod={{ctgcod}}" method="post" class="col-md-6 col-offset-3 card m-margin">
      <input type="hidden" name="ctgcod" value="{{ctgcod}}" />
      <input type="hidden" name="mode" value="{{mode}}" />
      <input type="hidden" name="token" value="{{token}}"/>
    <div>
      <label class="col-md-5">Código</label>
      <input class="col-md-7"type="text" name="ctgcoddummy" value="{{ctgcod}}" placeholder="Código"
        disabled readonly
        />
    </div>
    <div>
      <label class="col-md-5">Categoría</label>
      <input class="col-md-7" type="text" name="ctgdsc" value="{{ctgdsc}}"
        maxlength="70"  placeholder="Descripción de la Categoría"
         {{if isReadOnly}} disabled readonly {{endif isReadOnly}}
        />
    </div>
    <div>
      <label class="col-md-5">Estado</label>
      <select class="col-md-7" name="ctgest" {{if isReadOnly}} disabled readonly {{endif isReadOnly}}>
        <option value="ACT" {{ctgEstACTTrue}}>Activo</option>
        <option value="INA" {{ctgEstINATrue}} >Inactivo</option>
      </select>
    </div>
    <div class="center m-padding">
      {{if hasAction}}
      <button type="submit" name="btnConfirmar" class="bg-almost-black m-margin">Guardar</button>
      {{endif hasAction}}
      <button id="btnCancelar"  class="bg-almost-black m-margin">Cancelar</button>
    </div>
    </form>
  </main>
</section>
<script>
  $().ready(function(){
    $("#btnCancelar").click(
      function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=categorias");
      }
    );
  });
</script>

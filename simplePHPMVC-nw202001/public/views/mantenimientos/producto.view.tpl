<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>{{modedsc}}</h1>
      </div>
    </section>
  </header>
  <main class="row1">
    <form action="index.php?page=producto&mode={{mode}}&codprd={{codprd}}" method="POST"  class="col-12 col-md-8 col-offset-2 card m-margin">
      <input type="hidden" name="codprd" value="{{codprd}}" />
      <input type="hidden" name="mode" value="{{mode}}" />
      <input type="hidden" name="xsstoken" value="{{xsstoken}}" />

      <div>
      <label for="codprd" class="col-md-3">Código:&nbsp;</label>
      <input class="col-md-9" {{readonly}} type="text" name="codprd" id="codprd" value="{{codprd}}" placeholder="Código" disabled />
      </div>

      <div>
        <label for="skuprd" class="col-12 col-sm-4 col-md-3">Código Interno: &nbsp;</label>
        <input class="col-md-9" {{readonly}} type="text" name="skuprd" value="{{skuprd}}" maxlength=128 placeholder="SKU" />
      </div>

      <div>
        <label for="bcdprd" class="col-12 col-sm-4 col-md-3">Código de Barra: &nbsp;</label>
        <input class="col-md-9" {{readonly}} type="text" name="bcdprd" value="{{bcdprd}}" maxlength="128" placeholder="Código de Barra"/>
      </div>

      <div>
        <label for="typprd" class="col-12 col-sm-4 col-md-3">Tipo: &nbsp;</label>
        <select class="col-md-9" name="typprd" id="typprd" {{readonly}}>
          <option value="RTL" {{typprd_RTL}}>Retail</option>
          <option value="SRV" {{typprd_SRV}}>Servicio</option>
          <option value="ISK" {{typprd_ISK}}>Infinite Stock</option>
        </select>
      </div>

      <div>
        <label for="dscprd" class="col-12 col-sm-4 col-md-3">Descripción Comercial: &nbsp;</label>
        <input class="col-md-9"  {{readonly}} type="text" name="dscprd" value="{{dscprd}}" maxlength="70" placeholder="Descripción Comercial" />
      </div>

      <div>
        <label for="sdscprd" class="col-12 col-sm-4 col-md-3">Descripción Corta: &nbsp;</label>
        <textarea {{readonly}} name="sdscprd" maxlength="255" placeholder="Descripción Corta" class="col-12 col-sm-8 col-md-9">{{sdscprd}}</textarea>
      </div>

      <div>
        <label for="ldscprd" class="col-12 col-sm-4 col-md-3">Descripción Larga: &nbsp;</label>
        <textarea  {{readonly}} name="ldscprd" maxlength="2048" rows=10 placeholder="Descripción Larga" class="col-12 col-sm-8 col-md-9">{{ldscprd}}</textarea>
      </div>

      <div>
        <label for="stkprd" class="col-12 col-sm-4 col-md-3">Stock: &nbsp;</label>
        <input class="col-md-9" {{readonly}} type="number" name="stkprd" value="{{stkprd}}" min="1" placeholder="Unidades Inventario"/>
      </div>

      <div>
        <label for="prcprd" class="col-12 col-sm-4 col-md-3">Precio: &nbsp;</label>
        <input class="col-md-9" {{readonly}} type="text" name="prcprd" value="{{prcprd}}" maxlength="15" placeholder="Precio de Venta"/>
      </div>

      <div>
      <label for="idprincipio_activo" class="col-12 col-sm-4 col-md-3">Principio Activo</label>
      <select class="col-md-9" name="idprincipio_activo" id="idprincipio_activo" {{readonly}}>
       {{foreach principio_activo_cmb}}
          <option value="{{idprincipio_activo}}" {{selected}}>{{nombre_principio_activo}}</option>
       {{endfor principio_activo_cmb}}
      </select>
      </div>

      <div>
      <label for="idproveedor" class="col-12 col-sm-4 col-md-3">Proveedor</label>
      <select class="col-md-9" name="idproveedor" id="idproveedor" {{readonly}}>
       {{foreach proveedor_cmb}}
          <option value="{{idproveedor}}" {{selected}}>{{nombre_proveedor}}</option>
       {{endfor proveedor_cmb}}
      </select>
      </div>

      <div>
      <label for="id_marca" class="col-12 col-sm-4 col-md-3">Marca</label>
      <select class="col-md-9" name="id_marca" id="id_marca" {{readonly}}>
       {{foreach marca_cmb}}
          <option value="{{id_marca}}" {{selected}}>{{nombre_marca}}</option>
       {{endfor marca_cmb}}
      </select>
      </div>

      <div>
      <label for="ctgcod" class="col-12 col-sm-4 col-md-3">Categoria</label>
      <select class="col-md-9" name="ctgcod" id="ctgcod" {{readonly}}>
       {{foreach categoria_cmb}}
          <option value="{{ctgcod}}" {{selected}}>{{ctgdsc}}</option>
       {{endfor categoria_cmb}}
      </select>
      </div>

      <div>
        <label for="urlprd" class="col-12 col-sm-4 col-md-3">URL imagen: &nbsp;</label>
        <input class="col-md-9" {{readonly}} type="text" name="urlprd" value="{{urlprd}}" maxlength="255" placeholder="Imágen de Portada" disabled readonly />
      </div>

      <div>
        <label for="urlthbprd" class="col-12 col-sm-4 col-md-3">URL imagen pequeña: &nbsp;</label>
        <input class="col-md-9" type="text" name="urlthbprd" value="{{urlthbprd}}" maxlength="255" placeholder="Imágen Catálogo" disabled readonly  />
      </div>

      <div>
        <label for="estprd" class="col-12 col-sm-4 col-md-3">Estado: &nbsp;</label>
        <select class="col-md-9" name="estprd" id="estprd" {{readonly}}>
          <option value="ACT" {{estprd_ACT}}>Activo</option>
          <option value="INA" {{estprd_INA}}>Inactivo</option>
          <option value="PLN" {{estprd_PLN}}>Planificación</option>
          <option value="RET" {{estprd_RET}}>Retirado</option>
          <option value="DSC" {{estprd_DSC}}>Descontinuado</option>
        </select>
      </div>

      <div class="center">
        <button id="btnsubmit"type="submit" name="btnsubmit" class="bg-almost-black m-margin">Guardar</button> &nbsp;
        <button id="botCancelar" class="bg-almost-black m-margin">Cancelar</button>
      </div>
    </form>
  </main>
</section>

<script>
  var botCancelar = document.getElementById("botCancelar");

  botCancelar.addEventListener("click", function (e) {
    e.preventDefault();
    e.stopPropagation();

    window.location.assign("index.php?page=productos");
  });
</script>

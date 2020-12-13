<section>
    <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Mantenimiento de Proveedores</h1>
      </div>
    </section>
  </header>
<form action="index.php?page=proveedores" method="post">
<section class="row center m-padding bg-blue">
  <h2 class="colorfont">Filtrar por </h2>
  <div class="col-sm-12 col-md-10">
    <label class="col-sm-12 col-md-3" for="pro_txtfilter">Id Proveedor | Nombre Proveedor</label>
    <input type="text" name="pro_txtfilter" id="pro_txtfilter" value="{{pro_txtfilter}}"
      placeholder="Id Proveedor| Nombre Proveedor" class="col-sm-12 col-md-9"/>
  </div>
  <div class="col-sm-12 col-md-2">
    <button type="submit" name="btnFiltrar" class="bg-almost-black">Actualizar</button>
  </div>
</section>
</form>
<main class="row1">
    <div class="col-12 col-md-8 col-offset-2">
      <table class="full-width">
        <thead class="zebra">
          <tr>
            <th>
              Código
            </th>
            <th>
              Nombre
            </th>
            <th>
              Telefono
            </th>
            <th>
              Dirección
            </th>
            <th>
                  <a class="btn depth-1 s-margin" href="index.php?page=proveedor&mode=INS&idproveedor=0"><span class="ion-plus-circled"></span></a>
            </th>
          </tr>
        </thead>
        <tbody class="zebra">
          {{foreach proveedores}}
            <tr>
              <td>
                {{idproveedor}}
              </td>
              <td>
                {{nombre_proveedor}}
              </td>
              <td>
                {{telefono_proveedor}}
              </td>
              <td>
                {{direccion_proveedor}}
              </td>
                <td class="center">
                <a class="btn depth-1 s-margin" href="index.php?page=proveedor&mode=UPD&idproveedor={{idproveedor}}"><span class="ion-edit"></a> &nbsp;
                <a class="btn depth-1 s-margin" href="index.php?page=proveedor&mode=DSP&idproveedor={{idproveedor}}"><span class="ion-eye"></a>&nbsp;
                
              </td>
            </tr>
            {{endfor proveedores}}
        </tbody>
  </table>
  </div>
  </main>
</section>

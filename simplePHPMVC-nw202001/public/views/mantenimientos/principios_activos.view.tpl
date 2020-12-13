<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Mantenimiento de Principios Activos</h1>
      </div>
    </section>
  </header>
<form action="index.php?page=principios_activos" method="post">
<section class="row center m-padding bg-blue colorfont">
  <h2>Filtrar por</h2>
  <div class="col-sm-12 col-md-10">
    <label class="col-sm-12 col-md-3" for="pro_txtfilter">Id   | Nombre Principio Activo</label>
    <input type="text" name="pro_txtfilter" id="pro_txtfilter" value="{{pro_txtfilter}}"
      placeholder="Id Principio Activo | Nombre Principio Activo" class="col-sm-12 col-md-9"/>
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
              ID Principio Activo 
            </th>
            <th>
              Nombre
            </th>
            <th>
                  <a class="btn depth-1 s-margin" href="index.php?page=principio_activo&mode=INS&idprincipio_activo=0"><span class="ion-plus-circled"></span></a>
            </th>
          </tr>
        </thead>
        <tbody class="zebra">
          {{foreach principios_activos}}
            <tr>
              <td>
                {{idprincipio_activo}}
              </td>
              <td>
                {{nombre_principio_activo}}
              </td>
                <td class="center">
                <a class="btn depth-1 s-margin" href="index.php?page=principio_activo&mode=UPD&idprincipio_activo={{idprincipio_activo}}"><span class="ion-edit"></a> &nbsp;
                <a class="btn depth-1 s-margin" href="index.php?page=principio_activo&mode=DSP&idprincipio_activo={{idprincipio_activo}}"><span class="ion-eye"></a>&nbsp;
              
              </td>
            </tr>
            {{endfor principios_activos}}
        </tbody>
        <tfoot>
        </tfoot>
      </table>
     </div>
  </main>    
</section>

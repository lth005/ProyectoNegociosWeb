<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Historico de Transacciones</h1>
      </div>
    </section>
  </header>
  <section class="center row m-padding bg-blue">
    <form action="index.php?page=historicos" method="post">
        <section class="row">
          <h2 class="colorfont">Filtrar por</h2>
          <div class="col-sm-12 col-md-10">
            <label class="col-sm-12 col-md-3 colorfont" for="h_txtfilter">Usuario | Id Factura</label>
            <input type="text" name="h_txtfilter" id="h_txtfilter" value="{{h_txtfilter}}"
              placeholder="Usuario | Id Factura" class="col-sm-12 col-md-9"/>
          </div>
          <div class="col-sm-12 col-md-2">
            <button type="submit" name="btnFiltrar" class="bg-almost-black">Actualizar</button>
          </div>
        </section>
    </form>
  </section>  
  <main class="row1">
    <div class="col-12 col-md-8 col-offset-2">
      <table class="full-width">
        <thead>
          <tr>
            <th> Cod Factura</th>
            <th>Usuario</th>
            <th>Estado Factura</th>
            <th>Fecha</th>
            <th>Monto pagado</th>
            <th>IVA</th>
            <th>Costo de Envio</th>
            <th>Total</th>
            <th>Forma de pago</th>
          
          </tr>
        </thead>
        <tbody  class="zebra">
          {{foreach historicos}}
            <tr>
              <td>
                {{fctcod}}
              </td>
              <td>
                {{username}}
              </td>
              <td>
                {{fctEst}}
              </td>
              <td>
                {{fctfch}}
              </td>
              <td>
                {{fctMonto}}
              </td>
              <td>
                {{fctIva}}
              </td>
              <td>
                {{fctShip}}
              </td>
              <td>
                {{fctTotal}}
              </td>
            <td>
                {{fctfrmpago}}
              </td>
            </tr>
            {{endfor historicos}}
        </tbody>
      </table>
    </div>
  </main>
</section>
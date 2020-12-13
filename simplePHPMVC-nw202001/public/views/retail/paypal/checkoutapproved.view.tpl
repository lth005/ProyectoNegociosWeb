<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>Datos de Facturacion de : {{userScreenName}}</h1>
    </div>
  </section>
</header>
<section class="row1">
  <section class="col-md-8 col-offset-2">
    <section class="col-md-12">
      <h2>Nombre en Paypal: {{checkoutTitle}}</h2>
      <p>Descripcion: </br>{{checkoutDescription}}</p>
    </section>
    <section class="col-md-12">
      {{error}}
    </section>
    <section class="col-md-12 right">
      <b>Total: </b> <span>{{amount}}</span>
    </section>
  </section>
</section>

<section class="row1">
    <section class="col-12 col-md-8 col-offset-2">
      <table class="full-width">
        <thead>
          <tr>
            <th>Codigo</th>
            <th>Usuario</th>
            <th>Estado</th>
            <th>Fecha</th>
            <th>Monto</th>
            <th>IVA</th>
            <th>Shipping</th>
            <th>Total</th>
            <th>Forma de pago</th>
         
          </tr>
        </thead>
        <tbody class="zebra">
          {{foreach fact}}
          <tr>
            <td>{{fctcod}}</td>
            <td>{{username}}</td>
            <td>{{fctEst}}</td>
            <td >{{fctfch}}</td>
            <td >{{fctMonto}}</td>
            <td>{{fctIva}}</td>
            <td>{{fctShip}}</td>
           <td>{{fctTotal}}</td>
           <td>{{fctfrmpago}}</td>
          </tr>
          {{endfor fact}}
        </tbody>
       
      </table>
    </section>

  </section>
</section>

<section class="row1">
    <section class="col-12 col-md-8 col-offset-2">
      <table class="full-width">
        <thead>
          <tr >
            <th colspan=3>Productos Comprados</th>
          </tr>
          <tr>
            
            <th>Producto</th>
            <th>Cantidad</th>
            <th>Precio</th>
         
          </tr>
        </thead>
        <tbody class="zebra">
          {{foreach detalle}}
          <tr>
            <td>{{fctDsc}}</td>
            <td>{{fctCtd}}</td>
            <td >{{fctPrc}}</td>
          </tr>
          {{endfor detalle}}
        </tbody>
       
      </table>
    </section>

  </section>
</section>

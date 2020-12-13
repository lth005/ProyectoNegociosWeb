<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Mantenimiento de Productos</h1>
      </div>
    </section>
  </header>
<form action="index.php?page=productos" method="post">
<section class="row center m-padding bg-blue colorfont">
  <h2>Filtrar por</h2>
  <div class="col-sm-12 col-md-10">
    <label class="col-sm-12 col-md-3" for="pro_txtfilter">Id Producto | Nombre Principio Activo</label>
    <input type="text" name="pro_txtfilter" id="pro_txtfilter" value="{{pro_txtfilter}}"
      placeholder="Id Producto | Nombre Principio Activo " class="col-sm-12 col-md-9"/>
  </div>
  <div class="col-sm-12 col-md-2">
    <button class="bg-almost-black" type="submit" name="btnFiltrar">Actualizar</button>
  </div>
</section>
</form>
<main class="row1">
  <div class="col-12 col-md-8 col-offset-2">
    <table class="full-width">
      <tr>
        <th>Código</th>
          <th>Descripción</th>
          <th>Código Interno</th>
          <th>Código de Barra</th>
          <th>Stock</th>
          <th>Tipo</th>
          <th>Precio</th>
          <th class="center">Imágen</th>
          <th>Estado</th>
        <th>
              <a class="btn depth-1 s-margin" href="index.php?page=producto&mode=INS&codprd=0"><span class="ion-plus-circled"></span></a>
        </th>
      </tr>
    </thead>
    <tbody class="zebra">
      {{foreach productos}}
        <tr>
         <td>{{codprd}}</td>
          <td>{{dscprd}}</td>
          <td>{{skuprd}}</td>
          <td>{{bcdprd}}</td>
          <td>{{stkprd}}</td>
          <td>{{typprd}}</td>
          <td>{{prcprd}}</td>
          <td class="center">
              {{ifnot urlthbprd}}
                <a href="index.php?page=productimg&codprd={{codprd}}" class="btn depth-1 s-margin"><span class="ion-upload"></span></a>
              {{endifnot urlthbprd}}
              {{if urlthbprd}}
                <a href="index.php?page=productimg&codprd={{codprd}}" class="depth-1 s-margin"><img class="imgthumb" src="{{urlthbprd}}"  alt="{{codprd}} {{dscprd}}"/></span></a>
              {{endif urlthbprd}}
          </td>
          <td>{{estprd}}</td>
            <td class="center">
            <a class="btn depth-1 s-margin" href="index.php?page=producto&mode=UPD&codprd={{codprd}}"><span class="ion-edit"></a> &nbsp;
            <a class="btn depth-1 s-margin" href="index.php?page=producto&mode=DSP&codprd={{codprd}}"><span class="ion-eye"></a>&nbsp;
           
          </td>
        </tr>
        {{endfor productos}}
    </tbody>
    <tfoot>
    </tfoot>
  </table>
</main>


<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Mantenimiento de Marcas</h1>
      </div>
    </section>
  </header>
<form action="index.php?page=marcas" method="post">
<section class="row center m-padding bg-blue colorfont">
  <h2>Filtrar por</h2>
  <div class="col-sm-12 col-md-10">
    <label class="col-sm-12 col-md-3" for="mark_txtfilter">Id Marca | Nombre Marca</label>
    <input type="text" name="mark_txtfilter" id="mark_txtfilter" value="{{mark_txtfilter}}"
      placeholder="Id Marca| Nombre Marca" class="col-sm-12 col-md-9"/>
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
            ID Marca
          </th>
          <th>
            Nombre
          </th>
          <th>
                <a class="btn depth-1 s-margin" href="index.php?page=marca&mode=INS&id_marca=0"><span class="ion-plus-circled"></span></a>
          </th>
        </tr>
      </thead>
      <tbody class="zebra">
        {{foreach marcas}}
          <tr>
            <td>
              {{id_marca}}
            </td>
            <td>
              {{nombre_marca}}
            </td>
              <td class="center">
              <a class="btn depth-1 s-margin" href="index.php?page=marca&mode=UPD&id_marca={{id_marca}}"><span class="ion-edit"></a> &nbsp;
              <a class="btn depth-1 s-margin" href="index.php?page=marca&mode=DSP&id_marca={{id_marca}}"><span class="ion-eye"></a>&nbsp;
              
            </td>
          </tr>
          {{endfor marcas}}
      </tbody>
      <tfoot>
      </tfoot>
    </table>
  </div>
</main>  
</section>

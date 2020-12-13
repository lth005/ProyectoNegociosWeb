<section>
    <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Mantenimiento de Categorías</h1>
      </div>
    </section>
  </header>
  <main class="row1">
    <div class="col-12 col-md-8 col-offset-2">
      <table class="full-width">
        <thead>
          <tr>
            <th>Código</th>
            <th>Categoría</th>
            <th>Estado</th>
            <th class="center"><button id="btnNew"><span class="ion-plus-circled"></span></button></th>
          </tr>
        </thead>
        <tbody class="zebra">
          {{foreach categorias}}
            <tr>
              <td>{{ctgcod}}</td>
              <td>{{ctgdsc}}</td>
              <td>{{ctgest}}</td>
              <td class="center">
                <a class="btn" href="index.php?page=categoria&mode=UPD&ctgcod={{ctgcod}}"><span class="ion-edit"></span></a>
                <a class="btn" href="index.php?page=categoria&mode=DSP&ctgcod={{ctgcod}}"><span class="ion-eye"></span></a>
               
              </td>
            </tr>
            {{endfor categorias}}
        </tbody>
      </table>
    </div>
  </main>
</section>
<script>
  $().ready(
    function(){
      $("#btnNew").click(function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=categoria&mode=INS&ctgcod=0");
      });
    }
  )
</script>

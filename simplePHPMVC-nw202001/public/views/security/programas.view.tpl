<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Gestion de Funciones</h1>
      </div>
    </section>
  </header>
  <div class="row1 depth-1 m-padding">
    <form action="index.php?page=programas" method="post" class="col-md-8 col-offset-2">
        <div class="row s-padding">
          <label class="col-md-1 colorfont" for="fltNombre">Buscar:&nbsp;</label>
          <input type="text" name="fltNombre"  class="col-md-8"
                id="fltNombre" placeholder="Código de la función" value="{{fltNombre}}" />
          <button class="col-md-3 bg-almost-black" id="btnFiltro"><span class="ion-refresh">&nbsp;Actualizar</span></button>
        </div>
    </form>
  </div>
  <main class="row1">
      <div class="col-12 col-md-8 col-offset-2">
        <table class="full-width">
        <thead>
          <tr>
            <th>Código</th>
            <th>Descripción</th>
            <th class="sd-hide">Estado</th>
            <th class="sd-hide">Tipo</th>
            <th><a href="index.php?page=programa&fncod=&mode=INS" class="btn depth-1 s-margin">
              <span class="ion-plus-circled"></span>
              </a></th>
          </tr>
        </thead>
        <tbody class="zebra">
          {{foreach programas}}
          <tr>
            <td>{{fncod}}</td>
            <td>{{fndsc}}</td>
            <td class="sd-hide">{{fnest}}</td>
            <td class="sd-hide">{{fntyp}}</td>
            <td class="center">
              <a href="index.php?page=programa&fncod={{fncod}}&mode=UPD" class="btn depth-1 s-margin"><span class="ion-edit"></span></a>
              <a href="index.php?page=programa&fncod={{fncod}}&mode=DSP" class="btn depth-1 s-margin"><span class="ion-eye"></span></a>
            </td>
          </tr>
          {{endfor programas}}
        </tbody>
      </table>
    </div>
  </main>
</section>    
<script>
    $().ready(
    function(){
      $("#btnFiltro").click(
        function(e){
          e.preventDefault();
          e.stopPropagation();
          document.forms[0].submit();
        }
      );
    }

    );
</script>

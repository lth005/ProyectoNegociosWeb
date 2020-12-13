<section>
  <header>
    <section class="row1 tittle">
      <div class="col1-sm-12-a">
        <h1>Gestion de Usuarios</h1>
      </div>
    </section>
  </header>
<div class="row depth-1 m-padding bg-blue">
  <form action="index.php?page=users" method="post" class="col-md-8 col-offset-2">
      <div class="row s-padding">
        <label class="col-md-1" for="fltEmail">Correo:&nbsp;</label>
        <input type="email" name="fltEmail"  class="col-md-8"
              id="fltEmail" placeholder="correo@electron.ico" value="{{fltEmail}}" />
        <button class="col-md-3 bg-almost-black" id="btnFiltro"><span class="ion-refresh">&nbsp;Actualizar</span></button>
      </div>
  </form>
</div>

<main class="row1">
    <div class="col-12 col-md-8 col-offset-2">
      <table class="full-width">
      <thead>
        <tr>
          <th>Correo</th>
          <th>Nombre</th>
          <th class="sd-hide">Tipo</th>
          <th class="sd-hide">Estado</th>
          <th><a href="index.php?page=user&usrcod=0&mode=INS" class="btn depth-1 s-margin">
            <span class="ion-plus-circled"></span>
            </a></th>
        </tr>
      </thead>
      <tbody class="zebra">
        {{foreach usuarios}}
        <tr>
          <td>{{useremail}}</td>
          <td>{{username}}</td>
          <td class="sd-hide">{{usertipo}}</td>
          <td class="sd-hide">{{userest}}</td>
          <td class="center">
            <a href="index.php?page=user&usrcod={{usercod}}&mode=UPD" class="btn depth-1 s-margin"><span class="ion-edit"></span></a>
            <a href="index.php?page=user&usrcod={{usercod}}&mode=DSP" class="btn depth-1 s-margin"><span class="ion-eye"></span></a>
          </td>
        </tr>
        {{endfor usuarios}}
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


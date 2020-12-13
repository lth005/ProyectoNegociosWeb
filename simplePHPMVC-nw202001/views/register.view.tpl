<header>
  <section class="row1 tittle">
    <div class="col1-sm-12-a">
      <h1>Crear nueva cuenta</h1>
    </div>
  </section>
</header>
<main class="row1">
  <br/>
  <form class="col-md-6 col-offset-3 card" id="formRegister" action="index.php?page=register" method="post" class="col-8 col-offset-2">
    {{if hasErrors}}
        <div class="alert alert-danger">
          <ul>
          {{foreach errors}}
              <li>{{this}}</li>
          {{endfor errors}}
          </ul>
        </div>
    {{endif hasErrors}}
    <input type="hidden" name="token" value="{{token}}" />
    <section class="row">
      <label class="col-4" for="userName">Nombre:</label>
      <input class="col-8" type="userName" name="userName" id="userName" value="{{userName}}" placeholder="Nombre de Cliente" />
      <label class="col-4">Correo Electrónico</label>
      <input class="col-8" type="email" name="userEmail" id="userEmail" value="{{userEmail}}" placeholer="Correo Electrónico"/>
       <span id="userEmailError"></span>
      <label class="col-4">Contraseña</label>
      <input class="col-8" type="password" id="password" name="password" value="{{password}}"
        placeholer="Contraseña"
       />
      <span id="passwordError"></span>
      <label class="col-4">Confirmar Contraseña</label>
       <input class="col-8"  type="password" id="passwordCnf" name="passwordCnf" value="{{passwordCnf}}"
        placeholer="Contraseña"
       />
       <span id="passwordCnfError"></span>
      <span class="col-8 col-offset-4">Mínimo 8 caracteres, un número, una mayúscula y un simbolo especial</span>
    </section>
    <section class="row center">
      <button class="bg-almost-black" id="btnNuevaCuenta">Nueva Cuenta</button>&nbsp;

    </section>
  </form>
  <script>
    $().ready(function(){
      $("#btnNuevaCuenta").click(function(e){
          e.preventDefault();
          e.stopPropagation();
          /* Validaciones */
          email = $("#userEmail").val();
          $("#userEmailError").html('').removeClass('error col-8 col-offset-4');
          password = $("#password").val();
          $("#passwordError").html('').removeClass('error col-8 col-offset-4');
          passwordCnf = $("#passwordCnf").val();
          $("#passwordCnfError").html('').removeClass('error col-8 col-offset-4');
          errors = false;
          if (!isEmailOk(email)) {
            errors = true;
            $("#userEmailError").html('Correo en formato incorrecto.').addClass('error col-8 col-offset-4');
          };
          if (!isNotEmpty(email)) {
            $("#userEmailError").html('Correo en formato incorrecto.').addClass('error col-8 col-offset-4');
            errors = true;
          };
          if (!isPasswordOk(password)) {
            $("#passwordError").html('Contraseña en formato incorrecto.').addClass('error col-8 col-offset-4');
            errors = true;
          };
          if (password!==passwordCnf && isNotEmpty(password)) {
            $("#passwordCnfError").html('Contraseñas no coinciden.').addClass('error col-8 col-offset-4');
            errors = true;
          };
          if (!errors){
            $("#formRegister").submit();
          } else {
            alert('Tiene errores revise e intente de nuevo.')
          }
      });
    });
  </script>
</main>
